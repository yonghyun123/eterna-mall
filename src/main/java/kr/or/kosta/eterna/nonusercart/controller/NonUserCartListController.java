package kr.or.kosta.eterna.nonusercart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.nonusercart.service.NonUserCartService;
import kr.or.kosta.eterna.nonusercart.service.NonUserCartServiceImpl;
import kr.or.kosta.eterna.product.domain.Product;

/**
 * 비회원 장바구니리스트를 생성하는 컨트롤러
 * @author 권현우
 */
public class NonUserCartListController implements Controller {

	private NonUserCartService nonusercartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		Cookie[] cookies; 
		nonusercartService = (NonUserCartService) factory.getBean(NonUserCartServiceImpl.class);
		List<Cart> list = null;
		List<String> productValue = new ArrayList<String>();
		Map<String,String> map = new HashMap<String,String>();
		String loginId =(String)request.getAttribute("loginId"); 
		if(loginId!= null) {
			mav.setView("/cart.mall");
			return mav;
		}
		if(request.getCookies().length != 1) {
			cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("products")) {	
				String products = cookie.getValue();
				String [] productArray = products.split("@");
				
				for(int i=1; i<productArray.length; i++) {
					productValue.add(i-1, productArray[i]);
				}
				try {
					list=nonusercartService.listAll(productValue);
				} catch (Exception e) {
					// TO\DO Auto-generated catch block
					e.printStackTrace();
				}
			}
			}
		}
		mav.addObject("list", list);
		mav.setView("/cart.jsp");
		return mav;

	}

}
