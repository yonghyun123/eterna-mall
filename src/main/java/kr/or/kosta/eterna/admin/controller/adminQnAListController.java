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
import kr.or.kosta.eterna.qna.domain.QnA;
import kr.or.kosta.eterna.qna.service.QnAService;
import kr.or.kosta.eterna.qna.service.QnAServiceImpl;

/**	질문 리스트 출력 서블릿
 * @author 권현우
 *
 */
public class adminQnAListController implements Controller {
	private QnAService qnaService;
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				qnaService = (QnAService)factory.getBean(QnAServiceImpl.class);
				List<QnA> list = null;
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
					System.out.println(qnaService);
					list = qnaService.listAll();
					for (QnA qna : list) {
					object.put("id", qna.getId());
					object.put("userId", qna.getUserId());
					object.put("productId", qna.getProductId());
					object.put("boardId", qna.getBoardId());
					object.put("subject", qna.getSubject());
					object.put("content", qna.getContent());
					object.put("regdate", qna.getRegdate());
					object.put("answerFlag", qna.getAnswerFlag());
					object.put("groupNo", qna.getGroupNo());
					object.put("levelNo", qna.getLevelNo());
				    jArray.add(object);
					}
					writer.println(jArray);
				} catch (Exception e) {
					throw new ServletException("UserService.list() 예외 발생", e);
				}
				
		return null;
	}

}
