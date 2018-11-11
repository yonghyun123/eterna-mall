package kr.or.kosta.eterna.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

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
	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
				final String fileRepository = "C:/Users/USER/Desktop/Project_workSpace/Project_eterna/src/main/webapp/images/";
				ModelAndView mav = new ModelAndView();
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
							/*String writer = item.getString("utf-8");
							System.out.println(item.getFieldName() +":" + writer);
							*/
							fieldMap.put(item.getFieldName(), item.getString("utf-8"));
						}else {
							fieldMap.put(item.getFieldName(), item.getName());
							System.out.println(item.getFieldName());
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
				
				
				
				
				/**product 등록*/
				Product product = new Product();
				
				product.setProductId("53");
				product.setProductBrand(inputBrand);
				product.setCategoryType(categorySelector);
				product.setProductSex(sexSelector);
				product.setProductDescription(inputProduct);
				product.setProductStock(productStock);
				product.setMinAge(minAgeSelector);
				product.setMaxAge(maxAgeSelector);
				
				

				
				/**file 등록*/
				FileInfo fileThum = new FileInfo();
				FileInfo fileMain = new FileInfo();
				FileInfo fileSide = new FileInfo();
				
				fileThum.setFileId("53");
				
				fileMain.setFileId("54");
				
				fileSide.setFileId("55");
				
				
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
				thumImage.setImageId("53");
				mainImage.setImageId("54");
				sideImage.setImageId("55");
				
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
				price.setId("53");
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				
/*				Product product = null;
				ProductImage productImage = null;
				JSONObject jsonObject = null;*/
			    /*try {
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
			    
			    try {
					out = response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    out.println("done");
		return null;
	}

}
