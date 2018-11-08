package kr.or.kosta.eterna.review.service;

import java.util.List;

import kr.or.kosta.eterna.review.domain.Review;

/** Review의 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 조희진
 *
 */
public interface ReviewService {
	
	/* 리뷰 생성*/
	public void create(Review review) throws Exception;

	/* 상품별 리뷰 전체 조회 */
	public List<Review> listItem(String productId) throws Exception;

	/* 회원별 리뷰 전체 조회 */
	public List<Review> myReviewList(String userId) throws Exception;

	/*상품 구입한 회원리뷰체크 */
	boolean checkReview(String userId, String productId) throws Exception;
	
	/* 리뷰 전체 조회(관리자용) */
	public List<Review> listAll() throws Exception;
	
	
}
