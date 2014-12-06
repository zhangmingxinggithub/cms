package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.DictDataModel;
import model.TbsMenuModel;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import service.DictDataService;
import service.TbsMenuService;
import util.core.MethodUtil;
import util.json.JsonUtil;

import com.alibaba.fastjson.JSON;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={"classpath:spring-*.xml"/*,"classpath:spring-mybatis.xml"*/})
public class DictDataJunitTest {
	MethodUtil util=new MethodUtil();
	Map<String,Object> map=new HashMap<String, Object>();
	@Autowired
	private DictDataService<DictDataModel> DictDataService; 
	DictDataModel dictDataModel=new DictDataModel();
	@Test
    public void add() throws Exception{
		dictDataModel.setId("2222222");
		dictDataModel.setTreeid("Sex");
		dictDataModel.setNodeid("Sex001");
		dictDataModel.setParentnodeid("");
		dictDataModel.setCode("0");
		dictDataModel.setData1("男");
		dictDataModel.setOrders(0);
		DictDataService.insert(dictDataModel);
    }
	
	@Test
    public void select() throws Exception{
    	List list =DictDataService.selectByModel(dictDataModel);
    	System.out.println(list.size());
    	
    }
	
	@Test
    public void update() throws Exception{
		dictDataModel.setId("2222222");
		dictDataModel.setData1("女");
		DictDataService.updateByPrimaryKey(dictDataModel);
    }
	
	@SuppressWarnings("unused")
	@Test
	public void getjson()throws Exception{
		//String id=null;
	    String id="region10";
		List<DictDataModel> listTestModel = null;
		StringBuffer sb = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		if(id == null)
		{
			listTestModel = DictDataService.selectBySql("select nodeid ,parentnodeid ,data1 from dict_data where parentnodeid=''or parentnodeid is null ");
			
			if (listTestModel != null && listTestModel.size() > 0) 
			{
				Map<String, Object> resultMap =new HashMap<String ,Object>();
				List<Map<String, Object>> lmjson =new ArrayList<Map<String,Object>>();

				/*sb.append("[");
				sb.append("{");
				sb.append("\"id\":" + "\"-1\",");
				sb.append("\"text\":" + "\"数据字典表\",");
				sb.append("\"children\":");*/
				resultMap.put("id", "-1");
				resultMap.put("tetx", "数据字典");
				resultMap.put("children", getListString(listTestModel));
				lmjson.add(resultMap);
			//	sb2.append("[");
				/////sb2.append(getListString(listTestModel));
				//sb2 = sb2.delete(sb.length() - 1, sb.length());
				//sb2.append("]");
				JSON json=(JSON) com.alibaba.fastjson.JSON.toJSON(lmjson);
				System.out.println("father json==="+json.toJSONString());
				
				//sb.append(sb2);
				//sb.append("}");
				//sb.append("]");
		   }
		}		
		else
		{
			List<DictDataModel> nodeList = DictDataService.selectBySql("select nodeid ,parentnodeid ,data1 from dict_data where parentnodeid='"+id+"' ");
			//sb.append("[");
			//sb.append(getListString(nodeList));
			//sb = sb.delete(sb.length() - 1, sb.length());
			//sb.append("]");
			JSON json=getListString(nodeList);
			System.out.println("children json=="+json.toString());
			
		}
		//System.out.println("json:" + sb.toString());
	}
	public JSON getListString(List<DictDataModel> nodeList)throws Exception{
		//StringBuffer sb = new StringBuffer();
		List<Map<String, Object>> lmjson =new ArrayList<Map<String,Object>>();
		for (int i = 0; i < nodeList.size(); i++) {
			DictDataModel model = new DictDataModel();
			model = nodeList.get(i);
			String pid = (String) model.getNodeid();
		    List<DictDataModel> node = DictDataService.selectBySql("select nodeid ,parentnodeid ,data1 from dict_data where parentnodeid='"+pid+"' ");
			Map<String, Object> resultMap =new HashMap<String ,Object>();
			if (node.size()>0) {
				resultMap.put("state","closed");
			}
			resultMap.put("id", pid);
			resultMap.put("text", model.getData1());
			//String json=JsonUtil.writeValueAsString(resultMap);
			//sb.append(json).append(",");
			//System.out.println("json==="+json);
			lmjson.add(resultMap);
		}
		//String json=JsonUtil.toJson(lmjson);
		
		JSON json=(JSON) com.alibaba.fastjson.JSON.toJSON(lmjson);
		return json;
	}
	
	@Test
	public void getDataByTreeid()throws Exception{
		 
		DictDataModel model = new DictDataModel();
		model.setTreeid("region");
		List<DictDataModel> node = DictDataService.selectByModel(model);
		for(int i=0;i<node.size();i++){
			DictDataModel m = node.get(i);
			System.out.println(m.getData1());
		}
	}
	
	@Test
	public void getDataByNodeid()throws Exception{
		DictDataModel model = new DictDataModel();
		model.setNodeid("region20");
		List<DictDataModel> node = DictDataService.selectByModel(model);
		for(int i=0;i<node.size();i++){
			DictDataModel m = node.get(i);
			System.out.println(m.getData1());
		}
	}
	
	//@Test
	public void chartsTest(){
	}
	
	//@Test
	public void tbsLoginLogUpdates(){
	}
	
	@Autowired
	TbsMenuService<TbsMenuModel> tbsMenuService;
	@Test
	public void like(){
		TbsMenuModel model=new TbsMenuModel();
		String name="导";
		//model.setName("'%"+name+"%'");
		model.setName(name);
		try {
			List<TbsMenuModel> models=tbsMenuService.selectByModel(model);
			System.out.println(JSON.toJSONString(models));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
