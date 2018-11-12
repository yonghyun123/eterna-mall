package kr.or.kosta.eterna.buy.controller;

/**
 * 비회원 주문시
 * 장바구니와 단일상품 구매 컨트롤러
 * created by yonghyun
 * 
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;

import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

public class NonUserBuyCreateController implements Controller {
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
		uri = uri.substring(contextPath.length(), uri.lastIndexOf("."));
		System.out.println("NonUserCreateController[Info] : 요청 URI: " + uri);
		String buyerName = request.getParameter("buyerName");
		String buyerPasswd = request.getParameter("buyerPasswd");
		String buyerPhone = request.getParameter("buyerPhone");
		String receiver = request.getParameter("receiver");
		String receiverPhone = request.getParameter("receiverPhone");
		String productTotalCount = request.getParameter("productTotalCount");
		String fullAddress = request.getParameter("fullAddress");
		String totalPrice = request.getParameter("totalPrice");
		
		Buy buy = new Buy();

		if (uri.equals("/nonpayment")) {
			String productId = request.getParameter("productId");
			String productCount = request.getParameter("productCount");
			
			System.out.println("nonuserSingle-->buyerName:"+buyerName);
			System.out.println("nonuserSingle-->buyerPasswd:"+buyerPasswd);
			System.out.println("nonuserSingle-->buyerPhone:"+buyerPhone);
			System.out.println("nonuserSingle-->receiver:"+receiver);
			System.out.println("nonuserSingle-->receiverPhone:"+receiverPhone);
			System.out.println("nonuserSingle-->productCount:"+productCount);
			System.out.println("nonuserSingle-->fullAddress:"+fullAddress);
			System.out.println("nonuserSingle-->totalPrice:"+totalPrice);
			
			// 장바구니에서 구매버튼 눌렀을 때
			buy.setUserId(buyerName);
			buy.setBuyerName(buyerName);
			buy.setBuyerTel(buyerPhone);
			buy.setReceiverName(receiver);
			buy.setReceiverAddress(fullAddress);
			buy.setTotalPrice(totalPrice);
			buy.setReducePrice("0");
			buy.setReceiverTel(receiverPhone);
			buy.setProductId(productId);
			buy.setCount(productCount);
			buy.setPasswd(buyerPasswd);

			try {
				buyService.nonCreate(buy);
			} catch (Exception e) {
				throw new ServletException("CartService.list() 예외 발생", e);
			}
		} else {

		}
		mav.setView("redirect:/thankyou.jsp");

		return mav;
		//return null;
	}
}
