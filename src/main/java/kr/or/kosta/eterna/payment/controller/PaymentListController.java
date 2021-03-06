package kr.or.kosta.eterna.payment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.coupon.service.CouponService;
import kr.or.kosta.eterna.coupon.service.CouponServiceImpl;
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
	private CouponService couponService;
	Logger logger = Logger.getLogger(PaymentListController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService) factory.getBean(BuyServiceImpl.class);
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		userService = (UserService) factory.getBean(UserServiceImpl.class);
		couponService = (CouponService) factory.getBean(CouponServiceImpl.class);
		List<Buy> recentAddressList = null;
		List<Cart> cartList = null;
		List<Coupon> couponList = null;
		Map<String, String> orderCart = null;
		List<Map<String, String>> orderList = new ArrayList<>();
		User user = null;
		String userId = null;
		userId = (String) request.getAttribute("loginId");
		String productId = request.getParameter("productId");
		String productCount = request.getParameter("productCount");

		try {	
			if(userId!=null) {
				recentAddressList = buyService.recentAddress(userId);
				cartList = cartService.toBuylistAll(userId);
				couponList = couponService.userCouponList(userId);
				user = userService.read(userId);
			}
			if (productId != null) {
				orderCart = cartService.order(productId);
			}

		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		
		//비회원 주문이면서 단일 상품주문
		if(userId == null && productId != null){
			orderCart.put("count", productCount);
			orderCart.put("productId", productId);
			orderList.add(orderCart);
			mav.addObject("cartList", orderList);
			mav.addObject("uriCheck", "nonpayment");
		//회원이면서 단일 상품주문
		} else if(userId != null && productId != null){
			orderCart.put("count", productCount);
			orderCart.put("productId", productId);
			orderList.add(orderCart);
			mav.addObject("cartList", orderList);
			mav.addObject("uriCheck", "payment");
		//회원이면서 장바구니 상품주문	
		} else if(userId != null && productId == null) {
			mav.addObject("cartList", cartList);
			mav.addObject("uriCheck", "cartpayment");
		//비회원 주문이면서 장바구니 쿠키이용할때	
		} else {
			mav.addObject("uriCheck", "noncartpayment");
		}

		mav.addObject("recentAddressList", recentAddressList);
		mav.addObject("couponList", couponList);
		mav.addObject("user", user);
		mav.setView("/checkout.jsp");
		return mav;

	}
}
