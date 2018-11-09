package kr.or.kosta.eterna.user.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class UserJoinController implements Controller {
	
	private UserService userService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		ModelAndView mav = new ModelAndView();
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		String id, name, password, email, tel, address;
		HttpSession session = request.getSession();
		User user = null;
		
		id = request.getParameter("user-id");
		name = request.getParameter("user-name");
		password = request.getParameter("passwd");
		email = request.getParameter("user-email");
		tel = request.getParameter("tel");
		address = request.getParameter("zip-code") + "/" 
				+ request.getParameter("street-address") + "/" 
				+ request.getParameter("detail-address");
		
		try {
			if(email.trim().length() != 0) {
				userService.create(new User(id, name, email, password, address, tel));
				user = userService.read(id);
			}
		} catch (Exception e) {
			throw new ServletException("join 실패", e);
		}
		// 토스트 띄우기
		if(user == null) {
			session.setAttribute("flag", "popup-message-join-fail");
		} else {
			session.setAttribute("flag", "popup-message-join-success");
		}
		
		mav.setView("redirect:index.jsp");
		return mav;
	}
}
