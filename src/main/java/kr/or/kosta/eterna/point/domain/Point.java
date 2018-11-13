package kr.or.kosta.eterna.point.domain;

public class Point {
	
	private String id;
	private String userId;
	private String status;
	private String point;
	private String regdate;
	
	public Point(){
		
	}
	
	public Point(String id, String userId, String status, String point, String regdate) {
		super();
		this.id = id;
		this.userId = userId;
		this.status = status;
		this.point = point;
		this.regdate = regdate;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



}
