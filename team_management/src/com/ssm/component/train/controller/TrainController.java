package com.ssm.component.train.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.component.train.service.ITrainService;
import com.ssm.entity.Train;
import com.ssm.framework.commonUtil.PageModel;

@Controller
@RequestMapping("trainCtrl")
public class TrainController {
	@Autowired
	private ITrainService TrainService;

	@RequestMapping("/queryTrain")
	public ModelAndView queryTrain(HttpServletRequest req) {
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
		PageModel pageModel = TrainService.queryTrainAll(currPage, pageSize);
		modelAndView.addObject("pageModel", pageModel);

		modelAndView.setViewName("train/train_list");
		List<Map<String, Object>> playerList = TrainService.queryPlayer();
		req.getSession().setAttribute("playerList", playerList);
		return modelAndView;
	}

	@RequestMapping("/regTrain")
	public ModelAndView regTrain(Train train) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (TrainService.regTrain(train)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/trainCtrl/queryTrain?currpage=1");
		return modelAndView;
	}

	@RequestMapping("/edtTrain")
	public ModelAndView edtTrain(Train train) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		if (TrainService.edtTrain(train)) {
			modelAndView.addObject("message", "鎿嶄綔鎴愬姛锛�");
		} else {
			modelAndView.addObject("message", "鎿嶄綔澶辫触,璇蜂笌绠＄悊鍛樿仈绯�!");
		}
		modelAndView.setViewName("redirect:/trainCtrl/queryTrain?currpage=1");
		return modelAndView;
	}
}
