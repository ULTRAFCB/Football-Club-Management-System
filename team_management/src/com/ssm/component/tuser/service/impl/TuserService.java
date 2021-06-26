package com.ssm.component.tuser.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.component.tuser.service.ITuserService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.PageModel;

@Service
public class TuserService<T> extends BaseDao<Object> implements ITuserService<T> {
	@Override
	public PageModel queryTuserByAction(int currPage, int pageSize, String action) {
		return queryTuser(currPage, pageSize, action);
	}

	@Override
	public boolean reg(T entity) throws Exception {
		return this.save(entity);
	}

	@Override
	public List<Map<String, Object>> querySingleById(String tuserid) {
		return querySingle(tuserid);
	}

	@Override
	public boolean updateSingle(T entity) throws Exception {
		return update(entity);
	}

	@Override
	public boolean checkTuser(String tablename, String field, String valuename) {
		return checkName(tablename, field, valuename);
	}

	@Override
	public PageModel queryTrightByAction(int currPage, int pageSize, String action) {
		return queryTright(currPage, pageSize, action);
	}

}
