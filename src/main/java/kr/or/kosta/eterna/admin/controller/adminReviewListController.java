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
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.review.domain.Review;
import kr.or.kosta.eterna.review.service.ReviewService;
import kr.or.kosta.eterna.review.service.ReviewServiceImpl;

/**	후기 출력 서블릿
 * @author 권현우
 *
 */
public class adminReviewListController implements Controller {
	private ReviewService reviewService;
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				reviewService = (ReviewService)factory.getBean(ReviewServiceImpl.class);
				List<Review> list = null;
				JSONObject object = new JSONObject();
			    JSONArray jArray = new JSONArray();
			    PrintWriter writer = null;
			    try {
					 writer = response.getWriter();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					list = reviewService.listAll();
					for (Review review : list) {
					object.put("id", review.getId());
					object.put("userId", review.getUserId());
					object.put("productId", review.getProductId());
					object.put("boardId", review.getBoardId());
					object.put("content", review.getContent());
					object.put("score", review.getScore());
					object.put("answerFlag", review.getAnswerFlag());
				    jArray.add(object);
					}
					writer.println(jArray);
				} catch (Exception e) {
					throw new ServletException("UserService.list() 예외 발생", e);
				}
				
		return null;
	}

}
