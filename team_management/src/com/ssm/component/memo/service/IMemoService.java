package com.ssm.component.memo.service;

import com.ssm.framework.commonUtil.PageModel;

public interface IMemoService {

	PageModel queryMemoById(int currPage, int pageSize, String mark, String tuserid);

	<T> boolean regMemo(T entity) throws Exception;

	<T> boolean edtMemo(T entity) throws Exception;

}
