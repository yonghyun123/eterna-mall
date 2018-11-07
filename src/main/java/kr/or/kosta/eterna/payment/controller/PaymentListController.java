package kr.or.kosta.eterna.payment.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
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
 * /payment.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 서지원
 *
 */
public class PaymentListController implements Controller {

	private BuyService buyService;
	private CartService cartService;
	private UserService userService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService) factory.getBean(BuyServiceImpl.class);
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		userService = (UserService) factory.getBean(UserServiceImpl.class);
		List<Buy> recentAddressList = null;
		List<Cart> cartList = null;
		List<User> couponList = null;
		User user = null;
		try {
			recentAddressList = buyService.recentAddress("hee");
			cartList = cartService.listAll("hee");
			couponList= userService.listCoupon("hee");
			user = userService.read("hee");
			
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		mav.addObject("recentAddressList", recentAddressList);
		mav.addObject("cartList", cartList);
		mav.addObject("couponList", couponList);
		mav.addObject("user", user);
		mav.setView("/checkout.jsp");
		return mav;

	}

}
