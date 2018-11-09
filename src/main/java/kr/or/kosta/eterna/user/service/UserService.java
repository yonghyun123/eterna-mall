package kr.or.kosta.eterna.user.service;

import java.util.List;

import kr.or.kosta.eterna.user.domain.User;

/**고객의 요구사항을 반영한 도메인별(개발하고자 하는 업무영역)별 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 권현우
 *
 */
public interface UserService {
	
	/* 회원 가입시 회원 생성*/
	public void create(User user) throws Exception;
	
	/* id를 이용한 회원 조회 */
	public User read(String id) throws Exception;

	/* 회원 정보 수정 */
	public void update(User user) throws Exception;

	/* 회원 정보 삭제 */
	public void delete(String userId, String userPasswd) throws Exception;
	
	/* 회원 리스트 전체 조회 */
	public List<User> listAll() throws Exception;
	
	/* 로그인 시 id와 비밀번호를 통한 회원 조회 */
	public User certify(String userId, String userPasswd) throws Exception;
	
	/* id를 이용한 쿠폰 조회*/
	public List<User> listCoupon(String userId) throws Exception;
	
	/* id를 이용한 쿠폰 개수 조회*/
	public int couponLength(String userId) throws Exception;
	
	/* id를 이용한 누적 구매액 조회 */
	public int priceAmount(String userId) throws Exception;
	
	/* id를 이용한 상위 등급 금액 조회 */
	public int searchUpTier(String userId) throws Exception;
}
