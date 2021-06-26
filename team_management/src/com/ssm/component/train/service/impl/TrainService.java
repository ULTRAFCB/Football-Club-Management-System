package com.ssm.component.train.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.component.train.service.ITrainService;
import com.ssm.framework.commonDao.BaseDao;
import com.ssm.framework.commonUtil.PageModel;

@Service
public class TrainService extends BaseDao<Object> implements ITrainService {
	@Override
	public PageModel queryTrainAll(int currPage, int pageSize) {
		return queryTrain(currPage, pageSize);
	}

	@Override
	public List<Map<String, Object>> queryPlayer() {
		return queryPlayerAll();
	}

	@Override
	public <T> boolean regTrain(T entity) throws Exception {
		return save(entity);
	}

	@Override
	public <T> boolean edtTrain(T entity) throws Exception {
		return update(entity);
	}

}
