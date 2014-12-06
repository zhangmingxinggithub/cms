package controller.admin;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TbsRoleMenuModel;
import model.TbsDepartMentModel;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import service.TbsRoleMenuService;
import service.TbsDepartMentService;
import util.core.ExcelUtil;
import util.core.MethodUtil;
import util.core.PageParams;
import util.spring.MyTimestampPropertyEdit;
import util.spring.SessionUtil;

import com.alibaba.fastjson.JSON;
@Controller
@RequestMapping("/admin/TbsDepartMent/")
public class TbsDepartMentControllerAdmin extends BaseController{	private final static Logger log= Logger.getLogger(TbsDepartMentControllerAdmin.class);
	private static  MethodUtil util = new MethodUtil();
	
	@Autowired
	service.TbsMenuService<model.TbsMenuModel> tbsMenuService;

	// 服务类
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private TbsDepartMentService<TbsDepartMentModel> departMentService; 
	
	
	
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
		return new ModelAndView("admin/TbsDepartMent/index", modelMap);
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
		return "admin/TbsDepartMent/charts";
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
			List<Map<?, ?>> list = departMentService.charts(paramMap);
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
	public String baseDlg(ModelMap modelMap,HttpServletRequest request){
		return "admin/TbsDepartMent/baseDlg";
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
		return "admin/TbsDepartMent/importDlg";
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
		return "admin/TbsDepartMent/searchDlg";
	}
	   
   
   /**
     * 
     * <br>
     * <b>功能：</b>方法功能描述<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-7-31 <br>
     * @param pageParams
     * @param testModel
     * @return
     * @throws Exception
     */
	@RequestMapping("data.html")
	@ResponseBody
	public String data(PageParams pageParams, TbsDepartMentModel testModel) throws Exception {
		System.out.println("pageParams:" + pageParams + "|testModel:" + testModel);
		testModel.getPageUtil().setPaging(true);
		String result = "[]";
		if (pageParams.getPage() != null) {
			try {
				testModel.getPageUtil().setPageId(Integer.parseInt(pageParams.getPage())); // 当前页
			} catch (Exception e) {
				log.error(e);
			}
		}
		if (pageParams.getRows() != null) {
			try {
				testModel.getPageUtil().setPageSize(Integer.parseInt(pageParams.getRows()));// 显示X条
			} catch (Exception e) {
				log.error(e);
			}
		}
		if (pageParams.getSort() != null) {
			try {
				testModel.getPageUtil().setOrderByCondition(pageParams.getSort()); // 排序字段名称
			} catch (Exception e) {
				log.error(e);
			}
		}

		// testModel.getPageUtil().setOrderDirection(true); //true false 表示 正序与倒序
        String str="";
        String suffix = "}";
        if(pageParams.getGridName() != null){
        	str="[";
        	suffix="]}";
        }
		List<TbsDepartMentModel> listTestModel = null;
		StringBuilder center = new StringBuilder();

		if (pageParams.getSearchType() != null) {
			if (pageParams.getSearchType().equals("1")) { // 模糊搜索
				testModel.getPageUtil().setLike(true);
				listTestModel = departMentService.selectByModel(testModel);
				center.append("{\"total\":\"" + testModel.getPageUtil().getRowCount() + "\",\"rows\":"+str);
			} else {
				/*StringBuffer sb = new StringBuffer(); // 高级查询
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
					testModel.getPageUtil().setAndCondition(sb.toString());
					listTestModel = departMentService.selectByModel(testModel);
					center.append("{\"total\":\"" + testModel.getPageUtil().getRowCount() + "\",\"rows\":"+str);
				}*/
			}
		} else {
			if (pageParams.getGridName() == null) {
				listTestModel = departMentService.selectByModel(testModel);
				center.append("{\"total\":\"" + testModel.getPageUtil().getRowCount() + "\",\"rows\":");
				suffix = "}";
			} else {
			}
		}

		if (pageParams.getGridName() == null) { //datagrid
			center.append(JSON.toJSONString(listTestModel));
		} else {
		}
		center.append(suffix);
		result = center.toString();
		System.out.println("json:" + result);
		return result;
	}
	
