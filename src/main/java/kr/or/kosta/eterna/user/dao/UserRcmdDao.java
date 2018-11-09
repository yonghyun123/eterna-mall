package kr.or.kosta.eterna.user.dao;

import kr.or.kosta.eterna.user.domain.UserRcmd;

/**사용자 카테고리 추천 기능을 위한 인터페이스
 * @author 권현우
 **/
public interface UserRcmdDao {
   /**회원 생성시 함께 생성되는 추천 테이블*/
   public void create(UserRcmd userrcmd) throws Exception;
   /**userId 를 이용한 추천 테이블 조회*/
   public UserRcmd read(String userId) throws Exception;
   /**카테고리 업데이트*/
   public void update(UserRcmd userrcmd) throws Exception;
   /**추천 테이블 삭제*/
   public void delete(String userId) throws Exception;
}