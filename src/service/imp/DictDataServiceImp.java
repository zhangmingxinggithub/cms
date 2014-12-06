package service.imp;
import java.util.List;

import model.DictDataModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.DictDataService;
import dao.DictDataMapper;
/**
 * 
 * <br>
 * <b>功能：</b>用于事物处理<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-4-9 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
@Service("DictDataService")
public class DictDataServiceImp<T> extends BaseServiceImp<T> implements DictDataService<T>{
	@Autowired
    private DictDataMapper<T> mapper;
		
	public DictDataMapper<T> getMapper() {
	    return mapper;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> selectByModel(T model) throws Exception
	{
		List<T> list = super.selectByModel(model);
		if(list != null )
		{
			for(T bean : list)
			{
				DictDataModel dataBean = (DictDataModel) bean;
				List<DictDataModel> listdict = (List<DictDataModel>) super.selectBySql("select * from dict_data where nodeid='"+dataBean.getParentnodeid()+"'");
				if(listdict.size()>0){
					DictDataModel pdataBean=listdict.get(0);
					dataBean.setData2(pdataBean.getData1());
				}else{
					dataBean.setData2("");
				}
			}
		}
		return list;
	}
}
