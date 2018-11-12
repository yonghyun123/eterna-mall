package kr.or.kosta.eterna.qna.service;

import java.util.List;

import kr.or.kosta.eterna.qna.domain.QnA;

/**
 * 고객의 요구사항을 반영한 도메인별(개발하고자 하는 업무영역)별 비즈니스 메소드 선언 복잡한 트랜잭션 처리나 예외처리 등
 * 
 * @author 권현우
 *
 */
public interface QnAService {

	/* Q&A 생성 */
	public void create(QnA qna) throws Exception;

	/* Q&A 답글 생성(관리자만) */
	public void createComment(QnA qna) throws Exception;

	/* Q&A 수정 */
	public void update(QnA qna, String id) throws Exception;

	/* 상품별 Q&A 전체 조회 */
	public List<QnA> listItem(String productId) throws Exception;

	/* 회원별 Q&A 전체 조회 */
	public List<QnA> myList(String userId) throws Exception;

	/* Q&A 전체 조회(관리자용) */
	public List<QnA> listAll() throws Exception;

	/* 답변완료된 글 갯수 */
	public int countAnswer(String userId) throws Exception;

	/* 답변 글 조회시 answer Flag 변경 */
	public void readQnA(String userId) throws Exception;

}
