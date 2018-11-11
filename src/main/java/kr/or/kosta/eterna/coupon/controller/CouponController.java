package kr.or.kosta.eterna.coupon.controller;

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
import kr.or.kosta.eterna.coupon.service.CouponService;
import kr.or.kosta.eterna.coupon.service.CouponServiceImpl;
import kr.or.kosta.eterna.review.domain.Review;

public class CouponController implements Controller {
   private CouponService couponService;
   Logger logger = Logger.getLogger(CouponController.class);
   

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      ModelAndView mav = new ModelAndView();
      
      XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
      couponService = (CouponService)factory.getBean(CouponServiceImpl.class);
      List<Coupon> list = null;
      
      String userId = (String)request.getAttribute("loginId");
      
      try {
    	  list = couponService.userCouponList(userId);
		} catch (Exception e) {
			throw new ServletException("CouponList 예외 발생", e);
	  }
      
      
      response.setContentType("application/json; charset=utf-8");
		
		JSONArray jsonArray = new JSONArray();

		for (Coupon coupon : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("couponId", coupon.getCouponId());
			jsonObject.put("couponName", coupon.getCouponName());
			jsonObject.put("couponRate", coupon.getCouponRate());
			jsonObject.put("useFlag", coupon.getUseFlag());
			jsonObject.put("couponDate", coupon.getStartDate() + " - " + coupon.getEndDate());
			jsonArray.add(jsonObject);
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(jsonArray.toJSONString());
		out.println(jsonArray.toJSONString());
		
		return null;
   }
}
