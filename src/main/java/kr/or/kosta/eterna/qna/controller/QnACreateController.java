package kr.or.kosta.eterna.qna.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.qna.domain.QnA;
import kr.or.kosta.eterna.qna.service.QnAService;
import kr.or.kosta.eterna.qna.service.QnAServiceImpl;

public class QnACreateController implements Controller{

	private QnAService qnAService;
	Logger logger = Logger.getLogger(QnAController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		qnAService = (QnAService)factory.getBean(QnAServiceImpl.class);

		String productId = request.getParameter("productId");
		String userId = request.getParameter("userId");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		content = content.replace("\r\n", "<br>");
		String secretFlag = request.getParameter("secret-flag");
		
		QnA qna = new QnA();
		qna.setUserId(userId);
		qna.setProductId(productId);
		qna.setSubject(subject);
		if(secretFlag != null){
			qna.setSecretFlag(secretFlag);
		} else {
			qna.setSecretFlag("0");
		}
		qna.setContent(content);
		
		try {
			qnAService.create(qna);
		} catch (Exception e) {
			throw new ServletException("qnaService.list() 예외 발생", e);
		}
		mav.setView("redirect:/detail.mall?productId="+productId);
		return mav;
		
	}
}
