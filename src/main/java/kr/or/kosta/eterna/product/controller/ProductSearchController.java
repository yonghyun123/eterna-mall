package kr.or.kosta.eterna.product.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;
/**
 * 제품 검색 시 출력 컨트롤러(제품명 or 제품 브랜드)
 * @author 희진
 *
 */
public class ProductSearchController implements Controller {
	private ProductService productService;
	Logger logger = Logger.getLogger(ProductSearchController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		productService = (ProductService)factory.getBean(ProductServiceImpl.class);
		List<Product> list = null;
		int count = 0;
		boolean flag = true;

		String inputSearch = null;
		try {
			request.setCharacterEncoding("UTF-8");
			inputSearch = java.net.URLDecoder.decode(request.getParameter("inputText") , "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		try {
			list = productService.listBySearch(inputSearch);
			count = list.size();
		} catch (Exception e) {
			throw new ServletException("ProuctSearch 검색 예외 발생", e);
		}
		
		mav.addObject("productList", list);
		mav.addObject("count", count);
		mav.addObject("search", flag);
		mav.addObject("inputSearch", inputSearch);
		mav.setView("/shop.jsp");
		return mav;

	}
}