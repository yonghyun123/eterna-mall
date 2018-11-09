package kr.or.kosta.eterna.review.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.review.domain.Review;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * 
 * @author 조희진
 *
 */
public interface ReviewDao {

	/* 리뷰 생성 */
	public void create(Review review) throws Exception;

	/* 리뷰 답글 생성 */
	public void createComment(Review review) throws Exception;

	/* 답변 등록시 Review answerFlag 수정 */
	public void updateFlag(String id) throws Exception;

	/* 상품별 리뷰 전체 조회 */
	public List<Review> listItem(String productId) throws Exception;

	/* 회원별 리뷰 전체 조회 */
	public List<Review> myReviewList(String userId) throws Exception;

	/* 리뷰 전체 조회(관리자용) */
	public List<Review> listAll() throws Exception;

	/* 답변 대기중인 review */
	public int newReview() throws Exception;

	/* 제품을 구매한 회원만 리뷰등록 */
	public Map<String, String> reviewCheck(String userId, String productId) throws Exception;

}
