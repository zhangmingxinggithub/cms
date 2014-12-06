package dao;
/**
 * 
 * <br>
 * <b>功能：</b>定义在这里由Mapper映射文件来实现 私有的<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-5-24 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
public interface TbsMenuMapper<T> extends BaseMapper<T> {
	public java.util.List<java.util.Map<String,Object>> selectByMenuIsMenu(java.util.Map<String,Object> map) throws java.sql.SQLException;
	public java.util.List<java.util.Map<String,Object>> selectByMenuOther(java.util.Map<String,Object> map) throws java.sql.SQLException;
	public java.util.List<T> selectByButtons(java.util.Map<String,Object> map) throws java.sql.SQLException;
}
