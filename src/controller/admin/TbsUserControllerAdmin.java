package controller.admin;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.TbsUserModel;
import service.TbsUserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import util.spring.MyTimestampPropertyEdit;
import util.spring.SessionUtil;
import util.core.MethodUtil;
import util.core.ExcelUtil;
import util.core.PageParams;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.poi.ss.usermodel.Workbook;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.NameFilter;
import model.TbsRoleUserModel;
import service.TbsRoleUserService;
@Controller
@RequestMapping("/admin/TbsUser/")
public class TbsUserControllerAdmin extends BaseController{	private final static Logger log= Logger.getLogger(TbsUserControllerAdmin.class);
	private static  MethodUtil util = new MethodUtil();
	
	@Autowired
	service.TbsMenuService<model.TbsMenuModel> tbsMenuService;

	// 服务类
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private TbsUserService<TbsUserModel> tbsUserService; 
	
	
	
	@InitBinder//必须有一个参数WebDataBinder 日期类型装换
	public void initBinder(WebDataBinder binder) {
		    binder.registerCustomEditor(Timestamp.class,new MyTimestampPropertyEdit()); //使用自定义属性编辑器
		//  binder.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	

	/**
	 * 
	 * <br>
	 * <b>功能：</b>转向指定的视图<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-6-20 <br>
	 * @return
	 */
	@RequestMapping("index.html")
	public ModelAndView index(String id, ModelMap modelMap, HttpServletRequest request) {
		List<String> buttons = new java.util.ArrayList<String>();
		model.TbsMenuModel tbsMenuModel=new model.TbsMenuModel();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentId", id);
		map.put("orderCondition", "sortNumber");
		System.out.println("id:" + id);
		String isAdmin = (String) SessionUtil.getAttr(request, "isAdmin");
		List<model.TbsMenuModel> list=null;
		try {
			if (null != isAdmin && isAdmin.equals("0")) {// 超管不需要验证权限
				list = tbsMenuService.selectByMap(map);
			} else {
				list = tbsMenuService.selectByButtons(map);
			}
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					tbsMenuModel = list.get(i);
					String button = tbsMenuModel.getButton();
					if (null != button && "null" != button) {
						buttons.add(button);//.replaceAll("&apos;", "'").replaceAll("&quot;", "\"")
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("buttons", buttons);
		return new ModelAndView("admin/TbsUser/index", modelMap);
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>转向指定的视图<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-6-20 <br>
	 * @return
	 */	
	@RequestMapping("charts.html")
	public String charts(){
		return "admin/TbsUser/charts";
	}
	
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>图表<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-7-1 <br>
	 * @param response
	 * @param startTime
	 * @param endTime
	 * @param chartsName
	 * @param type
	 */
	@RequestMapping("chartsJson.html")
	public void chartsJson(HttpServletResponse response,String startTime,String endTime,String chartsName,Integer type) {
		String resultJson="[]";
		String data = null;
		String categories=null;
		String startTimeFormat=null;
		String endTimeFormat=null;
		String groupTimeFormat=null;
		String year="%Y";
		String month="%m";
		String day="%d";
		String hour="%H";
		String minute="%i";
		String second="%s";
		Map<String, String> paramMap = new HashMap<String, String>();
		if(null==chartsName){
			chartsName="line";
		}
		if(null==type){
			type=4;
		}
		switch (type) {
			case 1: //年
				groupTimeFormat = year;
				break;
			case 2://月
				startTimeFormat = year+"-00";
				endTimeFormat = year+"-12";
				groupTimeFormat = year+"-"+month;
				break;
			case 3://日
				startTimeFormat = year+"-"+month+"-01";
				endTimeFormat = year+"-"+month+"-31";
				groupTimeFormat = year+"-"+month+"-"+day;
				break;
			case 4://时
				startTimeFormat = year+"-"+month+"-"+day+" 00";
				endTimeFormat = year+"-"+month+"-"+day+" 24";
				groupTimeFormat = year+"-"+month+"-"+day+" "+hour;
				break;
			case 5://分
				startTimeFormat = year+"-"+month+"-"+day+" "+hour+":01";
				endTimeFormat = year+"-"+month+"-"+day+" "+hour+":59";
				groupTimeFormat = year+"-"+month+"-"+day+" "+hour+":"+minute;
				break;
			case 6://秒
				startTimeFormat = year+"-"+month+"-"+day+" "+hour+":"+minute+":00";
				endTimeFormat = year+"-"+month+"-"+day+" "+hour+":"+minute+":59";
				groupTimeFormat = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
				break;
			default:
				break;
		}
		paramMap.put("startTimeFormat", startTimeFormat);
		paramMap.put("endTimeFormat", endTimeFormat);
		paramMap.put("groupTimeFormat", groupTimeFormat);
		try {
			List<Map<?, ?>> list = tbsUserService.charts(paramMap);
			if(null!=list && list.size()>0){
				System.out.println("list:" + list.size());
				data="\"data\":[";
				categories="\"categories\":[";
				for (int i = 0; i < list.size(); i++) {
					Map<?, ?> map = list.get(i);
					int count = ((Long) map.get("COUNT(*)")).intValue();
					String time = map.get("createTime").toString();
					data+=count+",";
					categories+="\""+time+"\",";
					System.out.println("count:" + count + "|time:" + time);
				}
				data=data.substring(0,data.length()-1);
				data=data+"]";
				categories=categories.substring(0,categories.length()-1);
				categories=categories+"]";
				System.out.println(data);
				System.out.println(categories);
				resultJson="{"+data+","+categories+"}";
				util.toJsonPrint(response, resultJson);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		util.toJsonPrint(response, resultJson);
	}


	/**
	 * 
	 * <br>
	 * <b>功能：</b>转向指定的视图<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-6-20 <br>
	 * @return
	 */
	@RequestMapping("baseDlg.html")
	public String baseDlg(){
		return "admin/TbsUser/baseDlg";
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>转向指定的视图<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-6-20 <br>
	 * @return
	 */
	@RequestMapping("importDlg.html")
	public String importDlg(){
		return "admin/TbsUser/importDlg";
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>转向指定的视图<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-6-20 <br>
	 * @return
	 */
	@RequestMapping("searchDlg.html")
	public String searchDlg(){
		return "admin/TbsUser/searchDlg";
	}
	   
   
   /**
     * 
     * <br>
     * <b>功能：</b>方法功能描述<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-7-31 <br>
     * @param pageParams
     * @param tbsUserModel
     * @return
     * @throws Exception
     */
	@RequestMapping("data.html")
	@ResponseBody
	public String data(PageParams pageParams, TbsUserModel tbsUserModel) throws Exception {
		System.out.println("pageParams:" + pageParams + "|tbsUserModel:" + tbsUserModel);
		tbsUserModel.getPageUtil().setPaging(true);
		String result = "[]";
		if (pageParams.getPage() != null) {
			try {
				tbsUserModel.getPageUtil().setPageId(Integer.parseInt(pageParams.getPage())); // 当前页
			} catch (Exception e) {
				log.error(e);
			}
		}
		if (pageParams.getRows() != null) {
			try {
				tbsUserModel.getPageUtil().setPageSize(Integer.parseInt(pageParams.getRows()));// 显示X条
			} catch (Exception e) {
				log.error(e);
			}
		}
		if (pageParams.getSort() != null) {
			try {
				tbsUserModel.getPageUtil().setOrderByCondition(pageParams.getSort()); // 排序字段名称
			} catch (Exception e) {
				log.error(e);
			}
		}

		// tbsUserModel.getPageUtil().setOrderDirection(true); //true false 表示 正序与倒序
        String str="";
        String suffix = "}";
        if(pageParams.getGridName() != null){
        	str="[";
        	suffix="]}";
        }
		List<TbsUserModel> listTbsUserModel = null;
		StringBuilder center = new StringBuilder();

		if (pageParams.getSearchType() != null) {
			if (pageParams.getSearchType().equals("1")) { // 模糊搜索
				tbsUserModel.getPageUtil().setLike(true);
				listTbsUserModel = tbsUserService.selectByModel(tbsUserModel);
				center.append("{\"total\":\"" + tbsUserModel.getPageUtil().getRowCount() + "\",\"rows\":"+str);
			} else {
				StringBuffer sb = new StringBuffer(); // 高级查询
				String[] searchColumnNameArray = pageParams.getSearchColumnNames().split("\\,");
				String[] searchAndsArray = pageParams.getSearchAnds().split("\\,");
				String[] searchConditionsArray = pageParams.getSearchConditions().split("\\,");
				String[] searchValsArray = pageParams.getSearchVals().split("\\,");
				System.out.println(Arrays.toString(searchColumnNameArray));
				for (int i = 0; i < searchColumnNameArray.length; i++) {
					if (searchColumnNameArray[i].trim().length() > 0 && searchConditionsArray[i].trim().length() > 0) {
						if (i == 0) {
							sb.append(searchColumnNameArray[i].trim() + " " + searchConditionsArray[i].trim() + " '" + searchValsArray[i].trim() + "'");
						} else {
							sb.append(" " + searchAndsArray[i].trim() + " " + searchColumnNameArray[i].trim() + " " + searchConditionsArray[i].trim() + " '" + searchValsArray[i].trim() + "'");
						}
					}
				}
				if (sb.length() > 0) {
					System.out.println("searchCondition:" + sb.toString());
					tbsUserModel.getPageUtil().setAndCondition(sb.toString());
					listTbsUserModel = tbsUserService.selectByModel(tbsUserModel);
					center.append("{\"total\":\"" + tbsUserModel.getPageUtil().getRowCount() + "\",\"rows\":"+str);
				}
			}
		} else {
			if (pageParams.getGridName() == null) {
				listTbsUserModel = tbsUserService.selectByModel(tbsUserModel);
				center.append("{\"total\":\"" + tbsUserModel.getPageUtil().getRowCount() + "\",\"rows\":");
				suffix = "}";
			} else {
			}
		}

		if (pageParams.getGridName() == null) { //datagrid
			center.append(JSON.toJSONString(listTbsUserModel));
		} else {
		}
		center.append(suffix);
		result = center.toString();
		System.out.println("json:" + result);
		return result;
	}
	
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>导出<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-5-31 <br>
	 * @param response
	 * @param tbcTempModel
	 */
	@RequestMapping("export.html")
	public void tbsUserExport(HttpServletResponse response,TbsUserModel tbsUserModel) {
		List<TbsUserModel> listTbsUserModel=null;
		try {
			listTbsUserModel=tbsUserService.selectByModel(tbsUserModel);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		ExcelUtil excelUtil = new ExcelUtil();
		Map<String, List<TbsUserModel>> exportMap = new HashMap<String, List<TbsUserModel>>();
		exportMap.put("sheet", listTbsUserModel);
		Workbook wb = excelUtil.writeExcel2(exportMap, null, 1);
		String filename=util.getDate(1, null)+".xls";
		OutputStream out=null;
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename="+filename);
		//response.addHeader("Content-Length", "");
		try {
			out = response.getOutputStream();
			wb.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>导入<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-5-31 <br>
	 * @param request
	 * @param response
	 */
	@RequestMapping("import.html")
	public void tbsUserImport(HttpServletRequest request, HttpServletResponse response){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile mf = entity.getValue();
			ExcelUtil excelUtil = new ExcelUtil();
			String[] columnName=new String[]{"id","href","text"};
			try {
				Map<String, List<TbsUserModel>> ml=excelUtil.readExcel(new ByteArrayInputStream(mf.getBytes()), columnName, 2, TbsUserModel.class);
				for(Map.Entry<String, List<TbsUserModel>> map:ml.entrySet()){
					List<TbsUserModel> lt=map.getValue();
					for(int i=0;i<lt.size();i++){
						try {
							tbsUserService.insert(lt.get(i));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
				util.toJsonMsg(response, 1, null);
				return;
			}
		}
		util.toJsonMsg(response, 0, null);
	}
	

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////在下面添加自定义的方法///////////////////////////////////
	@Autowired
	TbsRoleUserService<TbsRoleUserModel> tbsRoleUserService;
    /**
     * 
     * <br>
     * <b>功能：</b>保存 TbsUserModel信息<br>
     * <b>作者：</b>wolf<br>
     * <b>日期：</b> 2012-10-11 <br>
     * @return
     */
	@RequestMapping("save.html") 
	@ResponseBody
	public void save(TbsUserModel tbsUserModel,HttpServletResponse response,String ...roleId){
		try{
			  if(tbsUserModel.getId() != null ){
				    TbsRoleUserModel tbsRoleUserModel=new TbsRoleUserModel();
				    tbsRoleUserModel.setUserId(tbsUserModel.getId());
				    tbsRoleUserService.deleteByEntity(tbsRoleUserModel);
				    if(roleId!=null){
				    	for(int i=0;i<roleId.length;i++){
				    		tbsRoleUserModel.setId(util.getUid());
				    		tbsRoleUserModel.setRoleId(roleId[i]);
				    		tbsRoleUserModel.setUserId(tbsUserModel.getId());
				    		tbsRoleUserService.insert(tbsRoleUserModel);
				    	}
				    }
						tbsUserModel.setPassword(util.getDES("desKey!@#", tbsUserModel.getPassword(), 0));
				    tbsUserService.updateByPrimaryKey(tbsUserModel);
					util.toJsonMsg(response, 0, null);
			   }
		      		      
		}catch(Exception e){
			util.toJsonMsg(response, 1, null);
			e.printStackTrace();
		}
	}
	
    /**
     * 
     * <br>
     * <b>功能：</b>删除 TbsUserModel<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-25 <br>
     * @param ids
     * @param response
     */
	@RequestMapping("del.html") 
	public void del(String[] ids,HttpServletResponse response){
		 System.out.println("del-ids:"+Arrays.toString(ids));
		try{
			tbsUserService.deleteByPrimaryKeys(ids);
			TbsRoleUserModel tbsRoleUserModel=new TbsRoleUserModel();
			for(int i=0;i<ids.length;i++){
				tbsRoleUserModel.setUserId(ids[i]);
				tbsRoleUserService.deleteByEntity(tbsRoleUserModel);
			}
			util.toJsonMsg(response, 0, null);
		}catch(Exception e){
			util.toJsonMsg(response, 1, null);
			log.error(e);
		}
	}

	/**
     * 
     * <br>
     * <b>功能：</b>增加操作 TbsUserModel<br>
     * <b>作者：</b>wolf<br>
     * <b>日期：</b> 2012-10-11 <br>
     * @return
     */
	@RequestMapping("add.html")
	public void add(TbsUserModel tbsUserModel,HttpServletResponse response,String ...roleId){
		String id=util.getUid();
		tbsUserModel.setId(id);
		System.out.println("roleId:"+Arrays.toString(roleId));
			try {
				if(roleId!=null){
					TbsRoleUserModel tbsRoleUserModel=new TbsRoleUserModel();
					for(int i=0;i<roleId.length;i++){
						tbsRoleUserModel.setId(util.getUid());
						tbsRoleUserModel.setRoleId(roleId[i]);
						tbsRoleUserModel.setUserId(id);
						tbsRoleUserService.insert(tbsRoleUserModel);
					}
				}
				tbsUserModel.setPassword(util.getDES("desKey!@#", tbsUserModel.getPassword(), 0));
				tbsUserService.insert(tbsUserModel);//入库
				util.toJsonMsg(response, 0, null);
			} catch (Exception e) {
				util.toJsonMsg(response, 1, null);
				e.printStackTrace();
			}
	}
	
	/**
     * 
     * <br>
     * <b>功能：</b>解密<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-7-8 <br>
     * @param response
     * @param password
     * @param type
     */
	@RequestMapping("password.html")
	public void getPassword(HttpServletResponse response, String password, Integer type) {
		if(password!=null){
			if (null == type) {
				util.toJsonMsg(response, 0, util.getDES("desKey!@#", password, 0));
				return;
			} else {
				util.toJsonMsg(response, 0, util.getDES("desKey!@#", password, 1));
				return;
			}
		}
		util.toJsonMsg(response, 0, "");
	}
	


}
