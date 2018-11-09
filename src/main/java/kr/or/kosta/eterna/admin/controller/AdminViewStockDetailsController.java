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
import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.domain.ProductImage;

/**	제품목록 출력 서블릿
 * @author 권현우
 *
 */
public class AdminViewStockDetailsController implements Controller {
	private AdminService adminService;
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
				
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				response.setContentType("application/json; charset=utf-8");
				adminService = (AdminService)factory.getBean(AdminServiceImpl.class);
				String productId = request.getParameter("productId");
				Product product = null;
				ProductImage productImage = null;
				JSONObject jsonObject = null;
			    try {
			    	Map<String,Object> map = adminService.showStockListDetails(productId);
			    	product =(Product) map.get("product"); 
			    	jsonObject = new JSONObject();
			    	jsonObject.put("productId", product.getProductId());
			    	jsonObject.put("categoryType", product.getCategoryType());
			    	jsonObject.put("productBrand", product.getProductBrand());
			    	jsonObject.put("productSex", product.getProductSex());
			    	jsonObject.put("productDescription", product.getProductDescription());
			    	jsonObject.put("productStock", product.getProductStock());
			    	jsonObject.put("createDate", product.getCreateDate());
			    	jsonObject.put("modifyDate", product.getModifyDate());
			    	jsonObject.put("minAge", product.getMinAge());
			    	jsonObject.put("maxAge", product.getMaxAge());
			    	jsonObject.put("price", product.getPrice());
			    	List<ProductImage>imageList = (List)map.get("imageList");
			    	jsonObject.put("thumNail", imageList.get(0).getFileName());
			    	jsonObject.put("MainIMG", imageList.get(1).getFileName());
			    	jsonObject.put("sideIMG", imageList.get(2).getFileName());
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
			    out.println(jsonObject.toJSONString());
		return null;
	}

}
