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
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.nonusercart.service.NonUserCartService;
import kr.or.kosta.eterna.nonusercart.service.NonUserCartServiceImpl;

/**
 * 비회원 장바구니 리스트 삭제기능
 * 
 * @author 권현우
 *
 */
public class NonUserCartDeleteController implements Controller {

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
		String[] productIdList = request.getParameterValues("deleteCheck");
		//String productId = request.getParameter("productId");
		
		if(request.getCookies().length != 1) {
			cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("products")) {
				String products = cookie.getValue();
				System.out.println("productsFrist= " +  products);
				String [] productArray = products.split("@");
				
				for(int i=1; i<productArray.length; i++) {
					productValue.add(i-1, productArray[i]);
				}
				try {
					list=nonusercartService.listAll(productValue);
					products = "";
					System.out.println("size = " + list.size());
					for (Cart cart : list) {
						boolean deleteFlag = false;
						for (String productId : productIdList) {
							if(cart.getProductId().equals(productId)  ) {
								
								deleteFlag = true;
							}	
						}
						System.out.println("flag=" + deleteFlag);
						if(deleteFlag == true ) {
							System.out.println("remove");
						}else {
						products += ("@"+cart.getProductId()+"#"+cart.getCount());
						System.out.println("productsAdding=" + products);
						}
					}
					
					if(products != "") {
						System.out.println("products=" + products );
						cookie.setValue(products);
						response.addCookie(cookie);
					}else {
						System.out.println("products=" + products );
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						mav.setView("/cart.jsp");
						return mav;
					}
				} catch (Exception e) {
					// TO\DO Auto-generated catch block
					e.printStackTrace();
				}
			}
			}
		}
		mav.setView("/nonUserCartList.mall");
		return mav;

	}

}
