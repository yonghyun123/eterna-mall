package kr.or.kosta.eterna.buy.controller;
/**
 * 비회원 주문시
 * 장바구니와 단일상품 구매 컨트롤러
 * created by yonghyun
 * 
 */
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

public class NonUserCreateController implements Controller {
	private BuyService buyService;
	private UserService userService;
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService) factory.getBean(BuyServiceImpl.class);
		userService = (UserService) factory.getBean(UserServiceImpl.class);
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		uri = uri.substring(contextPath.length(), uri.lastIndexOf("."));
		System.out.println("BuyCreateController[Info] : 요청 URI: " + uri);

		String totalPrice = request.getParameter("totalPrice");
		String fullAddress = request.getParameter("fullAddress");
		String receiver = request.getParameter("receiver");
		String receiverPhone = request.getParameter("receiverPhone");
		Buy buy = new Buy();
		User user = new User();

		if (uri.equals("/cartpayment")) {
			// 장바구니에서 구매버튼 눌렀을 때
			buy.setReceiverName(receiver);
			buy.setReceiverAddress(fullAddress);
			buy.setTotalPrice(totalPrice);
			//buy.setReducePrice(reducePrice);
			buy.setReceiverTel(receiverPhone);

		}
		mav.setView("redirect:/thankyou.jsp");

		//return mav;
		return null;
	}
}
