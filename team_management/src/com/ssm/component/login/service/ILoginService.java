package com.ssm.component.login.service;

import java.util.List;
import java.util.Map;

import com.ssm.entity.Tuser;

public interface ILoginService {

	List<Map<String, Object>> loginByUser(Tuser tuser);

	List<Map<String, Object>> queryMenuByranme(String rname);

	boolean edtUser(Tuser tuser) throws Exception;

	List<Map<String, Object>> queryTuserTright();

	List<Map<String, Object>> queryAllTright(String tablename);

	List<Map<String, Object>> showNotice(String tablename);

}
