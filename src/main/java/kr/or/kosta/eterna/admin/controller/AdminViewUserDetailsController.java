package kr.or.kosta.eterna.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.domain.UserRcmd;

/**	회원 상세보기 출력 서블릿
 * @author 권현우
 *
 */
public class AdminViewUserDetailsController implements Controller {
	private AdminService adminService;
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				
				response.setContentType("application/json; charset=utf-8");
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				adminService = (AdminService)factory.getBean(AdminServiceImpl.class);
				String userId = request.getParameter("userId");
				User user = null;
				UserRcmd userRcmd = null;
				JSONObject jsonObject = null;
			    try {
			    	Map<String, Object> map = adminService.showUserListDetails(userId);
			    	user = (User)map.get("user");
			    	jsonObject = new JSONObject();
			    	jsonObject.put("userId", user.getUserId());
			    	jsonObject.put("userName", user.getUserName());
			    	jsonObject.put("userEmail", user.getUserEmail());
			    	jsonObject.put("userPasswd", user.getUserPasswd());
			    	jsonObject.put("userAddress", user.getUserAddress());
			    	jsonObject.put("userTel", user.getUserTel());
			    	jsonObject.put("tierId", user.getTierId());
			    	jsonObject.put("userGrade", user.getUserGrade());
			    	jsonObject.put("userPoint", user.getUserPoint());
			    	jsonObject.put("userRegdate", user.getUserRegdate());
			    	List<String>sortedList = (List)map.get("sortedKeyList");
			    	jsonObject.put("rcmdOne", sortedList.get(0));
			    	jsonObject.put("rcmdTwo", sortedList.get(1));
			    	jsonObject.put("rcmdThree", sortedList.get(2));
				} catch ( Exception e1) {
					throw new ServletException("OrderListService.list() 예외 발생", e1);
				}
			    PrintWriter out = null;
			    try {
					out = response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    System.out.println(jsonObject.toJSONString());
			    out.println(jsonObject.toJSONString());
		return null;
	}

}
