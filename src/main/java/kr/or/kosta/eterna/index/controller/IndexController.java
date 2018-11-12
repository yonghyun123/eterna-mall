package kr.or.kosta.eterna.index.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.index.service.IndexService;
import kr.or.kosta.eterna.index.service.IndexServiceImpl;
import kr.or.kosta.eterna.product.domain.Product;

/**
 * index.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 권현우
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
			e.printStackTrace();
		}
		mav.addObject("BrandNewZeroList", BrandNewZeroList);
		mav.addObject("HotItemList", HotItemList);
		
		mav.setView("/");
		return mav;

	}

}
