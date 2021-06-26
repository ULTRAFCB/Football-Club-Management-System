package com.ssm.component.login.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.component.login.service.ILoginService;
import com.ssm.entity.Tuser;
import com.ssm.framework.commonDao.BaseDao;

@Service
public class LoginService extends BaseDao<Object> implements ILoginService {

	@Override
	public List<Map<String, Object>> loginByUser(Tuser tuser) {
		return login(tuser);
	}

	@Override
	public List<Map<String, Object>> queryMenuByranme(String rname) {
		return queryMenu(rname);
	}

	@Override
	public boolean edtUser(Tuser tuser) throws Exception {
		return update(tuser);
	}

	@Override
	public List<Map<String, Object>> queryTuserTright() {
		return queryTuserAndTright();
	}

	@Override
	public List<Map<String, Object>> queryAllTright(String tablename) {
		return queryAll(tablename);
	}

	@Override
	public List<Map<String, Object>> showNotice(String tablename) {
		return queryAll(tablename);
	}

}