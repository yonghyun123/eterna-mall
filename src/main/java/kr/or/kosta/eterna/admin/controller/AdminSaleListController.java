package kr.or.kosta.eterna.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.buy.service.BuyService;
import kr.or.kosta.eterna.buy.service.BuyServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * 관리자페이지에서 판매량에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class AdminSaleListController implements Controller {
   
   private BuyService buyService;

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      String categoryId = request.getParameter("category");
      XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
      buyService = (BuyService)factory.getBean(BuyServiceImpl.class);
      List<Buy> list = null;
      try {
         list = buyService.listPerMonth(categoryId);
      } catch (Exception e) {
         throw new ServletException("BuyService.list() 예외 발생", e);
      }
      response.setContentType("application/json; charset=utf-8");
      JSONArray jsonArray = new JSONArray();
      for (Buy buy : list) {
         JSONObject jsonObject = new JSONObject();
         jsonObject.put("productDescription", buy.getProductDescription());
         jsonObject.put("count", buy.getCount());
         jsonArray.add(jsonObject);
      }
      
      PrintWriter out = null;
      try {
         out = response.getWriter();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println(jsonArray.toJSONString());
      out.println(jsonArray.toJSONString());
      
      return null;
   }
   

}