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

public class QnAUserListController implements Controller{
	private QnAService qnAService;
	Logger logger = Logger.getLogger(QnAUserListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		qnAService = (QnAService)factory.getBean(QnAServiceImpl.class);
		String userId = (String)request.getAttribute("loginId");
		System.out.println("user : " + userId);
		List<QnA> list = null;
		
		try {
			list = qnAService.myList(userId);
		} catch (Exception e) {
			throw new ServletException("qnaService.list() 예외 발생", e);
		}
		response.setContentType("application/json; charset=utf-8");
		JSONArray jsonArray = new JSONArray();

		for (QnA qna : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", qna.getId());
			jsonObject.put("productName", qna.getProductDescription());
			jsonObject.put("subject", qna.getSubject());
			jsonObject.put("content", qna.getContent());
			jsonObject.put("regdate", qna.getRegdate());
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
