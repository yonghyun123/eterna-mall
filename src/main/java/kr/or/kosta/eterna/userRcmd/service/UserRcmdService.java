package kr.or.kosta.eterna.userRcmd.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.point.domain.Point;
import kr.or.kosta.eterna.user.domain.User;
import kr.or.kosta.eterna.user.domain.UserRcmd;

/**고객의 요구사항을 반영한 도메인별(개발하고자 하는 업무영역)별 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 권현우
 *
 */
public interface UserRcmdService {
	
	   /**회원 생성시 함께 생성되는 추천 테이블*/
	   public void create(UserRcmd userrcmd) throws Exception;
	   /**userId 를 이용한 추천 테이블 조회*/
	   public UserRcmd read(String userId) throws Exception;
	   /**카테고리 업데이트*/
	   public void update(UserRcmd userrcmd) throws Exception;
	   /**추천 테이블 삭제*/
	   public void delete(String userId) throws Exception;
}