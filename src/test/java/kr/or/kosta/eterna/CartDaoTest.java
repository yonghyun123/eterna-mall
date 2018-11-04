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

import kr.or.kosta.eterna.cart.dao.CartDao;
import kr.or.kosta.eterna.cart.dao.MybatisCartDao;
import kr.or.kosta.eterna.cart.domain.Cart;

public class CartDaoTest {
	
	String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
	SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(CartDaoTest.class);

	CartDao cartDao;
	
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
		cartDao = new MybatisCartDao();
		((MybatisCartDao)cartDao).setSqlSessionFactory(sqlSessionFactory);
	}

//	@Test
	public void testCreate() {
		Cart cart = new Cart("hee", "2", "14");
		try {
			cartDao.create(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
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

//		@Test
	public void testListAll() {
		try {
			List<Cart> list = cartDao.listAll("hee");
			for (Cart cart : list) {
				logger.debug(cart);
				//System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
