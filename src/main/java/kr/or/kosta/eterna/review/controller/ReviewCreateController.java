package kr.or.kosta.eterna.review.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.review.domain.Review;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;

public class ReviewCreateController implements Controller{
	private ReviewService reviewService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		reviewService = (ReviewService)factory.getBean(ReviewServiceImpl.class);
		String productId = request.getParameter("productId");
		String userId = request.getParameter("userId");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String score = request.getParameter("score");
		content = content.replace("\r\n", "<br>");
		
		Review review = new Review();
		review.setProductId(productId);
		review.setContent(content);
		review.setScore(score);
		review.setUserId(userId);
		review.setSubject(subject);
		
		try {
			reviewService.create(review);
		} catch (Exception e) {
			throw new ServletException("reviewService.list() 예외 발생", e);
		}
		
		mav.setView("redirect:/detail.mall?productId="+productId);
		return mav;
	}
}
