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
		List<Product> BrandNewFirstList=null;
		List<Product> BrandNewSecondList=null;
		List<Product> BrandNewThridList=null;
		List<Product> BrandNewForthList=null;
		List<Product> HotItemList=null;
		try {
		BrandNewZeroList = indexService.brandNewList("0");
		BrandNewFirstList = indexService.brandNewList("1");
		BrandNewSecondList = indexService.brandNewList("2");
		BrandNewThridList = indexService.brandNewList("3");
		BrandNewForthList = indexService.brandNewList("4");
		HotItemList = indexService.popularProductList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("BrandNewZeroList", BrandNewZeroList);
		mav.addObject("BrandNewFirstList", BrandNewFirstList);
		mav.addObject("BrandNewSecondList", BrandNewSecondList);
		mav.addObject("BrandNewThridList", BrandNewThridList);
		mav.addObject("BrandNewForthList", BrandNewForthList);
		mav.addObject("HotItemList", HotItemList);
		
		mav.setView("/");
		return mav;

	}

}
