package kr.or.kosta.eterna.product.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;
import kr.or.kosta.eterna.productImage.domain.ProductImage;
import kr.or.kosta.eterna.productImage.service.ProductImageService;
import kr.or.kosta.eterna.productImage.service.ProductImageServiceImpl;

public class ProductDetailController implements Controller {
	private ProductService productService;
	private ProductImageService productImageService;
	Logger logger = Logger.getLogger(ProductDetailController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		productService = (ProductService)factory.getBean(ProductServiceImpl.class);
		productImageService = (ProductImageService)factory.getBean(ProductImageServiceImpl.class);
		
		Product selectProduct = null;
		List<ProductImage> imageList = null;
		String productId = request.getParameter("productId");
		String recentView = null;
		logger.debug("productId"+productId);
		


		try {
			//가져오는 데이터 만들어줘야함
			//list = productService.listAll();
			selectProduct = productService.read(productId);
			imageList = productImageService.imageAll(productId);
		} catch (Exception e) {
			throw new ServletException("ProductDetailController 예외 발생", e);
		}
		mav.addObject("selectProduct", selectProduct);
		mav.addObject("imageList", imageList);
		mav.setView("/shop_single.jsp");

		/**제품 조회시 쿠키생성*/
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("recentView")&&cookie.getValue()!="") {
					recentView = cookie.getValue();
					String [] dupleArray = recentView.split("@");
					String [] productDetail = null;
					boolean dupleFlag = false;
					for (String product : dupleArray) {
						productDetail = product.split("#");
						if(productDetail[0].equals(productId)) {
							dupleFlag = true;
						}
					}
					if(dupleFlag == false) {
					recentView += productId + "#" +selectProduct.getProductDescription().replaceAll(" ", "*") +"#"+ imageList.get(0).getFileName() +"@";
					cookie.setValue(recentView);
					response.addCookie(cookie);
					}
					return mav;
				}else {
					System.out.println("notView");
				}
			}
		}
		System.out.println(selectProduct.getProductDescription().replaceAll(" ", "*"));
		 recentView ="@"+productId +"#"+selectProduct.getProductDescription().replaceAll(" ", "*") +"#"+ imageList.get(0).getFileName()+"@" ;
		 Cookie cookie = new Cookie("recentView", recentView);
		 response.addCookie(cookie);
		return mav;
		
	}
}
