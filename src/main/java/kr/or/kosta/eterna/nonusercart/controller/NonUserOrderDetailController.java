package kr.or.kosta.eterna.nonusercart.controller;

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
 * 
 * @author 서지원
 *
 */
public class NonUserOrderDetailController implements Controller {

	private BuyService buyService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		response.setContentType("application/json; charset=utf-8");
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService) factory.getBean(BuyServiceImpl.class);

		List<Buy> orderDetailList = null;
		Buy check = null;

		int shippingFee = 0;
		String orderFlag = null, receiveDate = null, dateNum = null, orderDate = null, passwd = null, flag = null;
		String id = request.getParameter("orderNumber");

		dateNum = request.getParameter("dateNum");
		passwd = request.getParameter("nonUserPw");
		try {
			check = buyService.nonUserCertify(id, passwd);
			if (dateNum != null && passwd != null && check != null) {
				orderDetailList = buyService.showOrderDetailUser(id);
				System.out.println("orderDetailList : " + orderDetailList);
			} else {
				flag = "fail";
			}
		} catch (Exception e) {
			throw new ServletException("주문번호별 조회 예외 발생", e);
		}
		if (check != null) {
			String[] dateArr = orderDetailList.get(0).getOrderDate().split("/");
			orderDate = "20" + dateArr[0] + dateArr[1] + dateArr[2];
			if (!orderDate.equals(dateNum)) {
				flag = "fail";
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				System.out.println(flag);
				out.println(flag);
			} else if (orderDetailList != null) {
				JSONArray jsonArray = new JSONArray();
				for (Buy buy : orderDetailList) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("orderNumber", buy.getId());
					jsonObject.put("productDescription", buy.getProductDescription());
					jsonObject.put("productPrice", buy.getProductPrice());
					jsonObject.put("productCount", buy.getCount());
					jsonObject.put("orderDate", buy.getOrderDate());
					jsonObject.put("fileName", buy.getFileName());
					if (buy.getOrderFlag().equals("0")) {
						orderFlag = "배송전";
						receiveDate = buy.getOrderDate() + " 도착 예정";
					} else if (buy.getOrderFlag().equals("1")) {
						orderFlag = "배송중";
						receiveDate = buy.getOrderDate() + " 도착 예정";
					} else {
						orderFlag = "배송완료";
						receiveDate = buy.getOrderDate() + " 도착";
					}
					jsonObject.put("receiveDate", receiveDate);
					jsonObject.put("orderFlag", orderFlag);
					jsonObject.put("receiverName", buy.getReceiverName());
					jsonObject.put("receiverTel", buy.getReceiverTel());
					jsonObject.put("receiverAddress", buy.getReceiverAddress());
					jsonObject.put("paymentKind", buy.getPaymentKind());
					jsonObject.put("totalProductPrice", buy.getTotalPrice());
					jsonObject.put("reducePrice", buy.getReducePrice());
					if (Integer.parseInt(buy.getTotalPrice()) < 30000) {
						shippingFee = 3000;
					}
					jsonObject.put("shippingFee", shippingFee);
					jsonObject.put("totalPrice", Integer.parseInt(buy.getTotalPrice())
							- Integer.parseInt(buy.getReducePrice()) + shippingFee);
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
			}
		} else {
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(flag);
			out.println(flag);
		}
		return null;
	}
}
