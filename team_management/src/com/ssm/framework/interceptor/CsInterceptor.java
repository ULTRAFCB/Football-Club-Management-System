package com.ssm.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.Tuser;

public class CsInterceptor implements HandlerInterceptor {
	
	private String[] allowUri;

	public String[] getAllowUri() {
		return allowUri;
	}

	public void setAllowUri(String[] allowUri) {
		this.allowUri = allowUri;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		Tuser user = (Tuser) session.getAttribute("Tuser");
		
		String path = request.getRequestURI();
//		String head = request.getContextPath();
		for (String uri : allowUri) {
			if (path.contains(uri)) {
				return true;
			}
		}
		
		if (user != null) {
			return true;
		}
		// response.sendRedirect(head+"/common/login/login");
		return false;
	}

}
