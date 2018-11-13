package kr.or.kosta.eterna.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.or.kosta.eterna.admin.service.AdminService;
import kr.or.kosta.eterna.admin.service.AdminServiceImpl;
import kr.or.kosta.eterna.common.controller.Controller;
import kr.or.kosta.eterna.common.controller.ModelAndView;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;
import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.price.domain.Price;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.domain.ProductImage;

/**	제품 등록 서블릿
 * @author 권현우
 *
 */
public class AdminProductRegistController implements Controller {
	private AdminService adminService;
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
				final String fileRepository = "C:/workspace2/eternamall/src/main/webapp/images/";
				XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
				response.setContentType("application/json; charset=utf-8");
				
				Map<String, String> fieldMap = new HashMap<String,String>();
				try {
					request.setCharacterEncoding("utf-8");
					DiskFileItemFactory itemFactory = new DiskFileItemFactory();
					ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
					fileUpload.setSizeMax(5 * 1024 * 1024); // 업로드 파일 용량 제한
					List<FileItem> fileList = null;
					fileList = fileUpload.parseRequest(request);
					
					for (FileItem item : fileList) {
						if (item.isFormField()) {
							fieldMap.put(item.getFieldName(), item.getString("utf-8"));
						}else {
							fieldMap.put(item.getFieldName(), item.getName());
							String fileName = item.getName();
							String[] tokens = fileName.split("\\\\");
							fileName = tokens[tokens.length-1];//파일명만 추출
							File saveFile = new File(fileRepository + fileName);
							item.write(saveFile);
						}
					}
					
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				adminService = (AdminService)factory.getBean(AdminServiceImpl.class);
				
				String categorySelector = fieldMap.get("categorySelector");
				String inputBrand = fieldMap.get("inputBrand");
				String sexSelector = fieldMap.get("sexSelector");
				String inputProduct = fieldMap.get("inputProduct");
				String productStock = fieldMap.get("productStock");
				String InputPrice = fieldMap.get("InputPrice");
				String minAgeSelector = fieldMap.get("minAgeSelector");
				String maxAgeSelector = fieldMap.get("maxAgeSelector");				
				String inputThumnail = fieldMap.get("inputThumnail");
				String inputMainImg = fieldMap.get("inputMainImg");
				String inputSideImg = fieldMap.get("inputSideImg");
				String skinType = fieldMap.get("skinType");
				if(skinType.equals("oily")){
					skinType = "지성";
				}else if(skinType.equals("dry")){
					skinType = "건성";
				}else{
					skinType = "복합성";
				}
				
				/**product 등록*/
				Product product = new Product();
				product.setProductId("300");
				product.setProductBrand(inputBrand);
				product.setCategoryType(categorySelector);
				product.setProductSex(sexSelector);
				product.setProductDescription(inputProduct);
				product.setProductStock(productStock);
				product.setMinAge(minAgeSelector);
				product.setMaxAge(maxAgeSelector);
				product.setProductType(skinType);
				
				/**file 등록*/
				FileInfo fileThum = new FileInfo();
				FileInfo fileMain = new FileInfo();
				FileInfo fileSide = new FileInfo();
				fileThum.setFileId("300");
				fileMain.setFileId("301");
				fileSide.setFileId("302");
				
				fileThum.setFileName(inputThumnail);
				fileMain.setFileName(inputMainImg);
				fileSide.setFileName(inputSideImg);
				
				fileThum.setContentType("image/" + inputThumnail.substring(inputThumnail.indexOf(".")));
				fileMain.setContentType("image/" + inputMainImg.substring(inputMainImg.indexOf(".")));
				fileSide.setContentType("image/" + inputSideImg.substring(inputSideImg.indexOf(".")));
				
				FileInfo [] fileArray =new FileInfo [] {fileThum, fileMain, fileSide};
				
				/**Image 등록*/
				ProductImage thumImage = new ProductImage();
				ProductImage mainImage = new ProductImage();
				ProductImage sideImage = new ProductImage();
				thumImage.setImageId("300");
				mainImage.setImageId("301");
				sideImage.setImageId("302");
				
				thumImage.setFileId(fileThum.getFileId());
				mainImage.setFileId(fileMain.getFileId());
				sideImage.setFileId(fileSide.getFileId());
				
				thumImage.setImageType("th");
	            mainImage.setImageType("ma");
	            sideImage.setImageType("etc");

				thumImage.setProductId(product.getProductId());
				mainImage.setProductId(product.getProductId());
				sideImage.setProductId(product.getProductId());
				ProductImage [] imageArray = new ProductImage [] {thumImage,mainImage,sideImage}; 
				
				/**Price 등록*/
				Price price = new Price();
				price.setId("300");
				price.setPrice(InputPrice);
				price.setProductId(product.getProductId());
				
				try {
					Map<String, Object>map = new HashMap<String,Object>();
					map.put("product", product);
					map.put("fileArray", fileArray);
					map.put("imageArray", imageArray);
					map.put("price", price);
					
					adminService.registProduct(map);	
				} catch (Exception e) {
					e.printStackTrace();
				}

				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
			    out.println("done");
		return null;
	}

}