	@Autowired
	TbsRoleMenuService<TbsRoleMenuModel> tbsRoleMenuService;
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b> 生成树<br>
	 * <b>作者：</b>张明星<br>
	 * <b>日期：</b> 2014-11-28 <br>
	 * @param response
	 * @param tbcTempModel
	 */
	@RequestMapping("json.html")
	@ResponseBody
	public String json(String id) throws Exception {
		List<TbsDepartMentModel> listTestModel = null;
		StringBuffer sb = new StringBuffer();
		if(id == null)
		{
			listTestModel = departMentService.selectBySql("select id ,name ,pid from tbsdepartment where pid=''or pid is null ");
			if (listTestModel != null && listTestModel.size() > 0) 
			{
				Map<String, Object> resultMap =new HashMap<String ,Object>();
				List<Map<String, Object>> lmjson =new ArrayList<Map<String,Object>>();
				resultMap.put("id", "-1");
				resultMap.put("text", "XXX公司");
				resultMap.put("children", getListString(listTestModel));
				lmjson.add(resultMap);
				JSON json=(JSON) JSON.toJSON(lmjson);
				System.out.println("father json==="+json.toJSONString());
				sb.append(json.toString());
		   }
		}		
		else
		{
			List<TbsDepartMentModel> nodeList = departMentService.selectBySql("select id ,name ,pid from tbsdepartment where pid='"+id+"' ");
			JSON json=getListString(nodeList);
			System.out.println("children json=="+json.toString());
			sb.append(json.toString());
		}
		return sb.toString();
	}
	
	public JSON getListString(List<TbsDepartMentModel> nodeList)throws Exception{
		List<Map<String, Object>> lmjson =new ArrayList<Map<String,Object>>();
		for (int i = 0; i < nodeList.size(); i++) {
			Map<String, Object> resultMap =new HashMap<String ,Object>();
			TbsDepartMentModel model = new TbsDepartMentModel();
			model = nodeList.get(i);
			String pid = (String) model.getId();
		    List<TbsDepartMentModel> node = departMentService.selectBySql("select id ,name ,pid from tbsdepartment where pid='"+pid+"' ");
		    if (node.size()>0) {
				resultMap.put("state","closed");
			}
			resultMap.put("id", pid);
			resultMap.put("text", model.getName());
			lmjson.add(resultMap);
		}
		JSON json=(JSON)JSON.toJSON(lmjson);
		return json;
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
	public void testExport(HttpServletResponse response,TbsDepartMentModel testModel) {
		List<TbsDepartMentModel> listTestModel=null;
		try {
			listTestModel=departMentService.selectByModel(testModel);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		ExcelUtil excelUtil = new ExcelUtil();
		Map<String, List<TbsDepartMentModel>> exportMap = new HashMap<String, List<TbsDepartMentModel>>();
		exportMap.put("sheet", listTestModel);
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
	public void testImport(HttpServletRequest request, HttpServletResponse response){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile mf = entity.getValue();
			ExcelUtil excelUtil = new ExcelUtil();
			String[] columnName=new String[]{"id","href","text"};
			try {
				Map<String, List<TbsDepartMentModel>> ml=excelUtil.readExcel(new ByteArrayInputStream(mf.getBytes()), columnName, 2, TbsDepartMentModel.class);
				for(Map.Entry<String, List<TbsDepartMentModel>> map:ml.entrySet()){
					List<TbsDepartMentModel> lt=map.getValue();
					for(int i=0;i<lt.size();i++){
						try {
							departMentService.insert(lt.get(i));
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
	
    /**
     * 
     * <br>
     * <b>功能：</b>增加 TestModel<br>
     * <b>作者：</b>wolf<br>
     * <b>日期：</b> 2012-10-11 <br>
     * @return
     */
	@RequestMapping("add.html")
	public void add(TbsDepartMentModel testModel,HttpServletResponse response){
		testModel.setId(util.getUid());//设置主键
		System.out.println("testModel:"+testModel.toString());
	    try {
			if(departMentService.insert(testModel)>0){
				util.toJsonMsg(response, 0, null);
				return;
			};
		} catch (Exception e) {
			e.printStackTrace();
		}
	    util.toJsonMsg(response, 1, null);
	}

    /**
     * 
     * <br>
     * <b>功能：</b>保存 TestModel<br>
     * <b>作者：</b>wolf<br>
     * <b>日期：</b> 2012-10-11 <br>
     * @return
     */
	@RequestMapping("save.html") 
	public void save(TbsDepartMentModel testModel,HttpServletResponse response){
		try{
		 	if(departMentService.updateByPrimaryKey(testModel)>0){
			    util.toJsonMsg(response, 0, null);
			    return;
			 }
		}catch(Exception e){
			util.toJsonMsg(response, 1, null);
			e.printStackTrace();
		}
	}
	
    /**
     * 
     * <br>
     * <b>功能：</b>删除 TestBean<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-25 <br>
     * @param ids
     * @param response
     */
	@RequestMapping("del.html") 
	public void del(String[] ids,HttpServletResponse response){
		System.out.println("del-ids:"+Arrays.toString(ids));
		try{
			 if(null!=ids && ids.length>0){
				 if(departMentService.deleteByPrimaryKeys(ids)>0){
					 util.toJsonMsg(response, 0, null);
					 return;
				 }
			 }
		}catch(Exception e){
			util.toJsonMsg(response, 1, null);
			log.error(e);
		}
	}
	



}
