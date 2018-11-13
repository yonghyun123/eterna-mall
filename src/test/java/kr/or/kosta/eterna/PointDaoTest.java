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

import kr.or.kosta.eterna.point.dao.MybatisPointDao;
import kr.or.kosta.eterna.point.dao.PointDao;
import kr.or.kosta.eterna.point.domain.Point;
import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class PointDaoTest {

//   private static final String NAMESPACE = "kr.or.kosta.eterna.user.";
   
   String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
   SqlSessionFactory sqlSessionFactory;
   Logger logger = Logger.getLogger(ProductDao.class);

   PointDao pointDao;
   
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
      pointDao = new MybatisPointDao();
      ((MybatisPointDao)pointDao).setSqlSessionFactory(sqlSessionFactory);
   }

   @Test
   public void hotItem() {
	   try {
			List<Point>list = pointDao.userPointList("test1");
			for (Point point : list) {
				logger.debug(point);
			}
	   } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   }
   }
}