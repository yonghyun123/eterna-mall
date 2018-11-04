package kr.or.kosta.eterna.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.product.domain.Product;

/**Mybatis를 적용한 productDAO
 * @author 권현우
 *
 */
public class MybatisProductDao implements ProductDao {
	/**dao 식별자*/
	private static final String NAMESPACE = "kr.or.kosta.eterna.product.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	

	/**제품등록*/
	@Override
	public void regist(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	
		sqlSession.insert(NAMESPACE+"regist", product);
		sqlSession.close();
	}
	/**제품검색*/
	@Override
	public Product read(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Product product =  sqlSession.selectOne(NAMESPACE+"read", Integer.parseInt(productId));
		return product;
	}
	/**제품 수정*/
	@Override
	public void update(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"update", product);
		
	}
	/**제품삭제*/
	@Override
	public void delete(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.delete(NAMESPACE+"delete",Integer.parseInt(productId));
	}

	/**전체제품 조회*/
	@Override
	public List<Product> listAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product>productList = sqlSession.selectList(NAMESPACE+"listAll");
		sqlSession.close();
		return productList;
	}
	
	/**제품 중복검사 (동일한 제품 존재하면 true 값 리턴)*/
	@Override
	public boolean duplicateCheck(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Product product = sqlSession.selectOne(NAMESPACE+"duplicateCheck",Integer.parseInt(productId));
		return (product != null);
	}
}










