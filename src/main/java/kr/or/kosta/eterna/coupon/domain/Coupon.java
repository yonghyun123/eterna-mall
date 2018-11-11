package kr.or.kosta.eterna.coupon.domain;

public class Coupon {
	private String couponId;
	private String couponName;
	private String couponRate;
	private String useFlag;
	private String startDate;
	private String endDate;

	public Coupon() {
		super();
	}

	public Coupon(String couponId, String couponName, String couponRate, String useFlag, String startDate,
			      String endDate) {
		super();
		this.couponId = couponId;
		this.couponName = couponName;
		this.couponRate = couponRate;
		this.useFlag = useFlag;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponRate() {
		return couponRate;
	}

	public void setCouponRate(String couponRate) {
		this.couponRate = couponRate;
	}

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Coupon [couponId=" + couponId + ", couponName=" + couponName + ", couponRate=" + couponRate
				+ ", useFlag=" + useFlag + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
}