package kr.or.kosta.eterna.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.category.domain.Category;
import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.price.domain.Price;

/**Mybatis를 적용한 FileInfoDAO
 * @author 권현우
 *
 */
public class MybatisCategoryDao implements CategoryDao {
	/**dao 식별자*/
	private static final String NAMESPACE = "kr.or.kosta.eterna.category.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;	
	}

	@Override
	public void registCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"registCategory",category);
	}

	@Override
	public void updateCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"updateCategory", category);
	}

	@Override
	public void deleteCategory(String categoryId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	
		sqlSession.delete(NAMESPACE+"deleteCategory", Integer.parseInt(categoryId));
	}

	@Override
	public List<Category> categoryListAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Category> fileList = sqlSession.selectList(NAMESPACE+"categoryListAll");
		return fileList;
	}

}










