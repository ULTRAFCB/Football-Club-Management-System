package com.ssm.component.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.common.service.ICommonService;

@Controller
@RequestMapping("/commonCtrl")
public class CommonController {
	@Autowired
	private ICommonService CommonService;

	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest req) {
		String tablename = req.getParameter("tablename");
		String action = req.getParameter("action");
		boolean delflag = false;
		String[] gou = req.getParameter("gou").split(",");
		for (String id : gou) {
			delflag = CommonService.deleteCommon(id, tablename);
		}
		ModelAndView modelAndView = new ModelAndView();

		if (!delflag) {
			modelAndView.addObject("message", "删除失败！请与管理员联系");
		} else {
			modelAndView.addObject("message", "删除成功！");
		}
		switch (action) {
		case "tuserStaff":
			modelAndView
			.setViewName("redirect:/tuserCtrl/queryTuser?action=staff&currpage=1");
			break;
		case "tuserPlayer":
			modelAndView
			.setViewName("redirect:/tuserCtrl/queryTuser?action=player&currpage=1");
			break;
		case "tuserStop":
			modelAndView
			.setViewName("redirect:/tuserCtrl/queryTuser?action=stop&currpage=1");
			break;
		case "tuserCoach":
			modelAndView
					.setViewName("redirect:/tuserCtrl/queryTuser?action=coach&currpage=1");
			break;
		case "trightstaff":
			modelAndView
					.setViewName("redirect:/tuserCtrl/queryTright?action=staff&currpage=1");
			break;
		case "trightcoach":
			modelAndView
					.setViewName("redirect:/tuserCtrl/queryTright?action=coach&currpage=1");
			break;
		case "trightplayer":
			modelAndView
					.setViewName("redirect:/tuserCtrl/queryTright?action=player&currpage=1");
			break;
		case "memo":
			modelAndView
					.setViewName("redirect:/memoCtrl/queryMemo?currpage=1&mark=0");
			break;
		case "summary":
			modelAndView
					.setViewName("redirect:/summaryCtrl/querySummary?currpage=1");
			break;
		case "formation":
			modelAndView
					.setViewName("redirect:/formationCtrl/queryFormation?currpage=1");
			break;
		case "train":
			modelAndView
					.setViewName("redirect:/trainCtrl/queryTrain?currpage=1");
			break;
		case "data":
			modelAndView
					.setViewName("redirect:/dataCtrl/queryData?currpage=1");
			break;
		default:
			break;
		}
		return modelAndView;

	}
	@RequestMapping("/changeTright")
	public ModelAndView changeTright(HttpServletRequest req){
		String tuserid = req.getParameter("tuserid");
		String trightid = req.getParameter("trightid");
		String action = req.getParameter("action");
		ModelAndView modelAndView=new ModelAndView();
		boolean delflag = false;
		String[] gou = req.getParameter("gou").split(",");
		if(("").equals(tuserid)||tuserid==null){
		for (String id : gou) {
			delflag = CommonService.changeTrightByid(id, trightid);
		}
		}else{
			delflag =CommonService.changeTrightByid(tuserid, trightid);
		}
		if (!delflag) {
			modelAndView.addObject("message", "操作失败！请与管理员联系");
		} else {
			modelAndView.addObject("message", "操作成功！");
		}
		switch (action) {
		case "trightStop":
			modelAndView.setViewName("redirect:/tuserCtrl/queryTuser?action=stop&currpage=1");
			break;

		default:
			break;
		}
		return modelAndView;
	}
	

}
