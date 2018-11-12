package kr.or.kosta.eterna.buy.controller;

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

public class BuyCreateController implements Controller{
	private BuyService buyService;
	private UserService userService;
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		uri = uri.substring(contextPath.length(), uri.lastIndexOf("."));
		System.out.println("BuyCreateController[Info] : 요청 URI: " + uri);

		String userId = (String)request.getAttribute("loginId");
		String totalPrice = request.getParameter("totalPrice");
		String reducePrice = request.getParameter("reducePrice");
		String selectedCouponId = request.getParameter("selectedCouponId");
		String fullAddress = request.getParameter("fullAddress");
		String receiver = request.getParameter("receiver");
		String receiverPhone = request.getParameter("receiverPhone");
		Buy buy = new Buy();
		User user = new User();
		User originUser = null;
		String userPoint = null;
		if(totalPrice != null){
			int tempPoint = (int) (Integer.parseInt(totalPrice) * 0.01);
			userPoint = Integer.toString(tempPoint);
		}
		try {
			if(userId != null){
				
			}
			originUser = userService.read(userId);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 회원이라면 주소지 setting
		if(originUser!= null){
			user.setUserAddress(originUser.getUserAddress());
			user.setUserName(originUser.getUserName());
			user.setUserTel(originUser.getUserTel());
		}
		
		if(uri.equals("/cartpayment")){
			//장바구니에서 구매버튼 눌렀을 때
			buy.setUserId(userId);
			buy.setReceiverName(receiver);
			buy.setReceiverAddress(fullAddress);
			buy.setTotalPrice(totalPrice);
			buy.setReducePrice(reducePrice);
			buy.setReceiverTel(receiverPhone);
			
			user.setUserId(userId);
			user.setUserPoint(userPoint);
			user.setUserGrade(totalPrice);
			user.setCouponId(selectedCouponId);
			//order-cart 가져와야 하는부분
			
			try {
				
				List<Cart> cartList = cartService.readOrderCart(userId);
				buyService.create(buy, cartList);
				userService.pointUpdate(user);
				cartService.toBuyDelete(userId, cartList);
			} catch (Exception e) {
				throw new ServletException("CartService.list() 예외 발생", e);
			}
			
		} else {
			// 상품이 한개인 경우
			// uri -> /payment
			String productId = request.getParameter("productId");
			String productCount = request.getParameter("productCount");
			
			buy.setUserId(userId);
			buy.setReceiverName(receiver);
			buy.setReceiverAddress(fullAddress);
			buy.setTotalPrice(totalPrice);
			buy.setReducePrice(reducePrice);
			buy.setReceiverTel(receiverPhone);
			buy.setProductId(productId);
			buy.setCount(productCount);
			

			user.setUserId(userId);
			user.setUserPoint(userPoint);
			user.setUserGrade(totalPrice);
			user.setCouponId(selectedCouponId);
			
			try {
				buyService.create(buy);
				userService.pointUpdate(user);
			} catch (Exception e) {
				throw new ServletException("CartService.list() 예외 발생", e);
			}
		}
		mav.setView("redirect:/thankyou.jsp");

		return mav;
	}

}
