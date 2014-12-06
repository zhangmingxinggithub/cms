package service.imp;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.TbsLoginLogService;
import dao.TbsLoginLogMapper;
/**
 * 
 * <br>
 * <b>功能：</b>用于事物处理<br>
 * <b>作者：</b>Wolf<br>
 * <b>日期：</b> 2013-4-9 <br>
 * <b>版权所有：<b>版权所有(C) 2011，QQ 405645010<br>
 */
@Service("tbsLoginLogService")
public class TbsLoginLogServiceImp<T> extends BaseServiceImp<T> implements TbsLoginLogService<T>{
	@Autowired
    private TbsLoginLogMapper<T> mapper;
		
	public TbsLoginLogMapper<T> getMapper() {
	    return mapper;
	}
	

}
