package kr.or.kosta.eterna.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;

/**	//hello.mall에 대한 처리 클래스
 * @author 권현우
 *
 */
public class adminIndexController implements Controller {
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				ModelAndView mav = new ModelAndView();
				
				mav.setView("/admin/adminIndex.jsp");
		return mav;
	}

}
