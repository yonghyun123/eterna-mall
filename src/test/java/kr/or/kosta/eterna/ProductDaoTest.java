package kr.or.kosta.eterna;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;

import kr.or.kosta.eterna.product.dao.MybatisProductDao;
import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class ProductDaoTest {

//   private static final String NAMESPACE = "kr.or.kosta.eterna.user.";
   
   String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
   SqlSessionFactory sqlSessionFactory;
   Logger logger = Logger.getLogger(ProductDao.class);

   ProductDao productDao;
   
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
      productDao = new MybatisProductDao();
      ((MybatisProductDao)productDao).setSqlSessionFactory(sqlSessionFactory);
   }

   //@Test
   public void testRegist() {
      Product product = new Product();
      product.setProductId("102");
      product.setProductBrand("피부피부");
      product.setProductSex("남성");
      product.setProductDescription("좋은화장품ㅇ입니다.");
      product.setProductStock("100");
      product.setMinAge("20");
      product.setMaxAge("40");
      try {
    	  
         productDao.regist(product);
         logger.debug(product);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   //@Test
   public void testRead() {
         try {
            Product product = productDao.read("50");
            logger.debug(product);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
   }
   
   //@Test
   public void testDelete() {
         try {
             productDao.delete("110");
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
   }
   
//   @Test
   public void testUpdate() {
	   	Product product = new Product();
	      product.setProductBrand("랑콤");
	      product.setProductDescription("차암 좋은화장품입니다.");
	      product.setProductStock("1000");
	      product.setMinAge("30");
	      product.setMaxAge("50");
	      product.setProductId("50");
      try {
         productDao.update(product);
      } catch (Exception e) {
         e.printStackTrace();
      }
      logger.debug("업데이트 완료!");
   }
   
   //@Test
   public void testDuplicateCheck() {
	   try {
		boolean flag = productDao.duplicateCheck("102");
		logger.debug(flag);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   @Test
   public void testListAll() {
	   try {
		List<Product>Plist = productDao.listAll();
		for (Product product : Plist) {
			logger.debug(product);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
}