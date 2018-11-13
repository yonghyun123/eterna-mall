package kr.or.kosta.eterna.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;


public class CartUpdateController implements Controller {

	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService) factory.getBean(CartServiceImpl.class);

		String loginId;
		loginId = (String) request.getAttribute("loginId");
		
		String countArr = request.getParameter("countArr");
		String productIdArr = request.getParameter("productIdArr");
		//비회원 장바구니에서 올때
		String[] productCount = request.getParameterValues("productCount");
		String[] productId= request.getParameterValues("productId");
		
		JSONParser countArrParser = new JSONParser();
		JSONParser productIdArrParser = new JSONParser();
		List<Cart> cartList = new ArrayList<>();
		if(loginId !=null){
			try {
				cartService.toBuyDelete(loginId);
				JSONArray countArray = (JSONArray) countArrParser.parse(countArr);
				JSONArray productIdArray = (JSONArray) productIdArrParser.parse(productIdArr);
				if (countArray != null && productIdArray != null) {
					for (int i = 0; i < countArray.size(); i++) {
						Cart cart = new Cart(loginId, countArray.get(i).toString(), productIdArray.get(i).toString());
						cartService.toBuycreate(cart);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				if(productCount != null && productId != null){
					for (int i = 0; i < productId.length; i++) {
						Cart cart = cartService.nonReadCart(productId[i]);
						cart.setCount(productCount[i]);
						cartList.add(cart);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}

		if(loginId != null){
			mav.setView("/cart.mall");
			return mav;
		} else {
			mav.addObject("cartList", cartList);
			mav.addObject("uriCheck", "noncartpayment");
			mav.setView("/checkout.jsp");
			return mav;
		}
	}
}
