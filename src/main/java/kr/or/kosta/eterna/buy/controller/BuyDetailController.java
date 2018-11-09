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

/**
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class BuyDetailController implements Controller {
	
	private UserService userService;
	private BuyService buyService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		ModelAndView mav = new ModelAndView();
		
		int amount = 0, grade, orderAmount;
		int couponLength;
		List<Buy> buyAllList;
		List<Buy> numPurchase;
		User user = null;
		String userId;
		userId = (String)request.getAttribute("loginId");
		
		try {
//			유저 정보
			user = userService.read(userId);
//			amount = userService.priceAmount(userId);

//			유저의 총 구매 목록 
			buyAllList = buyService.listAllByUser(userId);
//			유저의 다음 등급 도달에 필요한 금액 조회
			grade = userService.searchUpTier(userId);
//			유저의 쿠폰 보유량
			couponLength = userService.couponLength(userId);
//			유저의 주문번호별 품목 개수 List 
			numPurchase = buyService.numPurchase(userId);
//			유저의 주문 개수
			orderAmount = numPurchase.size();
			
//			유저의 총 구매액
			for (Buy buy : buyAllList) {
				amount += Integer.parseInt(buy.getProductPrice()) * Integer.parseInt(buy.getCount());
			}
		} catch (Exception e) {
			throw new ServletException("UserService.list() 예외 발생", e);
		}
		
		mav.addObject("user", user);
		mav.addObject("amount", amount);
		mav.addObject("grade", grade);
		mav.addObject("couponLength", couponLength);
		mav.addObject("numPurchase", numPurchase);
		mav.addObject("buyAllList", buyAllList);
		mav.addObject("orderAmount", orderAmount);
		mav.setView("/my-page.jsp");
		return mav;
	}
}
