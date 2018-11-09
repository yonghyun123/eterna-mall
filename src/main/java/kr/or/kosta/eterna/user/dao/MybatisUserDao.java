package kr.or.kosta.eterna.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.user.domain.User;

/**
 * UserDao 인터페이스에 선언된 기능 구현
 * 
 * @author 조희진
 *
 */
public class MybatisUserDao implements UserDao {
	private static final String NAMESPACE = "kr.or.kosta.eterna.user.";
	SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;

	}

	@Override
	public void create(User user) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE + "create", user);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public User read(String userId) throws Exception {
		User user = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		user = sqlSession.selectOne(NAMESPACE + "read", userId);
		sqlSession.close();
		return user;
	}

	@Override
	public void update(User user) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE + "update", user);
		sqlSession.commit();
		sqlSession.close();

	}

	@Override
	public List<User> listAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<User> userList = sqlSession.selectList(NAMESPACE + "listAll");
		sqlSession.close();
		return userList;
	}

	@Override
	public User certify(String userId, String userPasswd) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPasswd", userPasswd);
		User user = sqlSession.selectOne(NAMESPACE + "certify", map);
		sqlSession.close();
		return user;
	}

	@Override
	public void delete(String userId, String userPasswd) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPasswd", userPasswd);
		sqlSession.update(NAMESPACE + "delete", map);
		sqlSession.commit();
		sqlSession.close();

	}

	@Override
	public List<User> listCoupon(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<User> listCoupon = sqlSession.selectList(NAMESPACE + "coupon", userId);
		sqlSession.close();
		return listCoupon;
	}

	@Override
	public int newUser() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "newUser");
		sqlSession.close();
		return count;
	}
}
