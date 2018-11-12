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

import kr.or.kosta.eterna.buy.dao.BuyDao;
import kr.or.kosta.eterna.buy.dao.MybatisBuyDao;
import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.cart.domain.Cart;

public class BuyDaoTest {
	
	String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
	SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(BuyDaoTest.class);

	BuyDao buyDao;
	
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
		buyDao = new MybatisBuyDao();
		((MybatisBuyDao)buyDao).setSqlSessionFactory(sqlSessionFactory);
	}

	
//	@Test
	public void testCreate() {
		Buy buy = new Buy("hee", "조희진", "01058837760", "인천시 부평구", "서지원", "01012341234", "서울시 강북구", "3", "후","공진향 수연 로션", "71.png",null, "0");
		try {
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

//	@Test
	public void testListAll() {
		try {
			List<Buy> list = buyDao.listAllByUser("hee");
			for (Buy buy : list) {
				logger.debug(buy);
				//System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testRecentAddess() {
		try {
			List<Buy> list = buyDao.recentAddress("hee");
			for (Buy buy : list) {
				logger.debug(buy);
				//System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testShowOrderDetailUser() {
		try {
			List<Buy> list = buyDao.showOrderDetailUser("2");
			for (Buy buy : list) {
				logger.debug(buy);
				//System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
