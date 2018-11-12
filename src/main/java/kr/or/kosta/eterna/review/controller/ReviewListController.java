package kr.or.kosta.eterna.review.controller;

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
import kr.or.kosta.eterna.review.domain.Review;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;

/**
 * /user/cartlist.mall에 대한 요청 처리 컨트롤러
 * @author 조희진
 *
 */
public class ReviewListController implements Controller {
	
	private ReviewService reviewService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		reviewService = (ReviewService)factory.getBean(ReviewServiceImpl.class);
		List<Review> list = null;
		String productId = null, userId = null;
		productId = request.getParameter("productId");
		
		try {
			if(productId != null) {
				list = reviewService.listItem(productId);
			} else {
				userId = (String)request.getAttribute("loginId");
				list = reviewService.myReviewList(userId);
			}
			System.out.println(list);
		} catch (Exception e) {
			throw new ServletException("reviewService.list() 예외 발생", e);
		}
		response.setContentType("application/json; charset=utf-8");
		
		JSONArray jsonArray = new JSONArray();

		for (Review review : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", review.getId());
			jsonObject.put("userId", review.getUserId());
			jsonObject.put("productId", review.getProductId());
			jsonObject.put("regdate", review.getRegdate());
			jsonObject.put("score", review.getScore());
			jsonObject.put("levelNo", review.getLevelNo());
			jsonObject.put("content", review.getContent());
			
			if(userId != null) {
				jsonObject.put("subject", "[" + review.getDescription() + "]  " + review.getSubject());
			} else {
				jsonObject.put("subject", review.getSubject());
			}
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
		
		//mav.addObject("list", list);
		//mav.setView("/user/reviewlist.jsp");
		return null;
	}

}
