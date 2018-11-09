package kr.or.kosta.eterna.admin.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;

/**	재고 리스트 출력 서블릿
 * @author 권현우
 *
 */
public class AdminStockListController implements Controller {
	private ProductService productService;
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				productService = (ProductService)factory.getBean(ProductServiceImpl.class);
				List<Product> list = null;
				try {
					list = productService.listAll();
				} catch (Exception e) {
					throw new ServletException("productService.list() 예외 발생", e);
				}
				mav.addObject("list", list);
				mav.setView("/admin/manage/adminStockList.jsp");
		return mav;
	}

}
