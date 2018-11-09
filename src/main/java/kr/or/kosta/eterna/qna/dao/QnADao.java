package kr.or.kosta.eterna.qna.dao;

import java.util.List;

import kr.or.kosta.eterna.qna.domain.QnA;


/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 조희진
 *
 */
public interface QnADao {
   
   /* Q&A 생성*/
   public void create(QnA qna) throws Exception;
   
   /* Q&A 답글 생성(관리자만) */
   public void createComment(QnA qna) throws Exception;
   
   /* Q&A 수정*/
   public void update(QnA qna, String id) throws Exception;
   
   /* 답변 등록시 Q&A answerFlag 수정*/
   public void updateFlag(String id) throws Exception;

   /* 상품별 Q&A 전체 조회 */
   public List<QnA> listItem(String productId) throws Exception;

   /* 회원별 Q&A 전체 조회 */
   public List<QnA> myList(String userId) throws Exception;

   /* Q&A 전체 조회(관리자용) */
   public List<QnA> listAll() throws Exception;

   /* 답변 대기중인 Q&A 수 */
   public int newQnA() throws Exception;

}