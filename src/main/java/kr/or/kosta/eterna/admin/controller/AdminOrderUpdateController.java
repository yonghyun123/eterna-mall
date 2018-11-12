package kr.or.kosta.eterna.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * 배송 상태 변경 서블릿
 * 
 * @author 조희진
 *
 */
public class AdminOrderUpdateController implements Controller {
   private AdminService adminService;

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
      String orderFlag = request.getParameter("orderFlag");
      String id = request.getParameter("id");
      String userId = request.getParameter("userId");
      String[] productDescription = request.getParameterValues("product");
      String[] count = request.getParameterValues("count");
      ModelAndView mav = new ModelAndView();
      XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
      adminService = (AdminService) factory.getBean(AdminServiceImpl.class);
      try {
         adminService.updateStatus(id, orderFlag);
         if(orderFlag.equals("2")){
         adminService.updateTier(userId);
         }
         if(orderFlag.equals("1")){
        	 for(int i = 0; i < productDescription.length ; i++){
        		 adminService.updateStock(productDescription[i], count[i]);
        	 }
         }
      } catch (Exception e) {
         throw new ServletException("AdminService.list() 예외 발생", e);
      }
      mav.setView("redirect:/admin/orderlist.mall");
      return mav;
   }

}