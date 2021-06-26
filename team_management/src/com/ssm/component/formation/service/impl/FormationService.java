package com.ssm.component.formation.service.impl;

import org.springframework.stereotype.Service;

import com.ssm.component.formation.service.IFormationService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.PageModel;

@Service
public class FormationService extends BaseDao<Object> implements IFormationService {
	@Override
	public PageModel queryFormationAll(int currPage, int pageSize) {
		return queryFormation(currPage, pageSize);
	}

	@Override
	public <T> boolean regFormation(T entity) throws Exception {
		return save(entity);
	}

	@Override
	public <T> boolean edtFormation(T entity) throws Exception {
		return update(entity);
	}

	@Override
	public boolean clearFormationStatus() {
		return cleanStatus("formation");
	}
}
