package kr.or.kosta.eterna.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

/**
 * myPage에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class UserPageController implements Controller {
	
	private UserService userService;
	
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);

		ModelAndView mav = new ModelAndView();
		
		List<Buy> orderProductsLength, orderAllList;
		int amount = 0, grade = 0;
		int couponLength, orderCountLength;
		Map<String, Object> map = new HashMap<>();
		User user = null;
		String userId = (String)request.getAttribute("loginId");
		try {
			
			map = userService.myPage(userId);
//			유저 정보
			user = (User) map.get("user");
//			유저 총 구매액
			amount = (int)map.get("amount");
//			유저의 다음 등급 도달에 필요한 금액 조회
			grade = (int) map.get("grade");
//			유저의 쿠폰 보유량
			couponLength = (int) map.get("couponLength");
//			유저의 전체구매 목록(orderNumber별 복수의 상품 구매도 count)
			orderAllList = (List<Buy>) map.get("orderAllList");
//			유저의 주문 번호별 품목 개수 (각 주문 번호별로 row로 쌓임)
			orderProductsLength = (List<Buy>) map.get("orderProductsLength");
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
