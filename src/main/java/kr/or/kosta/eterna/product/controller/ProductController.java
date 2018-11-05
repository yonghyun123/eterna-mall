package kr.or.kosta.eterna.product.controller;

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

public class ProductController implements Controller {
	
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
