package kr.or.kosta.eterna.price.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.price.domain.Price;

/**Mybatis를 적용한 FileInfoDAO
 * @author 권현우
 *
 */
public class MybatisPriceDao implements PriceDao {
	/**dao 식별자*/
	private static final String NAMESPACE = "kr.or.kosta.eterna.price.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;	
	}

	@Override
	public void registProductPrice(Price price) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"registProductPrice",price);
	}

	@Override
	public void updateProductPrice(Price price) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"updateProductPrice", price);
	}

	@Override
	public void deleteProductPrice(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	
		sqlSession.delete(NAMESPACE+"deleteProductPrice", Integer.parseInt(productId));
	}

	@Override
	public List<Price> priceListAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Price> fileList = sqlSession.selectList(NAMESPACE+"priceListAll");
		return fileList;
	}

	@Override
	public Price readProductPrice(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Price price = sqlSession.selectOne(NAMESPACE+"readProductPrice",Integer.parseInt(productId));
		return price;
	}
}










