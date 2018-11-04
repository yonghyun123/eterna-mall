package kr.or.kosta.eterna.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.review.domain.Review;

/**
 * ReviewDao 인터페이스에 선언된 기능 구현
 * @author 조희진
 *
 */
public class MybatisReviewDao implements ReviewDao {
	private static final String NAMESPACE = "kr.or.kosta.eterna.review.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
		
	}
	
	@Override
	public void create(Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"create", review);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public List<Review> listItem(String productId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Review> reviewList = sqlSession.selectList(NAMESPACE+"listItem", productId);
		sqlSession.close();
		return reviewList;
	}
	
	@Override
	public List<Review> myReviewList(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Review> reviewList = sqlSession.selectList(NAMESPACE+"myReviewList", userId);
		sqlSession.close();
		return reviewList;
	}
	
	@Override
	public List<Review> listAll() throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Review> reviewList = sqlSession.selectList(NAMESPACE+"listAll");
		sqlSession.close();
		return reviewList;
	}

}










