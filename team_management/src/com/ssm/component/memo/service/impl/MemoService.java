package com.ssm.component.memo.service.impl;

import org.springframework.stereotype.Service;

import com.ssm.component.memo.service.IMemoService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.PageModel;

@Service
public class MemoService extends BaseDao<Object> implements IMemoService {
	@Override
	public PageModel queryMemoById(int currPage, int pageSize, String mark, String tuserid) {
		return queryMemo(currPage, pageSize, mark, tuserid);
	}

	@Override
	public <T> boolean regMemo(T entity) throws Exception {
		return save(entity);
	}

	@Override
	public <T> boolean edtMemo(T entity) throws Exception {
		return this.update(entity);
	}

}
