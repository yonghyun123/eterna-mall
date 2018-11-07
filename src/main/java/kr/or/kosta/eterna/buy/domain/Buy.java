package kr.or.kosta.eterna.buy.domain;

/**
 * 구매 domain
 * @author 조희진
 *
 */
public class Buy {
	
	private String userId;
	private String buyerName;
	private String buyerTel;
	private String buyerAddress;
	private String receiverName;
	private String receiverTel;
	private String receiverAddress;
	private String recentAddressName;
	private String count;
	private String productBrand;
	private String productDescription;
	private String fileName;
	private String passwd; // 비회원 주문시 필요
	private String orderFlag;
	
	
	public Buy() {
		super();
	}


	public Buy(String userId, String buyerName, String buyerTel, String buyerAddress, String receiverName,
			String receiverTel, String receiverAddress, String count, String productBrand, String productDescription,
			String fileName, String passwd, String orderFlag ,String recentAddressName) {
		super();
		this.userId = userId;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.buyerAddress = buyerAddress;
		this.receiverName = receiverName;
		this.receiverTel = receiverTel;
		this.receiverAddress = receiverAddress;
		this.count = count;
		this.productBrand = productBrand;
		this.productDescription = productDescription;
		this.fileName = fileName;
		this.passwd = passwd;
		this.orderFlag = orderFlag;
		this.recentAddressName = recentAddressName;
	}
	
	public Buy(String userId, String buyerName, String buyerTel, String buyerAddress, String receiverName,
			String receiverTel, String receiverAddress, String count, String productBrand, String productDescription,
			String fileName, String passwd) {
		super();
		this.userId = userId;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.buyerAddress = buyerAddress;
		this.receiverName = receiverName;
		this.receiverTel = receiverTel;
		this.receiverAddress = receiverAddress;
		this.count = count;
		this.productBrand = productBrand;
		this.productDescription = productDescription;
		this.fileName = fileName;
		this.passwd = passwd;
	}


	public String receiverTel() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
	

	public String getUserId() {
		return userId;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getBuyerName() {
		return buyerName;
	}


	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}


	public String getBuyerTel() {
		return buyerTel;
	}


	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}


	public String getBuyerAddress() {
		return buyerAddress;
	}


	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}


	public String getReceiverName() {
		return receiverName;
	}


	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}


	public String getReceiverTel() {
		return receiverTel;
	}


	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}


	public String getReceiverAddress() {
		return receiverAddress;
	}


	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}


	public String getCount() {
		return count;
	}


	public void setCount(String count) {
		this.count = count;
	}


	public String getProductBrand() {
		return productBrand;
	}


	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}


	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getOrderFlag() {
		return orderFlag;
	}


	public void setOrderFlag(String orderFlag) {
		this.orderFlag = orderFlag;
	}
	
	public String getRecentAddressName() {
		return recentAddressName;
	}


	public void setRecentAddressName(String recentAddressName) {
		this.recentAddressName = recentAddressName;
	}

	@Override
	public String toString() {
		return "Buy [userId=" + userId + ", buyerName=" + buyerName + ", buyerTel=" + buyerTel + ", buyerAddress="
				+ buyerAddress + ", receiverName=" + receiverName + ", receiverTel=" + receiverTel
				+ ", receiverAddress=" + receiverAddress + ", count=" + count + ", productBrand=" + productBrand
				+ ", productDescription=" + productDescription + ", fileName=" + fileName + ", passwd=" + passwd
				+ ", orderFlag=" + orderFlag + ",recentAddressName="+recentAddressName+ "]";
	}


	


}
