package kr.or.kosta.eterna.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.qna.domain.QnA;

/**
 * 관리자 Service 복잡한 트랜잭션 처리나 예외처리 등
 * 
 * @author 권현우
 *
 */
public interface AdminService {
	/* 주문정보 상세 보기 */
	public List<Buy> showOrderListDetails(String id) throws Exception;

	/* 회원정보 상세 보기 */
	public Map<String, Object> showUserListDetails(String userId) throws Exception;

	/* 재품정보 상세 보기 */
	public Map<String, Object> showStockListDetails(String productId) throws Exception;

	/** 신제품 등록 */
	public void registProduct(Map<String, Object> map) throws Exception;

	/* 배송 상태 업데이트 */
	public void updateStatus(String id, String orderFlag) throws Exception;

	/* 오늘의 새로운 주문 */
	public int newOrder() throws Exception;

	/* 재고부족 상품 개수 */
	public int outOfStock() throws Exception;

	/* 오늘 가입한 회원 수 */
	public int newUser() throws Exception;

	/* 답변 대기중인 Q&A 수 */
	public int newQnA() throws Exception;

	/* 답변 대기중인 review */
	public int newReview() throws Exception;
	
	/* 등급 판단 후 등급 업데이트 */
	public void updateTier(String userId) throws Exception;
	
	/* 제품 배송중으로 변경시 재고 변경 */
	public void updateStock(String productDescription, String count) throws Exception;
	   
	   /* Q&A 답글 생성(관리자만) */
		public void createComment(QnA qna) throws Exception;
}
