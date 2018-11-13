package kr.or.kosta.eterna.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.qna.domain.QnA;

/**
 * Q&A 답변 글 등록 서블릿
 * 
 * @author 조희진
 *
 */
public class AdminQnACommentController implements Controller {
	private AdminService adminService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		content = content.replace("\r\n", "<br>");
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		adminService = (AdminService) factory.getBean(AdminServiceImpl.class);
		QnA qna = new QnA();
		qna.setContent(content);
		qna.setId(id);
		try {
			adminService.createComment(qna);
		} catch (Exception e) {
			throw new ServletException("UserService.list() 예외 발생", e);
		}
		mav.setView("redirect:/admin/qnalist.mall");
		return mav;
	}

}
