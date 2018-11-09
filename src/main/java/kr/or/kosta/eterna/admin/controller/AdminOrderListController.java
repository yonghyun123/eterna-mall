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
public class AdminOrderListController implements Controller {
	private BuyService buyService;
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
				List<Buy> list = null;
			    try {
					 list = buyService.listAll();
				} catch ( Exception e1) {
					throw new ServletException("OrderListService.list() 예외 발생", e1);
				}
			    mav.addObject("list", list);
				mav.setView("/admin/manage/adminOrderList.jsp");
		return mav;
	}

}
