package kr.or.kosta.eterna.index.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.index.service.IndexService;
import kr.or.kosta.eterna.index.service.IndexServiceImpl;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

/**
 * /payment.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 서지원
 *
 */
public class IndexController implements Controller {

	private IndexService indexService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		indexService = (IndexService) factory.getBean(IndexServiceImpl.class);
		List<Product> BrandNewZeroList=null;
		List<Product> HotItemList=null;
		try {
		BrandNewZeroList = indexService.brandNewList("0");
		HotItemList = indexService.popularProductList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		mav.addObject("BrandNewZeroList", BrandNewZeroList);
		mav.addObject("HotItemList", HotItemList);
		
		mav.setView("/");
		return mav;

	}

}
