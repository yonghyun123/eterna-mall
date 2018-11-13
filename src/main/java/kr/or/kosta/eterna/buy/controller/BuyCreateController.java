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
import kr.or.kosta.eterna.point.domain.Point;
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
		String usedPoint = request.getParameter("usedPoint");
		
		System.out.println("입력안했을때 포인트!!!!"+usedPoint);

		Point savePoint = new Point();
		Point spendPoint = new Point();
		Buy buy = new Buy();
		User user = new User();
		User originUser = null;
		int userPoint = 0;
		int tempPoint = 0;
		if(totalPrice != null){
			tempPoint= (int) (Integer.parseInt(totalPrice) * 0.01);
		}
		try {
			if(userId != null){
				originUser = userService.read(userId);
				if(usedPoint != null || !usedPoint.equals("undefined")){
					savePoint.setUserId(userId);
					savePoint.setStatus("적립");
					savePoint.setPoint(Integer.toString(tempPoint));
					
					spendPoint.setUserId(userId);
					spendPoint.setStatus("사용");
					spendPoint.setPoint(usedPoint);
					
					userPoint = Integer.parseInt(originUser.getUserPoint()) + tempPoint - Integer.parseInt(usedPoint);
				}
			}
		
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		// 회원이라면 주소지 setting
		if(originUser!= null){
			buy.setBuyerAddress(originUser.getUserAddress());
			buy.setBuyerName(originUser.getUserName());
			buy.setBuyerTel(originUser.getUserTel());
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
			user.setUserPoint(Integer.toString(userPoint));
			user.setUserGrade(totalPrice);
			user.setCouponId(selectedCouponId);
			//order-cart 가져와야 하는부분
			
			try {
				
				List<Cart> cartList = cartService.readOrderCart(userId);
				buyService.create(buy, cartList);
				userService.pointUpdate(user);
				cartService.toBuyDelete(userId, cartList);
				userService.createPoint(savePoint);
				if(!usedPoint.equals("0")){
					userService.createPoint(spendPoint);	
				}
				
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
			user.setUserPoint(Integer.toString(userPoint));
			user.setUserGrade(totalPrice);
			user.setCouponId(selectedCouponId);
			
			try {
				buyService.create(buy);
				userService.pointUpdate(user);
				userService.createPoint(savePoint);
				if(!usedPoint.equals("0")){
					userService.createPoint(spendPoint);	
				}
				
			} catch (Exception e) {
				throw new ServletException("CartService.list() 예외 발생", e);
			}
		}
		mav.setView("redirect:/thankyou.jsp");

		return mav;

	}

}
