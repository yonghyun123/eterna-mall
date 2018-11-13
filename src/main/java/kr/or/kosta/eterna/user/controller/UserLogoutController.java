package kr.or.kosta.eterna.user.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.dao.UserDao;
import kr.or.kosta.eterna.user.domain.UserRcmd;
import kr.or.kosta.eterna.userRcmd.service.UserRcmdService;
import kr.or.kosta.eterna.userRcmd.service.UserRcmdServiceImpl;

/**
 * 로그아웃 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class UserLogoutController implements Controller {
	
	private UserRcmdService userRcmdService;
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("flag", "popup-message-logout-success");
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userRcmdService = (UserRcmdService)factory.getBean(UserRcmdServiceImpl.class);
		UserRcmd userRcmd = new UserRcmd();
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("loginId")) {
		    	userRcmd.setUserId(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }else if(cookie.getName().equals("0")) {
		    	userRcmd.setLibCount(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }else if(cookie.getName().equals("1")) {
		    	userRcmd.setCleansingCount(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }else if(cookie.getName().equals("2")) {
		    	userRcmd.setSkinCount(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }else if(cookie.getName().equals("3")) {
		    	userRcmd.setLotionCount(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }else if(cookie.getName().equals("4")) {
		    	userRcmd.setSunCount(cookie.getValue());
		    	cookie.setMaxAge(0);
		        response.addCookie(cookie);
		    }
		}
		try {
			System.out.println(userRcmd);
			
			userRcmdService.update(userRcmd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.setView("redirect:/eterna.mall");
		return mav;
	}

}
