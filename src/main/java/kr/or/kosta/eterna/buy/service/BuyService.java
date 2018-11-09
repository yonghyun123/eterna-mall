package kr.or.kosta.eterna.buy.service;

import java.util.List;

import kr.or.kosta.eterna.buy.domain.Buy;

/** Buy의 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 조희진
 *
 */
public interface BuyService {
   
   /* 구매시 구매내역에 추가 */
   public void create(Buy buy) throws Exception;
   
   /* 회원별 구매내역 조회 */
   public List<Buy> listAllByUser(String userId) throws Exception;
   
   /* 전체 구매내역 조회 */
   public List<Buy> listAll() throws Exception;
   
   /* 회원별 최근 3개의 배송지 조회 */
   public List<Buy> recentAddress(String userId) throws Exception;
   
   /* 월별 제품의 판매량*/
   public List<Buy> listPerMonth(String categoryId) throws Exception;
   
   /* 월별 제품 판매액*/
   public List<Buy> listAmount() throws Exception;
   
   /* 회원별 구매횟수 조회 */
	public List<Buy> numPurchase(String userId) throws Exception;
}