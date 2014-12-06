package test;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;

import service.DictTypeService;
import service.TbsLoginLogService;
import service.TbsMenuService;
import util.core.MethodUtil;
import model.DictTypeModel;
import model.TbsLoginLogModel;
import model.TbsMenuModel;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={"classpath:spring-*.xml"/*,"classpath:spring-mybatis.xml"*/})
public class DictTypeJunitTest {
	MethodUtil util=new MethodUtil();
	Map<String,Object> map=new HashMap<String, Object>();
	@Autowired
	private DictTypeService<DictTypeModel> DictTypeService; 
	DictTypeModel dictTypeModel=new DictTypeModel();
	@Test
    public void add() throws Exception{
    	dictTypeModel.setId("12334");
    	dictTypeModel.setName("性别");
    	dictTypeModel.setTreeid("Sex");
    	dictTypeModel.setDes("性别类型");
    	DictTypeService.insert(dictTypeModel);
    }
	
	@Test
    public void select() throws Exception{
    	List<DictTypeModel> list =DictTypeService.selectByModel(dictTypeModel);
    	System.out.println(list.size());
    }
	
	@Test
    public void update() throws Exception{
		dictTypeModel.setId("12334");
		dictTypeModel.setDes("性别");
    	int a=DictTypeService.updateByPrimaryKey(dictTypeModel);
    	System.out.println(a);
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
