package kr.or.kosta.eterna.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
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
 * /user/orderNumber.mall에 대한 요청 처리 컨트롤러
 * @author 이철우
 *
 */
public class UserOrderDetailController implements Controller {
	
	private BuyService buyService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		
		List<Buy> orderDetailList;
		int shippingFee = 0;
		String orderFlag = null;
		String id = request.getParameter("orderNumber");
		
		try {
			orderDetailList = buyService.showOrderDetailUser(id);
		} catch (Exception e) {
			throw new ServletException("주문번호별 조회 예외 발생", e);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		JSONArray jsonArray = new JSONArray();
		
		for (Buy buy : orderDetailList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("orderNumber", buy.getId());
			jsonObject.put("productDescription", buy.getProductDescription());
			jsonObject.put("productPrice", buy.getProductPrice());
			jsonObject.put("productCount", buy.getCount());
			jsonObject.put("orderDate", buy.getOrderDate());
			jsonObject.put("fileName", buy.getFileName());
			jsonObject.put("receiveDate", buy.getReceiveDate());
			
			if(buy.getOrderFlag().equals("0")) {
				orderFlag = "배송완료";
			} else if (buy.getOrderFlag().equals("1")) {
				orderFlag = "배송중";
			} else {
				orderFlag = "배송준비중";
			}
			
			jsonObject.put("orderFlag", orderFlag);
			jsonObject.put("receiverName", buy.getReceiverName());
			jsonObject.put("receiverTel", buy.getReceiverTel());
			jsonObject.put("receiverAddress", buy.getReceiverAddress());
			jsonObject.put("paymentKind", buy.getPaymentKind());
			jsonObject.put("totalProductPrice", buy.getTotalPrice());
			jsonObject.put("reducePrice", buy.getReducePrice());
			if(Integer.parseInt(buy.getTotalPrice()) < 30000) {
				shippingFee = 3000;
			}
			jsonObject.put("shippingFee", shippingFee);
			jsonObject.put("totalPrice", Integer.parseInt(buy.getTotalPrice()) - Integer.parseInt(buy.getReducePrice()) + shippingFee);
			jsonArray.add(jsonObject);
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(jsonArray.toJSONString());
		out.println(jsonArray.toJSONString());
		
		return null;
	}
}
