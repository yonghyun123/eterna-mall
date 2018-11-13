package kr.or.kosta.eterna.buy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.cart.domain.Cart;

/**
 * BuyDao 인터페이스에 선언된 기능 구현
 * 
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
		sqlSession.insert(NAMESPACE + "createInfo", buy);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public void nonCreateInfo(Buy buy) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE + "noncreateInfo", buy);
		sqlSession.commit();
		sqlSession.close();
	}
	@Override
	public void createManage(Buy buy) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE + "createManage", buy);
		sqlSession.commit();
		sqlSession.close();
	}
	
	@Override
	public void createManage(Cart cart) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE + "createManage", cart);
		sqlSession.commit();
		sqlSession.close();
	}
	

	@Override
	public List<Buy> listAllByUser(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "listClient", userId);
		sqlSession.close();
		return buyList;
	}

	@Override
	public List<Buy> listAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "listAll");
		sqlSession.close();
		return buyList;
	}

	@Override
	public List<Buy> recentAddress(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "recentAddress", userId);
		sqlSession.close();
		return buyList;
	}
	
	@Override
	public List<Buy> numPurchase(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> numPurchase = sqlSession.selectList(NAMESPACE+"orderProductsLength",userId);
		sqlSession.close();
		return numPurchase;
	}

	@Override
	public List<Buy> listPerMonth(String categoryId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "salesperMonth", categoryId);
		sqlSession.close();
		return buyList;
	}

	@Override
	public List<Buy> listAmount() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "totalAmount");
		sqlSession.close();
		return buyList;
	}

	@Override
	public List<Buy> showOrderDetail(String id) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> buyList = sqlSession.selectList(NAMESPACE + "showOrderDetail", id);
		sqlSession.close();
		return buyList;
	}

	@Override
	public void updateStatus(String id, String orderFlag) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("orderFlag", orderFlag);
		sqlSession.insert(NAMESPACE + "updateStatus", map);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public int newOrder() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "newOrder");
		sqlSession.close();
		return count;
	}

	@Override
	public List<Buy> showOrderDetailUser(String id) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Buy> list = sqlSession.selectList(NAMESPACE + "showOrderDetailUser", id);
		sqlSession.close();
		return list;
	}
	
	@Override
	/* 최근 주문목록 조회 */
	public String recentOrderNumber() throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String orderNumber = sqlSession.selectOne(NAMESPACE + "recentOrderNumber");
		sqlSession.close();
		return orderNumber;
	}

}
