package kr.or.kosta.eterna.user.controller;

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
import kr.or.kosta.eterna.coupon.service.CouponService;
import kr.or.kosta.eterna.coupon.service.CouponServiceImpl;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

/**
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class UserOrderDetailController implements Controller {
	
	private UserService userService;
	private BuyService buyService;
	private CouponService couponService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		couponService = (CouponService)factory.getBean(CouponServiceImpl.class);
		ModelAndView mav = new ModelAndView();
		
		List<Buy> orderProductsLength, orderAllList;
		int amount = 0, grade = 0;
		int couponLength, orderCountLength;
		User user = null;
		String userId = (String)request.getAttribute("loginId");
		
		try {
//			유저 정보
			user = userService.read(userId);
//			유저 총 구매액
			amount = userService.userPriceAmount(userId);
//			유저의 다음 등급 도달에 필요한 금액 조회
			grade = userService.searchUpTier(userId);
//			유저의 쿠폰 보유량
			couponLength = couponService.couponLength(userId);
//			유저의 전체구매 목록(orderNumber별 복수의 상품 구매도 count)
			orderAllList = buyService.listAllByUser(userId);
//			유저의 주문 번호별 품목 개수 (각 주문 번호별로 row로 쌓임)
			orderProductsLength = buyService.numPurchase(userId);
//			유저의 주문 횟수
			orderCountLength = orderProductsLength.size();
			
		} catch (Exception e) {
			throw new ServletException("UserService.list() 예외 발생", e);
		}
		
		mav.addObject("user", user);
		mav.addObject("amount", amount);
		mav.addObject("grade", grade);
		mav.addObject("couponLength", couponLength);
		mav.addObject("orderAllList", orderAllList);
		mav.addObject("orderProductsLength", orderProductsLength);
		mav.addObject("orderCountLength", orderCountLength);
		mav.setView("/my-page.jsp");
		return mav;
	}
}
