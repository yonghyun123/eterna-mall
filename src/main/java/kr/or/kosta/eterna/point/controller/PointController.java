package kr.or.kosta.eterna.point.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.point.domain.Point;
import kr.or.kosta.eterna.point.service.PointService;
import kr.or.kosta.eterna.point.service.PointServiceImpl;

public class PointController implements Controller {
   private PointService pointService;
   Logger logger = Logger.getLogger(PointController.class);
   

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
      pointService = (PointService)factory.getBean(PointServiceImpl.class);
      List<Point> list = null;
      
      String userId = (String)request.getAttribute("loginId");
      
      try {
    	  list = pointService.userPointList(userId);
		} catch (Exception e) {
			throw new ServletException("PointList 예외 발생", e);
	  }
      
      
      response.setContentType("application/json; charset=utf-8");
		
		JSONArray jsonArray = new JSONArray();

		for (Point point : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("orderNumber", point.getId());
			jsonObject.put("pointDate", point.getRegdate());
			jsonObject.put("pointFlag", point.getStatus());
			if(point.getStatus().equals("사용")) {
				jsonObject.put("point", (Integer.parseInt(point.getPoint())) * -1);
			} else {
				jsonObject.put("point", point.getPoint());
			}
			jsonArray.add(jsonObject);
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
