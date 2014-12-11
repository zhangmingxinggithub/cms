package service.imp;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import model.BaseModel;
import model.TbsUserModel;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.TbsUserService;
import dao.TbsUserMapper;
/**
 * 
 * <br>
 * <b>功能：</b>用于事物处理<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-4-9 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
@Service("tbsUserService")
public class TbsUserServiceImp  implements TbsUserService{
	@Autowired
    private TbsUserMapper mapper;
		
	public TbsUserMapper getMapper() {
	    return mapper;
	}
	

	public java.util.List<java.util.Map<String,Object>> selectByRoleUrls(java.util.Map<?,?> map) throws Exception{
	    return mapper.selectByRoleUrls(map);
    }
	

	 /**
     * 
     * <br>
     * <b>功能：</b>主键查询<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param key
     * @return
     * @throws Exception
     */
	public TbsUserModel selectByPrimaryKey(Object key) throws Exception {
		return getMapper().selectByPrimaryKey(key);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>主键修改<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param t
     * @throws Exception
     */
	public Integer updateByPrimaryKey(TbsUserModel t) throws Exception {
		return getMapper().updateByPrimaryKey(t);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>主键删除<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param keys
     * @throws Exception
     */
	public Integer deleteByPrimaryKeys(Object... keys) throws Exception {
		int i=0;
		for(Object key:keys){
			i+=getMapper().deleteByPrimaryKey(key);
		}
		return i;
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>插入<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param t
	 * @throws Exception
	 */
	public Integer insert(TbsUserModel t) throws Exception {
		return getMapper().insert(t);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>查询总行数<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param model
     * @return
     * @throws Exception
     */
	public Integer selectByModelCount(TbsUserModel model) throws Exception {
		return getMapper().selectByModelCount(model);
	}

    /**
     * 
     * <br>
     * <b>功能：</b>模型分页<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param model
     * @return
     * @throws Exception
     */
	public List<TbsUserModel> selectByModel(TbsUserModel model) throws Exception {
		if(((BaseModel)model).getPageUtil().getPaging()){
			try {
				((BaseModel)model).getPageUtil().setRowCount(selectByModelCount(model));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return getMapper().selectByModel(model);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>Map查询 <br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param map
     * @return
     * @throws Exception
     */
	public List<TbsUserModel> selectByMap(Map<?, ?> map) throws Exception {
		return getMapper().selectByMap(map);
	}
  

	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>删除一条记录<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-5-24 <br>
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public Integer deleteByPrimaryKey(Object key) throws Exception {
		return getMapper().deleteByPrimaryKey(key);
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>图表<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-7-1 <br>
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public List<Map<?,?>> charts(Map<?,?> map) throws SQLException{
		return getMapper().charts(map);
	}
	


}
