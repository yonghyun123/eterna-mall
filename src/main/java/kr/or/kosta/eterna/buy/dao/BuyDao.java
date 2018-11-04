package kr.or.kosta.eterna.buy.dao;

import java.util.List;

import kr.or.kosta.eterna.buy.domain.Buy;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 조희진
 *
 */
public interface BuyDao {
	
	/* 구매시 구매내역에 추가 */
	public void createInfo(Buy buy) throws Exception;
	
	/* 주문번호별 물품, 수량 추가 */
	public void createManage(Buy buy) throws Exception;
	
	/* 회원별 구매내역 조회 */
	public List<Buy> listAll(String userId) throws Exception;
	
	/* 회원별 최근 3개의 배송지 조회 */
	public List<Buy> recentAddress(String userId) throws Exception;
	
}
