package kr.or.kosta.eterna.cart.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * /cart.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class CartUpdateController implements Controller {
	
	private CartService cartService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService)factory.getBean(CartServiceImpl.class);
		
		String loginId , productId, count;

		String countArr = request.getParameter("countArr");
		String productIdArr = request.getParameter("productIdArr");
		System.out.println("countArr : " + countArr);
		System.out.println("productIdArr : " + productIdArr);
		
		JSONParser countArrParser = new JSONParser();
		JSONParser productIdArrParser = new JSONParser();
		try {
			JSONArray countArray = (JSONArray) countArrParser.parse(countArr);
			JSONArray productIdArray = (JSONArray) productIdArrParser.parse(countArr);
			
//			System.out.println("obj : "+obj);
			
//			JSONObject obj = (JSONObject) parser.parse(array.toJSONString());
//			System.out.println("obj"+obj);
//			JSONArray arr = (JSONArray)array;
//			System.out.println("obj"+arr);
			for (Object object : obj) {
				System.out.println("object"+object);
			}
		} catch (ParseException e) {
			 //TODO Auto-generated catch block
			e.printStackTrace();
		}

//		List<Map<String, String>> mapList = new Array(List<Map<String, String>>) obj;
//		
//		loginId = (String) request.getAttribute("loginId");
//		
//		for (Map<String, String> map2 : mapList) {
//			System.out.println(map2.get("count"));
//			System.out.println(map2.get("productId"));
//		}
//		System.out.println(loginId);
//		
//		List<Cart> list = null;
//		loginId = request.getParameter("loginId");
//		try {
//			cartService.update(cart);
//			
//		} catch (Exception e) {
//			throw new ServletException("CartService.list() 예외 발생", e);
//		}
//		for (Cart cart : list) {
//			System.out.println(cart.toString());
//		}
//		mav.setView("redirect:/checkout.mall");
		return mav;

	}

}
