package kr.or.kosta.eterna.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;
/**
 * Product Slector 선택시 출력 컨트롤러
 * @author 조희진
 *
 */
public class ProductListBySelectorController implements Controller {
	private ProductService productService;

	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		response.setContentType("application/json; charset=utf-8");

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		productService = (ProductService) factory.getBean(ProductServiceImpl.class);

		String select = request.getParameter("select");
		List<Product> list = null;
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		int count = 0;
		try {
			if (select.equals("최신등록")) {
				list = productService.listByRegdate();
			} else if (select.equals("판매수량")) {
				list = productService.listBySales();
			} else{
				list = productService.listByScore();
			}
			count = productService.countAll();
			for (Product product : list) {
				jsonObject = new JSONObject();
				jsonObject.put("thumnail", product.getThumnail());
				jsonObject.put("productId", product.getProductId());
				jsonObject.put("productBrand", product.getProductBrand());
				jsonObject.put("productDescription", product.getProductDescription());
				jsonObject.put("price", product.getPrice());
				jsonObject.put("count", count);
				jsonArray.add(jsonObject);
			}
		} catch (Exception e) {
			throw new ServletException("ProductService.list() 예외 발생", e);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(jsonArray.toJSONString());
		return null;

	}
}