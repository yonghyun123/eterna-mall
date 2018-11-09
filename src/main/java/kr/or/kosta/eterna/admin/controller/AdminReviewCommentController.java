package kr.or.kosta.eterna.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.review.domain.Review;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;

/**
 * Review 답변 글 등록 서블릿
 * 
 * @author 조희진
 *
 */
public class AdminReviewCommentController implements Controller {
   private ReviewService reviewService;

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      String id = request.getParameter("id");
      String content = request.getParameter("content");
      ModelAndView mav = new ModelAndView();
      XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
      reviewService = (ReviewService) factory.getBean(ReviewServiceImpl.class);
      Review review = new Review();
      review.setContent(content);
      review.setId(id);
      try {
         reviewService.createComment(review);
      } catch (Exception e) {
         throw new ServletException("UserService.list() 예외 발생", e);
      }
      mav.setView("redirect:/admin/reviewlist.mall");
      return mav;
   }

}