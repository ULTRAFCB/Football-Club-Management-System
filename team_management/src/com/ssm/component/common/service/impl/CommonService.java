package com.ssm.component.common.service.impl;

import org.springframework.stereotype.Service;

import com.ssm.component.common.service.ICommonService;
import com.ssm.framework.commonDao.BaseDao;

@Service
public class CommonService extends BaseDao<Object> implements ICommonService {
	@Override
	public boolean deleteCommon(String id, String tableName) {
		return deleteById(id, tableName);
	}

	@Override
	public boolean changeTrightByid(String tuserid, String trightid) {
		return changeTright(tuserid, trightid);
	}
}
 