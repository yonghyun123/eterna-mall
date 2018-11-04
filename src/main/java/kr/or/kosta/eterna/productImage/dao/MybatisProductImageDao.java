package kr.or.kosta.eterna.productImage.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.kosta.eterna.common.web.Params;
import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.domain.ProductImage;
import kr.or.kosta.eterna.user.domain.User;

/**Mybatis를 적용한 productDAO
 * @author 권현우
 *
 */
public class MybatisProductImageDao implements ProductImageDao {
	/**dao 식별자*/
	private static final String NAMESPACE = "kr.or.kosta.eterna.productImage.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public void regist(ProductImage productImage) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"registImage",productImage);
	}

	@Override
	public void update(ProductImage productImage) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"updateImage", productImage);
	}

	@Override
	public void delete(Map<String, Object>map) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.delete(NAMESPACE+"deleteImage", map);
	}

	@Override
	public List<ProductImage> imageAll(String productId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ProductImage> imageList = sqlSession.selectList(NAMESPACE+"imageAll", Integer.parseInt(productId));
		return imageList;
	}
	
}










