package kr.or.kosta.eterna.buy.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

public class BuyCreateController implements Controller{
	private BuyService buyService;
	private UserService userService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		
		String productId = request.getParameter("productId");
		String productCount = request.getParameter("productCount");
		String totalPrice = request.getParameter("totalPrice");
		String reducePrice = request.getParameter("reducePrice");
		String selectedCouponId = request.getParameter("selectedCouponId");
		String fullAddress = request.getParameter("fullAddress");
		String receiver = request.getParameter("receiver");
		String receiverPhone = request.getParameter("receiverPhone");
		String userId = (String)request.getAttribute("loginId");
		
		System.out.println("buyCreate-------productId: "+productId);
		System.out.println("buyCreate-------productCount: "+productCount);
		System.out.println("buyCreate-------totalPrice: "+totalPrice);
		System.out.println("buyCreate-------reducePrice: "+reducePrice);
		System.out.println("buyCreate-------selectedCouponId: "+selectedCouponId);
		System.out.println("buyCreate-------fullAddress: "+fullAddress);
		
		Buy buy = new Buy();
		buy.setUserId(userId);
		buy.setReceiverName(receiver);
		buy.setReceiverAddress(fullAddress);
		buy.setTotalPrice(totalPrice);
		buy.setReducePrice(reducePrice);
		buy.setReceiverTel(receiverPhone);
		buy.setProductId(productId);
		buy.setCount(productCount);
		
		User user = new User();
		String userPoint = null;
		
		if(totalPrice != null){
			int tempPoint = (int) (Integer.parseInt(totalPrice) * 0.01);
			userPoint = Integer.toString(tempPoint);
		}
		user.setUserId(userId);
		user.setUserPoint(userPoint);
		user.setUserGrade(totalPrice);
		user.setCouponId(selectedCouponId);
		System.out.println("buyCreate-------userPoint: "+userPoint);
		System.out.println("buyCreate-------totalPrice: "+totalPrice);
		
		
		
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		
		List<Buy> list = null;
		try {
			buyService.create(buy);
			userService.pointUpdate(user);
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		mav.addObject("list", list);
		mav.setView("redirect:/thankyou.jsp");

		return mav;
	}

}
