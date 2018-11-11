package kr.or.kosta.eterna.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.product.domain.Product;

/**
 * Mybatis를 적용한 productDAO
 * 
 * @author 권현우
 *
 */
public class MybatisProductDao implements ProductDao {
	/** dao 식별자 */
	private static final String NAMESPACE = "kr.or.kosta.eterna.product.";
	SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	/** 제품등록 */
	@Override
	public void regist(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE + "regist", product);
		sqlSession.close();
	}

	/** 제품검색 */
	@Override
	public Product read(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Product product = sqlSession.selectOne(NAMESPACE + "read", Integer.parseInt(productId));
		return product;
	}

	/** 제품 수정 */
	@Override
	public void update(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE + "update", product);

	}

	/** 제품삭제 */
	@Override
	public void delete(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.delete(NAMESPACE + "delete", Integer.parseInt(productId));
	}

	/** 전체제품 조회 */
	@Override
	public List<Product> listAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product> productList = sqlSession.selectList(NAMESPACE + "listAll");
		sqlSession.close();
		return productList;
	}

	/** 제품 중복검사 (동일한 제품 존재하면 true 값 리턴) */
	@Override
	public boolean duplicateCheck(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Product product = sqlSession.selectOne(NAMESPACE + "duplicateCheck", Integer.parseInt(productId));
		return (product != null);
	}

	/* 사용성별 별 제품의 개수 */
	@Override
	public int countPerSex(String sex) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "countPerSex", sex);
		return count;
	}

	/* 사용연령대 별 제품의 개수 */
	@Override
	public int countPerAge(String age) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "countPerAge", age);
		return count;
	}

	@Override
	public List<Product> listBySex(String ProductSex) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product> productList = sqlSession.selectList(NAMESPACE + "listBySex", ProductSex);
		sqlSession.close();
		return productList;
	}

	@Override
	public int countAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "countAll");
		return count;
	}

	@Override
	public List<Product> listByConditions(Map<String, Object> map) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product> productList = sqlSession.selectList(NAMESPACE + "listByConditions", map);
		sqlSession.close();
		return productList;
	}

	@Override
	public int countByConditions(Map<String, Object> map) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "countByConditions", map);
		return count;
	}

	@Override
	public int outOfStock() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne(NAMESPACE + "outOfStock");
		sqlSession.close();
		return count;
	}
	@Override
	public List<Product> brandNewList(String categoryId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product> productList = sqlSession.selectList(NAMESPACE+"brandNewList", categoryId);
		return productList;
	}
	@Override
	public List<Product> popularProductList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Product> productList = sqlSession.selectList(NAMESPACE+"hotItemList");
		return productList;
	}
}
