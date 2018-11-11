package kr.or.kosta.eterna.cart.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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

		JSONParser countArrParser = new JSONParser();
		JSONParser productIdArrParser = new JSONParser();
		try {
			JSONArray countArray = (JSONArray) countArrParser.parse(countArr);
			JSONArray productIdArray = (JSONArray) productIdArrParser.parse(productIdArr);
			if (countArray != null && productIdArray != null) {
				for (int i = 0; i < countArray.size(); i++) {
					Cart cart = new Cart(loginId, countArray.get(i).toString(), productIdArray.get(i).toString());
					cartService.toBuycreate(cart);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setView("/cart.mall");
		return mav;

	}

}
