package kr.or.kosta.eterna.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.domain.UserRcmd;

/**
 * UserRcmdDao 인터페이스에 선언된 기능 구현
 * @author 권현우
 *
 */
public class MybatisUserRcmdDao implements UserRcmdDao {
   private static final String NAMESPACE = "kr.or.kosta.eterna.userRcmd.";
   SqlSessionFactory sqlSessionFactory;
     
   public SqlSessionFactory getSqlSessionFactory() {
      return sqlSessionFactory;
   }

   public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
      this.sqlSessionFactory = sqlSessionFactory;
      
   }

   @Override
   public void create(UserRcmd userrcmd) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      sqlSession.insert(NAMESPACE+"create", userrcmd);
   }

   @Override
   public UserRcmd read(String userId) throws Exception {
      UserRcmd userRcmd = null;
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      userRcmd = sqlSession.selectOne(NAMESPACE+"read", userId);
      return userRcmd;
   }

   @Override
   public void update(UserRcmd userrcmd) throws Exception {
      SqlSession   sqlSession = sqlSessionFactory.openSession(true);
      sqlSession.update(NAMESPACE+"update", userrcmd);
   }

   @Override
   public void delete(String userId) throws Exception {
      SqlSession   sqlSession = sqlSessionFactory.openSession(true);
      sqlSession.delete(NAMESPACE+"delete", userId);
   }

}









