package kr.or.kosta.eterna.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.product.domain.Product;

/**
 * Mybatis를 적용한 couponDAO
 * 
 * @author 이철우
 *
 */
public class MybatisCouponDao implements CouponDao {
	/** dao 식별자 */
	private static final String NAMESPACE = "kr.or.kosta.eterna.coupon.";
	SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Coupon> userCouponList(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Coupon> list = sqlSession.selectList(NAMESPACE + "userCouponList", userId);
		sqlSession.close();
		return list;
	}
	
	@Override
	public int couponLength(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int length = sqlSession.selectOne(NAMESPACE+"couponLength", userId);
		sqlSession.close();
		return length;
	}
	
}
