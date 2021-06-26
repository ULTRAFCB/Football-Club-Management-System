package com.ssm.component.formation.service;

import com.ssm.framework.commonUtil.PageModel;

public interface IFormationService {

	PageModel queryFormationAll(int currPage, int pageSize);

	<T> boolean regFormation(T entity) throws Exception;

	<T> boolean edtFormation(T entity) throws Exception;

	boolean clearFormationStatus();

}
