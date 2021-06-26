package com.ssm.component.summary.service;

import java.util.List;
import java.util.Map;

import com.ssm.framework.commonUtil.PageModel;

public interface ISummaryService {

	PageModel querySummaryAll(int currPage, int pageSize);

	<T> boolean regSummary(T entity) throws Exception;

	<T> boolean edtSummary(T entity) throws Exception;

	List<Map<String, Object>> showSummary();

	List<Map<String, Object>> showNotice();

}
