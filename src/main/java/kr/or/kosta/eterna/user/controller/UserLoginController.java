package kr.or.kosta.eterna.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

/**
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class UserLoginController implements Controller {
	
	private UserService userService;
	
	String loginId, password, rememberId;
	Cookie[] cookies;
	PrintWriter out;
	User user;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		loginId = request.getParameter("inputId");
		password = request.getParameter("inputPasswd");
		rememberId = request.getParameter("rememberId");
		
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			user = userService.certify(loginId, password);
		} catch (Exception e) {
			throw new ServletException("login 실패", e);
		}
		// 로그인 못했을 시 에러페이지 처리할 것
		if(user == null) {
			out.println("userNone");
		} else {
			out.println(user);
			Cookie cookie = new Cookie("loginId", loginId);
			response.addCookie(cookie);
		}
		
		if(rememberId != null) {
			Cookie reCookie = new Cookie("rememberId", loginId);
			response.addCookie(reCookie);
		} else {
			if(request.getCookies() != null) {
				cookies = request.getCookies();
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals("rememberId")) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						break;
					}
				}
			}
		}
		return null;
	}
}
