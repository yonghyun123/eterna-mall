package kr.or.kosta.eterna.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.product.service.ProductService;
import kr.or.kosta.eterna.product.service.ProductServiceImpl;

public class ProductListByConditionsController implements Controller {
   private ProductService productService;

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      ModelAndView mav = new ModelAndView();
      
      XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
      productService = (ProductService)factory.getBean(ProductServiceImpl.class);
      
      String[] array = request.getParameterValues("ages");
      String minAmount = request.getParameter("minAmount");
      String maxAmount = request.getParameter("maxAmount");
      String productType = request.getParameter("type");
      Map<String, Object> map = new HashMap<>();
      map.put("array", array);
      map.put("minAmount", minAmount);
      map.put("maxAmount", maxAmount);
      map.put("productType", productType);
      List<Product> productList = null;
      int count = 0;
      try {
         productList = productService.listByConditions(map);
         count = productService.countByConditions(map);
      } catch (Exception e) {
         throw new ServletException("CartService.list() 예외 발생", e);
      }
      mav.addObject("productList", productList);
      mav.addObject("count", count);
      
      // 보낼지 말지~
      mav.addObject("array", array);
      mav.addObject("minAmount", minAmount);
      mav.addObject("maxAmount", maxAmount);
      mav.addObject("productType", productType);
      mav.setView("/shop.jsp");
      return mav;

   }
}