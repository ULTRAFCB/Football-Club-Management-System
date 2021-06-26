package com.ssm.component.summary.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.component.summary.service.ISummaryService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.PageModel;
@Service
public class SummaryService extends BaseDao<Object> implements ISummaryService {
	@Override
	public PageModel querySummaryAll(int currPage, int pageSize){
		return querySummary(currPage, pageSize);
	}
	@Override
	public <T> boolean regSummary(T entity) throws Exception{
		return save(entity);
	}
	@Override
	public <T> boolean edtSummary(T entity) throws Exception{
		return update(entity);
	}
	@Override
	public List<Map<String, Object>> showSummary(){
		return queryAll("summary");
	}
	@Override
	public List<Map<String, Object>> showNotice(){
		return queryAll("notice");
	}
}
