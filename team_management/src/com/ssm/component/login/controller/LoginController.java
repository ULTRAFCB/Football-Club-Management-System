package com.ssm.component.login.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.login.service.ILoginService;
import com.ssm.entity.Tuser;

@Controller
@RequestMapping("/loginCtrl")
public class LoginController {
	@Autowired()
	private ILoginService Loginservice;

	@ResponseBody
	@RequestMapping("/login")
	public String login(Tuser tuser, HttpSession session) {
		String rname = "-1";
		List<Map<String, Object>> tuserList = Loginservice.loginByUser(tuser);
		if (tuserList.isEmpty()) {
			return "false";
		}
		rname = (String) tuserList.get(0).get("rname");
		if (rname.equals("stop") || rname == "-1") {
			return "stop";
		}
		List<Map<String, Object>> menuList = Loginservice.queryMenuByranme(rname);
		Set<Map<String, Object>> topSet = new HashSet<Map<String, Object>>();
		for (int i = 0; i < menuList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			String zname = menuList.get(i).get("zname").toString();
			String mid = menuList.get(i).get("menuid").toString();
			map.put("mid", mid);
			map.put("zname", zname);
			topSet.add(map);
		}
		int tuserid = (Integer) tuserList.get(0).get("tuserid");
		String realname = (String) tuserList.get(0).get("realname");
		String description = (String) tuserList.get(0).get("description");
		if (("boss").equals(rname)) {
			List<Map<String, Object>> tusertrightList = Loginservice.queryTuserTright();
			session.setAttribute("tusertrightList", tusertrightList);
			List<Map<String, Object>> rnameList = Loginservice.queryAllTright("tright");
			session.setAttribute("rnameList", rnameList);
		}
		List<Map<String, Object>> noticeList = Loginservice.showNotice("notice");
		session.setAttribute("noticeList", noticeList);
		session.setAttribute("trightname", rname);
		session.setAttribute("tuserid", tuserid);
		session.setAttribute("realname", realname);
		session.setAttribute("description", description);
		session.setAttribute("tuserList", tuserList);
		session.setAttribute("topSet", topSet);
		session.setAttribute("menuList", menuList);
		return "true";
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "login/login";
	}

	@RequestMapping("/edtUser")
	public ModelAndView edtUser(Tuser tuser, HttpServletResponse resp, HttpSession session) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		if (Loginservice.edtUser(tuser)) {
			map.put("message", "修改成功!");

		} else {
			map.put("message", "修改失败 请与管理员联系！!");
		}
		login(tuser, session);
		return new ModelAndView("login/edtUser", map);

	}
}
