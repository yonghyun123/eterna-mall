package kr.or.kosta.eterna;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;

import kr.or.kosta.eterna.productImage.dao.MybatisProductImageDao;
import kr.or.kosta.eterna.productImage.dao.ProductImageDao;
import kr.or.kosta.eterna.productImage.domain.ProductImage;

public class ProductImageDaoTest {

//   private static final String NAMESPACE = "kr.or.kosta.eterna.user.";
   
   String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
   SqlSessionFactory sqlSessionFactory;
   Logger logger = Logger.getLogger(ProductImageDao.class);

   ProductImageDao productImageDao;
   
   @Before
   public void setup() {
      Reader reader = null;
      try {
         reader = Resources.getResourceAsReader(resource);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development");
      logger.debug("sqlSessionFactory 생성 완료!");
      productImageDao = new MybatisProductImageDao();
      ((MybatisProductImageDao)productImageDao).setSqlSessionFactory(sqlSessionFactory);
   }

   //@Test
   public void testRegist() {
      ProductImage productImage = new ProductImage();
      productImage.setImageId(101);
      productImage.setImageType("ettt");
      productImage.setProductId(101);
      productImage.setFileId(100);
      try {
    	  
         productImageDao.regist(productImage);
         logger.debug(productImage);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   @Test
  public void testDelete() {
       Map<String, Object>map = new HashMap<String, Object>();
       map.put("productId", 100);
       map.put("imageType", "et");
	   try {
             productImageDao.delete(map);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
   }
   
   //@Test
   public void testUpdate() {
	   	ProductImage productImage = new ProductImage();
	   	productImage.setFileId(150);
	   	productImage.setProductId(101);
	   	productImage.setImageType("ettt");

      try {
    	  productImageDao.update(productImage);
      } catch (Exception e) {
         e.printStackTrace();
      }
      logger.debug("업데이트 완료!");
   }
 
   @Test
   public void testImageAll() {
	   try {
		List<ProductImage>PImagelist = productImageDao.imageAll("100");
		for (ProductImage productImage : PImagelist) {
			logger.debug(productImage);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
}