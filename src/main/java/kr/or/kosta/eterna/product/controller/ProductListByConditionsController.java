package kr.or.kosta.eterna.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;

public class ProductListByConditionsController implements Controller {
	private ProductService productService;

	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		response.setContentType("application/json; charset=utf-8");

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		productService = (ProductService) factory.getBean(ProductServiceImpl.class);

		String ageArray = request.getParameter("ages");
		String productArray = request.getParameter("productKind");
		JSONParser productArrParser = new JSONParser();
		JSONParser ageArrParser = new JSONParser();

		String minAmount = request.getParameter("minAmount");
		String maxAmount = request.getParameter("maxAmount");
		String productType = request.getParameter("type");

		JSONArray ages = null;
		JSONArray kindes =null;
		try {
			ages = (JSONArray) ageArrParser.parse(ageArray);
			kindes = (JSONArray) productArrParser.parse(productArray);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		Map<String, Object> map = new HashMap<>();
		map.put("ages", ages);
		map.put("kindes", kindes);
		map.put("minAmount", minAmount);
		map.put("maxAmount", maxAmount);
		map.put("productType", productType);
		List<Product> productList = null;
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		int count = 0;
		try {
			productList = productService.listByConditions(map);
			count = productService.countByConditions(map);
			for (Product product : productList) {
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