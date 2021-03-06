package kr.or.kosta.eterna.buy.dao;

import java.util.List;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.cart.domain.Cart;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * 
 * @author 조희진
 *
 */
public interface BuyDao {

	/* 구매시 구매내역에 추가 */
	public void createInfo(Buy buy) throws Exception;

	/* 주문번호별 물품, 수량 추가 */
	public void createManage(Buy buy) throws Exception;
	
	/* cart담긴 물품, 수량 추가(yonghyun) */
	public void createManage(Cart cart) throws Exception;
	
	/* 회원별 구매내역 조회 */
	public List<Buy> listAllByUser(String userId) throws Exception;

	/* 전채 구매내역 조회 */
	public List<Buy> listAll() throws Exception;

	/* 회원별 최근 3개의 배송지 조회 */
	public List<Buy> recentAddress(String userId) throws Exception;

	/* 회원별 구매횟수(orderNumber) 조회 */
	public List<Buy> numPurchase(String userId) throws Exception;
	
	/* 월별 제품의 판매량 */
	public List<Buy> listPerMonth(String categoryId) throws Exception;

	/* 월별 제품 판매액 */
	public List<Buy> listAmount() throws Exception;

	/** 구매 상세 조회 */
	public List<Buy> showOrderDetail(String id) throws Exception;

	/* 배송 상태 업데이트 */
	public void updateStatus(String id, String orderFlag) throws Exception;

	/* 오늘의 새로운 주문 */
	public int newOrder() throws Exception;
	
	/* 주문번호별 상세보기 */
	public List<Buy> showOrderDetailUser(String id) throws Exception;
	/* 비회원 단일상품 구매 */
	public void nonCreateInfo(Buy buy) throws Exception;
	/* 최근 주문목록 조회 */
	public String recentOrderNumber() throws Exception;
	/* 비회원 주문번호 비밀번호 조회 */
	public Buy nonUserCertify(String id, String passwd) throws Exception;

}