package kr.or.kosta.eterna.nonusercart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;
/**
 * 비회원 장바구니 리스트 생성
 * @author 권현우
 * */
public class NonUserCartCreateController implements Controller {
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		String productId = request.getParameter("productId");
		String productCount = request.getParameter("productCount");
		Cookie[] cookies;
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(request.getCookies() != null) {
			cookies=request.getCookies();
			for(Cookie cookie : cookies) {
				/**products라는 쿠키가 있을때*/
				if(cookie.getName().equals("products")){
					/**productsCookie의 value를 받아온다*/
					String products = cookie.getValue();
					/**@단위(product/value 한쌍)로 잘라주고*/
					String [] productArray = products.split("@");
					/**잘려진 한 쌍을*/
					for (String product : productArray) {
						/**#단위(key따로 Value 따로)로 자른다다*/
						String [] productDetail = product.split("#");
						/**key 값이 현재 productId와 같으면*/
						
						if(productDetail[0].equals(productId)){
							/**중복이라고 출력*/
							out.println(0);
							return null;
						}	
					}
					products += productId +"#"+ productCount+"@";
					cookie.setValue(products);
					response.addCookie(cookie);
					out.println(1);
					return null;
				}
			}
		}
		
		 String products = "@"+ productId + "#" + productCount +"@";
		 Cookie cookie = new Cookie("products",products);
		 response.addCookie(cookie);
		 out.println(1);
		 return null;
	}
}
