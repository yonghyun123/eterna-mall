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

import kr.or.kosta.eterna.coupon.dao.CouponDao;
import kr.or.kosta.eterna.coupon.dao.MybatisCouponDao;
import kr.or.kosta.eterna.coupon.domain.Coupon;

public class CouponDaoTest {
	
	String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
	SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(CouponDaoTest.class);

	CouponDao couponDao;
	
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
		couponDao = new MybatisCouponDao();
		((MybatisCouponDao)couponDao).setSqlSessionFactory(sqlSessionFactory);
	}

	
//	@Test
	public void testUserCouponList() {
		try {
			List<Coupon> list = couponDao.userCouponList("hee");
			System.out.println(list);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

//	@Test
	public void testUserCouponLength() {
		try {
			int length = couponDao.couponLength("chul");
			System.out.println(length);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
