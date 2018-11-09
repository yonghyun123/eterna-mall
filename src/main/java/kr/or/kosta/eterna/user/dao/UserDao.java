package kr.or.kosta.eterna.user.dao;

import java.util.List;

import kr.or.kosta.eterna.user.domain.User;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * 
 * @author 조희진
 *
 */
public interface UserDao {

	/* 회원 가입시 회원 생성 */
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

	/* id를 이용한 쿠폰 조회 */
	public List<User> listCoupon(String userId) throws Exception;

	/* id를 이용한 쿠폰 개수 조회*/
	public int couponLength(String userId) throws Exception;
	
	/* id를 이용한 누적 구매액 조회 */
	public int priceAmount(String userId) throws Exception;
	
	/* id를 이용한 상위 등급 금액 조회 */
	public int searchUpTier(String userId) throws Exception;
	
	/* 오늘 가입한 회원 수 */
	public int newUser() throws Exception;
}
