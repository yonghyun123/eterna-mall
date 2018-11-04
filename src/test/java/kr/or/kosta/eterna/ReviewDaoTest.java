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

import kr.or.kosta.eterna.review.dao.MybatisReviewDao;
import kr.or.kosta.eterna.review.dao.ReviewDao;
import kr.or.kosta.eterna.review.domain.Review;

public class ReviewDaoTest {
	
	String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
	SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(ReviewDaoTest.class);

	ReviewDao reviewDao;
	
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
		reviewDao = new MybatisReviewDao();
		((MybatisReviewDao)reviewDao).setSqlSessionFactory(sqlSessionFactory);
	}

	
//	@Test
	public void testCreate() {
		Review review = new Review("hee", "100","추천합니다^^", "5");
		try {
			reviewDao.create(review);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/*

	//	@Test
	public void testRead() {
			try {
				Cart cart = cartDao.read("hee","14");
				logger.debug(cart);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
//	@Test
	public void testUpdate() {
		Cart cart = new Cart("hee", "3", "14");
		try {
			cartDao.update(cart);
			logger.debug("업데이트 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testDelete() {
		String id = "hee";
		String productId = "2";
		try {
			cartDao.delete(id, productId);
			logger.debug("삭제 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/

//		@Test
	public void testListItem() {
		try {
			List<Review> list = reviewDao.listItem("100");
			for (Review review : list) {
				logger.debug(review);
				//System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	@Test
public void testMyReviewList() {
	try {
		List<Review> list = reviewDao.myReviewList("hee");
		for (Review review : list) {
			logger.debug(review);
			//System.out.println(user);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

@Test
public void testListAll() {
try {
	List<Review> list = reviewDao.listAll();
	for (Review review : list) {
		logger.debug(review);
		//System.out.println(user);
	}
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
	

}
