package com.ssm.component.memo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.memo.service.IMemoService;
import com.ssm.entity.Memo;
import com.ssm.framework.commonUtil.PageModel;

@Controller
@RequestMapping("/memoCtrl")
public class MemoController {
	@Autowired
	private IMemoService MemoService;

	@RequestMapping("/queryMemo")
	public ModelAndView queryMemo(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String page = req.getParameter("currpage");
		String message = req.getParameter("message");
		String mark = req.getParameter("mark");
		String tuserid = (String) (req.getSession().getAttribute("tuserid") + "");
		if (("").equals(message) || message == null) {

		} else {
			modelAndView.addObject("message", message);
		}
		int currPage = 1; // 当前页1
		int pageSize = 10; // 页面大小10
		if (page != null) {
			currPage = Integer.parseInt(page);
		}
		PageModel pageModel = MemoService.queryMemoById(currPage, pageSize, mark, tuserid);
		modelAndView.addObject("pageModel", pageModel);
		modelAndView.setViewName("memo/memo_list");
		return modelAndView;
	}

	@RequestMapping("/regMemo")
	public ModelAndView regMemo(Memo memo) throws Exception {
		String mark = memo.getMark();
		ModelAndView modelAndView = new ModelAndView();
		if (MemoService.regMemo(memo)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/memoCtrl/queryMemo?currpage=1");
		modelAndView.addObject("mark", mark);
		return modelAndView;
	}

	@RequestMapping("/edtMemo")
	public ModelAndView edtMemo(Memo memo) throws Exception {
		String mark = memo.getMark();
		ModelAndView modelAndView = new ModelAndView();
		if (MemoService.edtMemo(memo)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/memoCtrl/queryMemo?currpage=1");
		modelAndView.addObject("mark", mark);
		return modelAndView;
	}
}
