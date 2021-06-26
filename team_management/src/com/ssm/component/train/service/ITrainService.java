package com.ssm.component.train.service;

import java.util.List;
import java.util.Map;

import com.ssm.framework.commonUtil.PageModel;

public interface ITrainService {

	PageModel queryTrainAll(int currPage, int pageSize);

	<T> boolean regTrain(T entity) throws Exception;

	<T> boolean edtTrain(T entity) throws Exception;

	List<Map<String, Object>> queryPlayer();

}
