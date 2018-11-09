package kr.or.kosta.eterna.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**   관리자 메인페이지 출력 서블릿
 * @author 조희진
 *
 */
public class AdminMainController implements Controller {
   private AdminService adminService;
   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {
            ModelAndView mav = new ModelAndView();
            
            XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
            adminService = (AdminService)factory.getBean(AdminServiceImpl.class);
            int orderCount = 0;
            int stockCount = 0;
            int newUser = 0;
            int newQnA = 0;
            int newReview = 0;
            int flag = 1;
             try {
                orderCount = adminService.newOrder();
                stockCount = adminService.outOfStock();
                newUser = adminService.newUser();
                newQnA = adminService.newQnA();
                newReview = adminService.newReview();
            } catch ( Exception e1) {
               throw new ServletException("OrderListService.list() 예외 발생", e1);
            }
             mav.addObject("orderCount", orderCount);
             mav.addObject("stockCount", stockCount);
             mav.addObject("newUser", newUser);
             mav.addObject("newQnA", newQnA);
             mav.addObject("newReview", newReview);
             mav.addObject("flag", flag);
            mav.setView("/admin/index.mall");
      return mav;
   }

}