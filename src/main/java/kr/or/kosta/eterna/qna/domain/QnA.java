package kr.or.kosta.eterna.qna.domain;

/**
 * Q&A domain
 * @author 조희진
 *
 */
public class QnA {
	
	private String id;
	private String userId;
	private String productId;
	private String boardId;
	private String subject;
	private String content;
	private String regdate;
	private String answerFlag;
	private String secretFlag;
	private String groupNo;
	private String levelNo;

	public QnA() {
		super();
	}

	public QnA(String id, String userId, String productId, String boardId, String subject, String content,
			String regdate, String answerFlag, String groupNo, String levelNo) {
		super();
		this.id = id;
		this.userId = userId;
		this.productId = productId;
		this.boardId = boardId;
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.answerFlag = answerFlag;
		this.groupNo = groupNo;
		this.levelNo = levelNo;
	}

	public QnA(String userId, String productId,String subject, String content) {
		this.userId = userId;
		this.productId = productId;
		this.subject = subject;
		this.content = content;
	}

	
	public String getSecretFlag() {
		return secretFlag;
	}

	public void setSecretFlag(String secretFlag) {
		this.secretFlag = secretFlag;
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


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getAnswerFlag() {
		return answerFlag;
	}


	public void setAnswerFlag(String answerFlag) {
		this.answerFlag = answerFlag;
	}


	public String getGroupNo() {
		return groupNo;
	}


	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}


	public String getLevelNo() {
		return levelNo;
	}


	public void setLevelNo(String levelNo) {
		this.levelNo = levelNo;
	}

	@Override
	public String toString() {
		return "QnA [id=" + id + ", userId=" + userId + ", productId=" + productId + ", boardId=" + boardId
				+ ", subject=" + subject + ", content=" + content + ", regdate=" + regdate + ", answerFlag="
				+ answerFlag + ", secretFlag=" + secretFlag + ", groupNo=" + groupNo + ", levelNo=" + levelNo + "]";
	}
}
