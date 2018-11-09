package kr.or.kosta.eterna.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;

public class CartCreateController implements Controller {
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		// TODO Auto-generated method stub
		String productId = request.getParameter("productId");
		String userId = request.getParameter("userId");
		String productCount = request.getParameter("productCount");

		boolean resultFlag = false;
		try {
//			if(cartService.checkReview(userId, productId)){
//				resultFlag = true;
//			}
		} catch (Exception e) {
			throw new ServletException("reviewService.list() 예외 발생", e);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(resultFlag){
			out.println(1);
		} else {
			out.println(0);
		}
		return null;
	}
}
