package kr.or.kosta.eterna.buy.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class BuyListController implements Controller {
	
	private BuyService buyService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
		List<Buy> list = null;
		try {
			list = buyService.listAllByUser("hee");
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		mav.addObject("list", list);
		mav.setView("/user/buylist.jsp");
		return mav;

	}

}
