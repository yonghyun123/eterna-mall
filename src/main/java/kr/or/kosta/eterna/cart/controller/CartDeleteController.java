package kr.or.kosta.eterna.cart.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * /cart.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 서지원
 *
 */
public class CartDeleteController implements Controller {

	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		String loginId, productId;
		String[] list = null;
		list = request.getParameterValues("deleteCheck");
		loginId = (String) request.getAttribute("loginId");
		if (list != null) {
			for (String string : list) {
				productId = string;
				try {
					cartService.delete(loginId, productId);
				} catch (Exception e) {
					throw new ServletException("CartService.delete() 예외 발생", e);
				}
			}
		}
		mav.setView("redirect:/cart.mall");
		return mav;
	}

}
