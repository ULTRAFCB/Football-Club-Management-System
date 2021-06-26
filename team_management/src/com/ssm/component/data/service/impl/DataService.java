package com.ssm.component.data.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.component.data.service.IDataService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.DataUtil;
import com.ssm.framework.commonUtil.PageModel;

@Service
public class DataService extends BaseDao<Object> implements IDataService {
	@Override
	public PageModel queryDataAll(int currPage, int pageSize) {
		return queryData(currPage, pageSize);
	}

	@Override
	public List<Map<String, Object>> queryPlayer() {
		return queryPlayerAll();
	}

	@Override
	public <T> boolean regData(T entity) throws Exception {
		return save(entity);
	}

	@Override
	public <T> boolean edtData(T entity) throws Exception {
		return update(entity);
	}

	@Override
	public DataUtil querDataSingle(String tuserid) {
		return querySingleData(tuserid);
	}
}
