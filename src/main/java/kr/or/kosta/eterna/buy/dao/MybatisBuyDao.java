package kr.or.kosta.eterna.buy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.buy.domain.Buy;

/**
 * BuyDao 인터페이스에 선언된 기능 구현
 * @author 조희진
 *
 */
public class MybatisBuyDao implements BuyDao {
	private static final String NAMESPACE = "kr.or.kosta.eterna.buy.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
		
	}
	

	@Override
	public void createInfo(Buy buy) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"createInfo", buy);
		sqlSession.commit();
		sqlSession.close();		
	}

	@Override
	public void createManage(Buy buy) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"createManage", buy);
		sqlSession.commit();
		sqlSession.close();		
	}


	@Override
	public List<Buy> listAll(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE+"listAll",userId);
		sqlSession.close();
		return buyList;
		}

	@Override
	public List<Buy> recentAddress(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE+"recentAddress",userId);
		sqlSession.close();
		return buyList;
	}

}










