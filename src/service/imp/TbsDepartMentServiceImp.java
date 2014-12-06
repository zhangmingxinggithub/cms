package service.imp;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import model.TbsDepartMentModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.TbsDepartMentService;
import dao.TbsDepartMentMapper;
/**
 * 
 * <br>
 * <b>功能：</b>用于事物处理<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-4-9 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
@Service("departMentService")
public class TbsDepartMentServiceImp<T> extends BaseServiceImp<T> implements TbsDepartMentService<T>{
	@Autowired
    private TbsDepartMentMapper<T> mapper;
		
	public TbsDepartMentMapper<T> getMapper() {
	    return mapper;
	}
	
	@Override
	public List<Map<String, Object>> selectByMenuOther(Map<String, Object> map)
			throws SQLException {
		// TODO Auto-generated method stub
		return mapper.selectByMenuOther(map);

	}
	
	@Override
	public List<T> selectByModel(T model) throws Exception
	{
		List<T> list = super.selectByModel(model);
		if(list != null )
		{
			for(T bean : list)
			{
				TbsDepartMentModel deptBean = (TbsDepartMentModel) bean;
				TbsDepartMentModel pdeptBean = (TbsDepartMentModel) super.selectByPrimaryKey(deptBean.getPid());
				if(pdeptBean == null)
				{
					deptBean.setPname("XXX公司");
				}
				else
				{
					deptBean.setPname(pdeptBean.getName());
				}

			}
		}
		return list;
	}
	
}
