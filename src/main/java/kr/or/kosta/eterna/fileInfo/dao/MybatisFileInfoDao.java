package kr.or.kosta.eterna.fileInfo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.fileInfo.domain.FileInfo;

/**Mybatis를 적용한 productDAO
 * @author 권현우
 *
 */
public class MybatisFileInfoDao implements FileInfoDao {
	/**dao 식별자*/
	private static final String NAMESPACE = "kr.or.kosta.eterna.fileInfo.";
	SqlSessionFactory sqlSessionFactory;
	  
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;	
	}

	@Override
	public void regist(FileInfo fileInfo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert(NAMESPACE+"registFile",fileInfo);
	}

	@Override
	public void update(FileInfo fileInfo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(NAMESPACE+"updateFile", fileInfo);
	}

	@Override
	public void delete(String file_id) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	
		sqlSession.delete(NAMESPACE+"deleteFile", file_id);

	}

	@Override
	public List<FileInfo> fileListAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<FileInfo> fileList = sqlSession.selectList(NAMESPACE+"fileListAll");
		return fileList;
	}
}










