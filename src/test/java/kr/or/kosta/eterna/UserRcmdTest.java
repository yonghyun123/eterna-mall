package kr.or.kosta.eterna;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;

import kr.or.kosta.eterna.user.dao.MybatisUserDao;
import kr.or.kosta.eterna.user.dao.MybatisUserRcmdDao;
import kr.or.kosta.eterna.user.dao.UserDao;
import kr.or.kosta.eterna.user.dao.UserRcmdDao;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.domain.UserRcmd;

public class UserRcmdTest {

	private static final String NAMESPACE = "kr.or.kosta.eterna.userRcmd.";
	
	String resource = "mybatis-config.xml"; // resource 밑에 바로 있으니까~ resource 기준임
	SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(UserRcmdTest.class);

	UserRcmdDao userRcmdDao;
	
	@Before
	public void setup() {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development");
		logger.debug("sqlSessionFactory 생성 완료!");
		userRcmdDao = new MybatisUserRcmdDao();
		((MybatisUserRcmdDao)userRcmdDao).setSqlSessionFactory(sqlSessionFactory);
	}

	@Test
	public void testUpdate() {
		UserRcmd userRcmd = new UserRcmd();
		userRcmd.setUserId("chul");
		userRcmd.setSunCount("100");
		try {
			userRcmdDao.update(userRcmd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testRead() throws Exception {
		UserRcmd userRcmd = userRcmdDao.read("chul");
		try {
			logger.debug(userRcmd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
