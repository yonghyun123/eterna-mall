package kr.or.kosta.eterna.user.domain;

/**
 * 회원 domain
 * @author 조희진
 *
 */
public class User {
	
	private String userId;
	private String userName;
	private String userEmail;
	private String userPasswd;
	private String userAddress;
	private String userTel;
	private String tierId;
	private String userGrade;
	private String userPoint;
	private String userRegdate;
	
	public User() {
		super();
	}

	public User(String userId, String userName, String userEmail, String userPasswd, String userAddress, String userTel,
			String tierId, String userGrade, String userPoint, String userRegdate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPasswd = userPasswd;
		this.userAddress = userAddress;
		this.userTel = userTel;
		this.tierId = tierId;
		this.userGrade = userGrade;
		this.userPoint = userPoint;
		this.userRegdate = userRegdate;
	}
	
	public User(String userId, String userName, String userEmail, String userPasswd, String userAddress, String userTel) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPasswd = userPasswd;
		this.userAddress = userAddress;
		this.userTel = userTel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getTierId() {
		return tierId;
	}

	public void setTierId(String tierId) {
		this.tierId = tierId;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(String userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPasswd="
				+ userPasswd + ", userAddress=" + userAddress + ", userTel=" + userTel + ", tierId=" + tierId
				+ ", userGrade=" + userGrade + ", userPoint=" + userPoint + ", userRegdate=" + userRegdate + "]";
	}

	
}
