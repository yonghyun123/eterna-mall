package kr.or.kosta.eterna.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.qna.domain.QnA;

/**
 * ReviewDao 인터페이스에 선언된 기능 구현
 * @author 조희진
 *
 */
public class MybatisQnADao implements QnADao {
	private static final String NAMESPACE = "kr.or.kosta.eterna.qna.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
		
	}
	
	@Override
	public void create(QnA qna) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"create", qna);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public List<QnA> listItem(String productId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<QnA> qnaList = sqlSession.selectList(NAMESPACE+"listItem", productId);
		sqlSession.close();
		return qnaList;
	}
	
	@Override
	public List<QnA> myList(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<QnA> qnaList = sqlSession.selectList(NAMESPACE+"myList", userId);
		sqlSession.close();
		return qnaList;
	}
	
	@Override
	public List<QnA> listAll() throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<QnA> qnaList = sqlSession.selectList(NAMESPACE+"listAll");
		sqlSession.close();
		return qnaList;
	}

	@Override
	public void createComment(QnA qna) throws Exception {
		
	}

	@Override
	public void update(QnA qna, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		String subject = qna.getSubject();
		String content = qna.getContent();
		map.put("subject", subject);
		map.put("content", content);
		map.put("id", id);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"update", map);
		sqlSession.commit();
		sqlSession.close();
	}

}










