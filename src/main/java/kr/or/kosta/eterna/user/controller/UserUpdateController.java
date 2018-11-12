package kr.or.kosta.eterna.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.service.UserService;
import kr.or.kosta.eterna.user.service.UserServiceImpl;

/**
 * /user/list.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 김기정
 *
 */
public class UserUpdateController implements Controller {

	private UserService userService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		userService = (UserService) factory.getBean(UserServiceImpl.class);
		response.setContentType("application/json;charset=utf-8");
		String loginId = null;
		String inputPW = null;
		String userEmail = null;
		String confirmNewPW = null;
		String newAddress = null;
		String emailCheck = null;

		PrintWriter out = null;
		try {
			out = response.getWriter();

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		loginId = (String) request.getAttribute("loginId");
		if (request.getParameter("inputPW") != null) {
			inputPW = request.getParameter("inputPW");

			User userInfo = null;
			try {
				userInfo = userService.certify(loginId, inputPW);
				System.out.println(userInfo);
			} catch (Exception e) {
				throw new ServletException("UserService.list() 예외 발생", e);
			}
			if (userInfo != null) {
				String[] token = userInfo.getUserAddress().split("/");
				String zipcode = token[0];
				String streetAddress = token[1];
				String detailAddress = token[2];
				JSONArray jsonArray = new JSONArray();

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("userId", userInfo.getUserId());
				jsonObject.put("userName", userInfo.getUserName());
				jsonObject.put("userEmail", userInfo.getUserEmail());
				jsonObject.put("userZipcode", zipcode);
				jsonObject.put("userStreetAddress", streetAddress);
				jsonObject.put("userDetailAddress", detailAddress);
				jsonObject.put("userRegdate", userInfo.getUserRegdate());
				jsonObject.put("userTel", userInfo.getUserTel());
				jsonArray.add(jsonObject);

				System.out.println(jsonArray.toJSONString());
				out.println(jsonArray.toJSONString());
			} else {
				out.println("fail");
			}
		} else if (request.getParameter("emailCheck") != null) {
			emailCheck = request.getParameter("emailCheck");
			System.out.println("emailCheck : " + emailCheck);
			String emailFlag = "success";
			try {
				List<User> list = userService.listAll();
				for (int i = 0; i < list.size(); i++) {
					if ((list.get(i).getUserEmail().equals(emailCheck))
							&& (!userService.read(loginId).getUserEmail().equals(emailCheck))) {
						emailFlag = "fail";
					}
				}
				out.println(emailFlag);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ((request.getParameter("userEmail") != null) || (request.getParameter("confirmNewPW") != null)
				|| (request.getParameter("newAddress") != null)) {
			userEmail = request.getParameter("userEmail");
			confirmNewPW = request.getParameter("confirmNewPW");
			newAddress = request.getParameter("newAddress");
			System.out.println("userEmail : " + userEmail);
			System.out.println("confirmNewPW : " + confirmNewPW);
			System.out.println("newAddress : " + newAddress);
			User user = new User();
			user.setUserId(loginId);
			user.setUserPasswd(confirmNewPW);
			user.setUserEmail(userEmail);
			user.setUserAddress(newAddress);
			try {
				userService.update(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

}
