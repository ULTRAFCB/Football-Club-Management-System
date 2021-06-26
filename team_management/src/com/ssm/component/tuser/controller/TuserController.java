package com.ssm.component.tuser.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.login.service.ILoginService;
import com.ssm.component.tuser.service.ITuserService;
import com.ssm.entity.Tright;
import com.ssm.entity.Tuser;
import com.ssm.entity.Tuserrightrelation;
import com.ssm.framework.commonUtil.PageModel;

@Controller
@RequestMapping("/tuserCtrl")
public class TuserController {
	@Autowired
	private ITuserService<Object> TuserService;
	@Autowired
	private ILoginService LoginService;

	@RequestMapping("/queryTuser")
	public ModelAndView queryTuser(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String action = req.getParameter("action");
		String page = req.getParameter("currpage");
		String message = req.getParameter("message");
		if (("").equals(message) || message == null) {

		} else {
			modelAndView.addObject("message", message);
		}
		int currPage = 1; // 当前页1
		int pageSize = 10; // 页面大小10
		
		if (page != null) {
			currPage = Integer.parseInt(page);
		}
		PageModel pageModel = TuserService.queryTuserByAction(currPage, pageSize, action);
		modelAndView.addObject("pageModel", pageModel);
		switch (action) {
		case "coach":
			modelAndView.setViewName("tuser/coach_list");
			break;
		case "player":
			modelAndView.setViewName("tuser/player_list");
			break;
		case "staff":
			modelAndView.setViewName("tuser/staff_list");
			break;
		case "stop":
			modelAndView.setViewName("tuser/stop_list");
			break;

		default:
			break;
		}
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping("checkName")
	public boolean checkName(HttpServletRequest req) {
		String username = req.getParameter("username");
		return TuserService.checkTuser("tuser", "username", username);

	}

	@RequestMapping("/regTuser")
	public ModelAndView regTuser(Tuser tuser, HttpServletRequest req, Tuserrightrelation t) throws Exception {
		int trightID = Integer.parseInt(req.getParameter("trightid"));
		String rname = req.getParameter("rname");
		ModelAndView modelAndView = new ModelAndView();
		if (TuserService.reg(tuser)) {
			List<Map<String, Object>> list = LoginService.loginByUser(tuser);
			if (list == null || list.isEmpty()) {
				modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
				return modelAndView;
			}
			int tuserID = (int) list.get(0).get("tuserid");
			t.setTuserID(tuserID);
			t.setTrightID(trightID);
			if (TuserService.reg(t)) {
				modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
			} else {
				modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
			}
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		switch (rname) {
		case "coach":
			modelAndView.setViewName("redirect:/tuserCtrl/queryTuser?action=coach&currpage=1");
			break;
		case "player":
			modelAndView.setViewName("redirect:/tuserCtrl/queryTuser?action=player&currpage=1");
			break;
		case "stop":
			modelAndView.setViewName("redirect:/tuserCtrl/queryTuser?action=stop&currpage=1");
			break;
		case "staff":
			modelAndView.setViewName("redirect:/tuserCtrl/queryTuser?action=staff&currpage=1");
			break;
		default:
			break;
		}
		return modelAndView;
	}

	@RequestMapping("/showSingle")
	public ModelAndView showSingle(HttpServletRequest req) {
		String tuserid = req.getParameter("tuserID");
		List<Map<String, Object>> singleList = TuserService.querySingleById(tuserid);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("singleList", singleList);
		modelAndView.setViewName("tuser/edtSingle");
		return modelAndView;
	}

	@RequestMapping("/edtSingle")
	public ModelAndView edtSingle(Tuser tuser, Tuserrightrelation t, HttpServletRequest req) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (TuserService.updateSingle(tuser) && TuserService.updateSingle(t)) {
			modelAndView = showSingle(req);
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView = showSingle(req);
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		return modelAndView;
	}

	@RequestMapping("/queryTright")
	public ModelAndView queryTright(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String action = req.getParameter("action");
		String page = req.getParameter("currpage");
		String message = req.getParameter("message");
		if (("").equals(message) || message == null) {

		} else {
			modelAndView.addObject("message", message);
		}
		int currPage = 1; // 当前页1
		int pageSize = 10; // 页面大小10
		if (page != null) {
			currPage = Integer.parseInt(page);
		}
		PageModel pageModel = TuserService.queryTrightByAction(currPage, pageSize, action);
		modelAndView.addObject("pageModel", pageModel);
		modelAndView.addObject("action", action);
		modelAndView.setViewName("tuser/tright_list");

		return modelAndView;
	}

	@RequestMapping("/regTright")
	public ModelAndView regTright(Tright tright) throws Exception {
		String rname = tright.getRname();
		ModelAndView modelAndView = new ModelAndView();
		if (TuserService.reg(tright)) {

			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/tuserCtrl/queryTright?currpage=1");
		modelAndView.addObject("action", rname);
		return modelAndView;
	}

	@RequestMapping("/edtTright")
	public ModelAndView edtTright(Tright tright, HttpServletRequest req) throws Exception {
		String rname = tright.getRname();
		ModelAndView modelAndView = new ModelAndView();
		if (TuserService.updateSingle(tright)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/tuserCtrl/queryTright?currpage=1");
		modelAndView.addObject("action", rname);
		return modelAndView;
	}
}
