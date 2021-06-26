package com.ssm.component.data.service;

import java.util.List;
import java.util.Map;

import com.ssm.framework.commonUtil.DataUtil;
import com.ssm.framework.commonUtil.PageModel;

public interface IDataService {

	PageModel queryDataAll(int currPage, int pageSize);

	List<Map<String, Object>> queryPlayer();

	<T> boolean regData(T entity) throws Exception;

	<T> boolean edtData(T entity) throws Exception;

	DataUtil querDataSingle(String tuserid);

}
