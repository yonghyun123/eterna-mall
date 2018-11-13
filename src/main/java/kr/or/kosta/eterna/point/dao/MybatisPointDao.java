package kr.or.kosta.eterna.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.point.domain.Point;
import kr.or.kosta.eterna.product.domain.Product;

/**
 * Mybatis를 적용한 couponDAO
 * 
 * @author 이철우
 *
 */
public class MybatisPointDao implements PointDao {
	/** dao 식별자 */
	private static final String NAMESPACE = "kr.or.kosta.eterna.point.";
	SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Point> userPointList(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Point> list = sqlSession.selectList(NAMESPACE + "userPointList", userId);
		return list;
	}
	
}
