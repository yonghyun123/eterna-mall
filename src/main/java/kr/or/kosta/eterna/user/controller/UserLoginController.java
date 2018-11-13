package kr.or.kosta.eterna.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
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
	private CartService cartService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		HttpSession session = request.getSession();
		String loginId, password, rememberId;
		Cookie[] cookies;
		PrintWriter out = null;
		User user = null;
		
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
			session.setAttribute("flag", "popup-message-login-success");
			Cookie loginCookie = new Cookie("loginId", loginId);
			response.addCookie(loginCookie);
			Cookie cleanSingCookie = new Cookie("0", "0");
			response.addCookie(cleanSingCookie);
			Cookie liPCookie = new Cookie("1", "0");
			response.addCookie(liPCookie);
			Cookie skinCookie = new Cookie("2", "0");
			response.addCookie(skinCookie);
			Cookie lotionCookie = new Cookie("3", "0");
			response.addCookie(lotionCookie);
			Cookie sunCookie = new Cookie("4", "0");
			response.addCookie(sunCookie);
			
			Cart cart = null;
			Cart createCart = new Cart();
			if(request.getCookies() != null) {
				cookies = request.getCookies();
			for(Cookie cookie: cookies) {
				if(cookie.getName().equals("products")) {
					String products = cookie.getValue();
					String []productArray = products.split("@");
					for(int i=1; i<productArray.length; i++) {
						String[]productDetail = productArray[i].split("#");
						try {
							cart = cartService.read(loginId, productDetail[0]);
							if(cart == null){
								createCart.setCount(productDetail[1]);
								createCart.setUserId(loginId);
								createCart.setProductId(productDetail[0]);
								cartService.create(createCart);
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
			}
		}
		
		// 아이디 저장
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
