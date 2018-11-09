package kr.or.kosta.eterna.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**   주문목록 출력 서블릿
 * @author 권현우
 *
 */
public class AdminViewOrderDetailsController implements Controller {
   private AdminService adminService;
   @SuppressWarnings("unchecked")
   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
            response.setContentType("application/json; charset=utf-8");
            XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
            adminService = (AdminService)factory.getBean(AdminServiceImpl.class);
            String orderNum = request.getParameter("orderNum");
            JSONObject jsonObject = null;
            JSONArray jsonArray = new JSONArray();
            List<Buy> list = null;
             try {
                list = adminService.showOrderListDetails(orderNum);
                for (Buy buy : list) {
                   jsonObject = new JSONObject();
                   jsonObject.put("productDescription", buy.getProductDescription());
                   jsonObject.put("count", buy.getCount());
                   jsonObject.put("fileName", buy.getFileName());
                   jsonObject.put("id", buy.getId());
                   jsonArray.add(jsonObject);
               }
            } catch ( Exception e1) {
               throw new ServletException("OrderListService.list() 예외 발생", e1);
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