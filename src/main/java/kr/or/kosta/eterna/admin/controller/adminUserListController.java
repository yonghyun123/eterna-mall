package kr.or.kosta.eterna.admin.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * 관리자페이지에서 회원리스트에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class adminUserListController implements Controller {
	
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		List<Cart> list = null;
		try {
			list = cartService.listAll("hee");
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		mav.addObject("list", list);
		mav.setView("/user/cartlist.jsp");
		return mav;

	}

}
