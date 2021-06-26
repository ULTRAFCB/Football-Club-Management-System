package com.ssm.component.summary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.summary.service.ISummaryService;
import com.ssm.entity.Notice;
import com.ssm.entity.Summary;
import com.ssm.framework.commonUtil.PageModel;

@Controller
@RequestMapping("/summaryCtrl")
public class SummaryController {
	@Autowired
	private ISummaryService SummaryService;

	@RequestMapping("/querySummary")
	public ModelAndView querySummary(HttpServletRequest req) {
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
		PageModel pageModel = SummaryService.querySummaryAll(currPage, pageSize);
		modelAndView.addObject("pageModel", pageModel);

		modelAndView.setViewName("summary/summary_list");
		return modelAndView;
	}

	@RequestMapping("/regSummary")
	public ModelAndView regSummary(Summary summary) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (SummaryService.regSummary(summary)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/summaryCtrl/querySummary?currpage=1");
		return modelAndView;
	}

	@RequestMapping("/edtSummary")
	public ModelAndView edtSummary(Summary summary, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (SummaryService.edtSummary(summary)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/summaryCtrl/querySummary?currpage=1");
		return modelAndView;
	}

	@RequestMapping("/showSummary")
	public ModelAndView showSummary(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, Object>> summaryList = SummaryService.showSummary();
		modelAndView.addObject("summaryList", summaryList);
		modelAndView.setViewName("summary/summary");
		return modelAndView;
	}
	@RequestMapping("/edtNotice")
	public ModelAndView edtNotice(Notice notice, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (SummaryService.edtSummary(notice)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		List<Map<String, Object>> noticeList = SummaryService.showNotice();
		session.setAttribute("noticeList", noticeList);

		modelAndView.setViewName("summary/edtNotice");
		return modelAndView;
	}
}
