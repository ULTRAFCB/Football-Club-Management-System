package com.ssm.component.data.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.data.service.IDataService;
import com.ssm.entity.Data;
import com.ssm.framework.commonUtil.DataUtil;
import com.ssm.framework.commonUtil.PageModel;

@Controller
@RequestMapping("/dataCtrl")
public class DataController {
	@Autowired
	private IDataService DataService;

	@RequestMapping("/queryData")
	public ModelAndView queryData(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
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
		PageModel pageModel = DataService.queryDataAll(currPage, pageSize);
		modelAndView.addObject("pageModel", pageModel);

		modelAndView.setViewName("data/data_list");
		List<Map<String, Object>> playerList = DataService.queryPlayer();
		req.getSession().setAttribute("playerList", playerList);
		return modelAndView;
	}

	@RequestMapping("/regData")
	public ModelAndView regData(Data data) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (DataService.regData(data)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/dataCtrl/queryData?currpage=1");
		return modelAndView;
	}

	@RequestMapping("/edtData")
	public ModelAndView edtData(Data data) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (DataService.edtData(data)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/dataCtrl/queryData?currpage=1");
		return modelAndView;
	}

	@RequestMapping("/showData")
	public @ResponseBody DataUtil showData(HttpServletRequest req) {
		String tuserid = req.getParameter("tuserid");
		DataUtil data = DataService.querDataSingle(tuserid);
		return data;

	}

}
