package kr.or.kosta.eterna.product.controller;

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

public class ProductDetailController implements Controller {
	private ProductService productService;
	Logger logger = Logger.getLogger(ProductDetailController.class);
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		productService = (ProductService)factory.getBean(ProductServiceImpl.class);
		List<Product> list = null;
		
		String productId = request.getParameter("productId");
		logger.debug("productId"+productId);

		try {
			//가져오는 데이터 만들어줘야함
			//list = productService.listAll();
		} catch (Exception e) {
			throw new ServletException("CartService.list() 예외 발생", e);
		}
		//mav.addObject("productList", list);
		//mav.setView("/shop_single.jsp");
		
		return mav;
		
	}
}
