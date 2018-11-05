package kr.or.kosta.eterna.admin.controller;

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

/**	주문목록 출력 서블릿
 * @author 권현우
 *
 */
public class adminOrderListController implements Controller {
	private BuyService buyService;
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
				List<Buy> list = null;
				JSONObject object = new JSONObject();
			    JSONArray jArray = new JSONArray();
			    PrintWriter writer = null;
			    try {
					 writer = response.getWriter();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					list = buyService.listAll();
					for (Buy buy : list) {
					object.put("userId", buy.getUserId());
					object.put("buyerName", buy.getBuyerName());
					object.put("buyerTel", buy.getBuyerTel());
					object.put("buyerAddress", buy.getBuyerAddress());
					object.put("receiverName", buy.getReceiverName());
					object.put("receiverTel", buy.getReceiverTel());
					object.put("receiverAddress", buy.getReceiverAddress());
					object.put("count", buy.getCount());
					object.put("productBrand", buy.getProductBrand());
					object.put("productDescription", buy.getProductDescription());
					object.put("fileName", buy.getFileName());
					object.put("passwd", buy.getPasswd());
					object.put("orderFlag", buy.getOrderFlag());
				    jArray.add(object);
					}
					writer.println(jArray);
				} catch (Exception e) {
					throw new ServletException("UserService.list() 예외 발생", e);
				}
				
		return null;
	}

}
