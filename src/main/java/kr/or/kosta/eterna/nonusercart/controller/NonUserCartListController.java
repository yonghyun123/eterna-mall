package kr.or.kosta.eterna.nonusercart.controller;

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
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 조희진
 *
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
		List<String> productValue = null;
		Map<String,String> map = new HashMap<String,String>();
		if(request.getCookies().length != 1) {
			cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				String products = cookie.getValue();
				String [] productArray = products.split("@");
				
				for(String product : productArray) {
					productValue.add(product);					
				}
				try {
					list=nonusercartService.listAll(productValue);
				} catch (Exception e) {
					// TO\DO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		mav.addObject("list", list);
		mav.setView("/cart.jsp");
		return mav;

	}

}
