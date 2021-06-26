package com.ssm.component.tuser.service;

import java.util.List;
import java.util.Map;

import com.ssm.framework.commonUtil.PageModel;

public interface ITuserService<T> {

	PageModel queryTuserByAction(int currPage, int pageSize, String action);

	boolean reg(T entity) throws Exception;

	List<Map<String, Object>> querySingleById(String tuserid);

	boolean updateSingle(T entity) throws Exception;

	boolean checkTuser(String tablename, String field, String valuename);

	PageModel queryTrightByAction(int currPage, int pageSize, String action);

}
