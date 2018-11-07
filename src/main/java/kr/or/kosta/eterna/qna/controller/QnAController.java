package kr.or.kosta.eterna.qna.controller;

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
import kr.or.kosta.eterna.qna.domain.QnA;
import kr.or.kosta.eterna.qna.service.QnAService;
import kr.or.kosta.eterna.qna.service.QnAServiceImpl;

public class QnAController implements Controller{
	private QnAService qnAService;
	Logger logger = Logger.getLogger(QnAController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		qnAService = (QnAService)factory.getBean(QnAServiceImpl.class);
		List<QnA> list = null;
		
		String productId = request.getParameter("productId");
		System.out.println("---------productId: "+productId);
		try {
			list = qnAService.listItem(productId);
		} catch (Exception e) {
			throw new ServletException("qnaService.list() 예외 발생", e);
		}
		response.setContentType("application/json; charset=utf-8");
		JSONArray jsonArray = new JSONArray();

		for (QnA review : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", review.getId());
			jsonObject.put("userId", review.getUserId());
			jsonObject.put("productId", review.getProductId());
			jsonObject.put("regdate", review.getRegdate());
			jsonObject.put("content", review.getContent());
			jsonObject.put("subject", review.getSubject());
			jsonObject.put("groupNo", review.getGroupNo());
			jsonObject.put("levelNo", review.getLevelNo());
			jsonObject.put("answerFlag", review.getLevelNo());
			jsonObject.put("secretFlag", review.getSecretFlag());
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
