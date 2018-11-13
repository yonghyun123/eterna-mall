package kr.or.kosta.eterna.index.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.index.service.IndexService;
import kr.or.kosta.eterna.index.service.IndexServiceImpl;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.userRcmd.service.UserRcmdService;
import kr.or.kosta.eterna.userRcmd.service.UserRcmdServiceImpl;

/**
 * index.mall에 대한 요청 처리 컨트롤러
 * 
 * @author 권현우
 *
 */
public class IndexController implements Controller {

	private IndexService indexService;
	private UserRcmdService userRcmdService;
	private AdminService adminService;
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		indexService = (IndexService) factory.getBean(IndexServiceImpl.class);
		userRcmdService=(UserRcmdService)factory.getBean(UserRcmdServiceImpl.class);
		adminService=(AdminService)factory.getBean(AdminServiceImpl.class);
		
		List<Product> BrandNewZeroList=null;
		List<Product> HotItemList=null;
		try {
		BrandNewZeroList = indexService.brandNewList("0");
		if(request.getAttribute("loginId") == null) {
		HotItemList = indexService.popularProductList();
		}else {
			String loginId =(String) request.getAttribute("loginId");
			Map<String, Object> map = adminService.showUserListDetails(loginId);
			List<String> list = (List)map.get("sortedKeyList");
			System.out.println("result=" + indexService.popularProductListByRcmd(list.get(0)));
			if(indexService.popularProductListByRcmd(list.get(0)).size()!=0) {
			HotItemList = indexService.popularProductListByRcmd(list.get(0));
			}else {
			HotItemList = indexService.popularProductList();
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("BrandNewZeroList", BrandNewZeroList);
		mav.addObject("HotItemList", HotItemList);
		
		mav.setView("/");
		return mav;

	}

}
