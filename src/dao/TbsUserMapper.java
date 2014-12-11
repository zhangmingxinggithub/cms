package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import model.TbsUserModel;


/**
 * 
 * <br>
 * <b>功能：</b>定义在这里由Mapper映射文件来实现 私有的<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-5-24 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
public interface TbsUserMapper  {
	public java.util.List<java.util.Map<String,Object>> selectByRoleUrls(java.util.Map<?,?> map) throws Exception;

	/************************** 图表 **************************/
	public List<Map<?,?>> charts(Map<?,?> map) throws SQLException;
	
	public Integer selectByModelCount(TbsUserModel  model) throws Exception;
	public List<TbsUserModel> selectByModel(TbsUserModel model) throws Exception;
	
	public Integer insert(TbsUserModel t) throws Exception;
	public Integer updateByPrimaryKey(TbsUserModel t) throws Exception;
	public Integer deleteByPrimaryKey(Object key) throws Exception;
	public TbsUserModel selectByPrimaryKey(Object key) throws Exception;

	
	public List<TbsUserModel> selectByMap(Map<?, ?>  map) throws Exception;
	
}
