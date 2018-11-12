package kr.or.kosta.eterna.nonusercart.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.product.domain.Product;

/**
 * NonUserDao를 확장한 dao클래스
 * @author 권현우
 *
 */
public class MybatisNonUserCartDao implements NonUserCartDao {
	private static final String NAMESPACE = "kr.or.kosta.eterna.nonusercart.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
		
	}
	
	@Override
	public void update(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"update", cart);
		sqlSession.commit();
		sqlSession.close();
		
	}

	@Override
	public List<Cart> listAll(List<String> productValue) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Cart> cartList = new ArrayList<Cart>();
		for (String product : productValue) {
			String[] productDetails = product.split("#");
			Cart cart = sqlSession.selectOne(NAMESPACE+"listAll",productDetails[0]);
			cart.setCount(productDetails[1]);
			cartList.add(cart);
		}
		sqlSession.close();
		return cartList;
		}

	@Override
	public Cart read(String userId, String productId) throws Exception {
		Cart cart = null;
		SqlSession	sqlSession = sqlSessionFactory.openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("productId", productId);
		cart = sqlSession.selectOne(NAMESPACE+"read", map);
		sqlSession.close();
		return cart;
	}

	@Override
	public void delete(String userId, String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("productId", productId);
		sqlSession.update(NAMESPACE+"delete", map);
		sqlSession.commit();
		sqlSession.close();		
	}
	
	/*즉시 구매할시 cart 데이터 형식으로 데이터를 보내줌 (yonghyun) */
	@Override
	public Map<String, String> order(String productId) throws Exception{
		Map<String, String> orderProduct = new HashMap<>();
		SqlSession	sqlSession = sqlSessionFactory.openSession(true);
		orderProduct = sqlSession.selectOne(NAMESPACE+"order",Integer.parseInt(productId));
		return orderProduct;
	}
	
	@Override
	public void toBuycreate(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"toBuycreate", cart);
		sqlSession.commit();
		sqlSession.close();		
	}

	@Override
	public List<Cart> toBuylistAll(String userId) throws Exception {
		SqlSession  sqlSession = sqlSessionFactory.openSession(true);
		List<Cart> cartList = sqlSession.selectList(NAMESPACE+"toBuylistAll",userId);
		sqlSession.close();
		return cartList;
	}

	@Override
	public void toBuyDelete(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"toBuydelete", userId);
		sqlSession.commit();
		sqlSession.close();			
	}
}










