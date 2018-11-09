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

public class ProductController implements Controller {
   private ProductService productService;
   Logger logger = Logger.getLogger(ProductController.class);
   

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      ModelAndView mav = new ModelAndView();
      
      XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
      productService = (ProductService)factory.getBean(ProductServiceImpl.class);
      List<Product> list = null;
      
      String productSex = null;
      if(request.getParameter("sex") != null) {
         productSex = request.getParameter("sex");
      }
      
      int count = 0;

      try {
         if(productSex != null) {
            list = productService.listBySex(productSex);
            count = productService.countPerSex(productSex);
         }else {
            list = productService.listAll();
            count = productService.countAll();
         }
         
         
      } catch (Exception e) {
         throw new ServletException("CartService.list() 예외 발생", e);
      }
      mav.addObject("productList", list);
      mav.addObject("count", count);
      mav.addObject("productSex", productSex);

      mav.setView("/shop.jsp");
      return mav;

   }
}