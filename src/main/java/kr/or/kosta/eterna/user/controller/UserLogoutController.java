package kr.or.kosta.eterna.user.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;

/**
 * 로그아웃 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class UserLogoutController implements Controller {
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		session.setAttribute("flag", "popup-message-logout-success");
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("loginId")) {
		  	    cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }
		}
		mav.setView("redirect:/eterna.mall");
		return mav;
	}

}
