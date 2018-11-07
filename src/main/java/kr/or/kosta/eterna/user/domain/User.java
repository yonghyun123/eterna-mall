package kr.or.kosta.eterna.user.domain;

/**
 * 회원 domain
 * 
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
	private String couponName;
	private String couponStartDate;
	private String couponEndDate;
	private String couponId;
	private String couponRate;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String userName, String userEmail, String userPasswd, String userAddress, String userTel,
			String tierId, String userGrade, String userPoint, String userRegdate, String couponName,
			String couponStartDate, String couponEndDate, String couponId, String couponRate) {
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
		this.couponName = couponName;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
		this.couponId = couponId;
		this.couponRate = couponRate;
	}

	public User(String userId, String userName, String userEmail, String userPasswd, String userAddress,
			String userTel) {
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

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(String couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public String getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(String couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponRate() {
		return couponRate;
	}

	public void setCouponRate(String couponRate) {
		this.couponRate = couponRate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPasswd="
				+ userPasswd + ", userAddress=" + userAddress + ", userTel=" + userTel + ", tierId=" + tierId
				+ ", userGrade=" + userGrade + ", userPoint=" + userPoint + ", userRegdate=" + userRegdate
				+ ", couponName=" + couponName + ", couponStartDate=" + couponStartDate + ", couponEndDate="
				+ couponEndDate + ", couponId=" + couponId + ",couponRate=" + "]";
	}

}
