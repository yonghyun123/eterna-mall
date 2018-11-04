package kr.or.kosta.eterna.review.domain;

/**
 * 리뷰 domain
 * @author 조희진
 *
 */
public class Review {
	
	private String id;
	private String userId;
	private String productId;
	private String boardId;
	private String regdate;
	private String content;
	private String score;
	private String answerFlag;
	
	
	public Review() {
		super();
	}


	public Review(String userId, String productId, String boardId, String regdate, String content, String score,
			String answerFlag, String id) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.boardId = boardId;
		this.regdate = regdate;
		this.content = content;
		this.score = score;
		this.answerFlag = answerFlag;
		this.id = id;
	}

	public Review(String userId, String productId,String content, String score) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.content = content;
		this.score = score;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getBoardId() {
		return boardId;
	}


	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getScore() {
		return score;
	}


	public void setScore(String score) {
		this.score = score;
	}


	public String getAnswerFlag() {
		return answerFlag;
	}


	public void setAnswerFlag(String answerFlag) {
		this.answerFlag = answerFlag;
	}


	@Override
	public String toString() {
		return "Review [id=" + id + ", userId=" + userId + ", productId=" + productId + ", boardId=" + boardId
				+ ", regdate=" + regdate + ", content=" + content + ", score=" + score + ", answerFlag=" + answerFlag
				+ "]";
	}


	
	


}
