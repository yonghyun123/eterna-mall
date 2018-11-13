package kr.or.kosta.eterna.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;

public class CartCreateController implements Controller {
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		
		// TODO Auto-generated method stub
		String productId = request.getParameter("productId");
		String userId = request.getParameter("userId");
		String productCount = request.getParameter("productCount");

		Cart cart = null;
		Cart createCart = new Cart();
		try {
			cart = cartService.read(userId, productId);
			if(cart == null){
				createCart.setCount(productCount);
				createCart.setUserId(userId);
				createCart.setProductId(productId);
				cartService.create(createCart);
			}
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이미 등록한 장바구니가 없을때 장바구니에 추가후  1로 리턴
		if(cart == null){
			out.println(1);
		} else {
			//이미 추가한 장바구니가 있을때 0으로 리턴
			out.println(0);
		}
		return null;
	}
}
