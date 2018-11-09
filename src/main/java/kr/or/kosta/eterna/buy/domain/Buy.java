package kr.or.kosta.eterna.buy.domain;

/**
 * 구매 domain
 * 
 * @author 조희진
 *
 */
public class Buy {
	private String id;
	private String manageId;
	private String orderDate;
	private String orderNumber;
	private String orderNumPrice;
	private String userId;
	private String buyerName;
	private String buyerTel;
	private String buyerAddress;
	private String recentAddressName;
	private String receiveDate;
	private String receiverName;
	private String receiverTel;
	private String receiverAddress;
	private String count;
	private String productBrand;
	private String productDescription;
	private String productPrice;
	private String createDate;
	private String categoryId;
	private String fileName;
	private String passwd; // 비회원 주문시 필요
	private String orderFlag;
	private String paymentKind;
	private String numPurchase;
	private int amount;

	public Buy() {
		super();
	}
	
	public Buy(String orderDate, String orderNumber, String productBrand, String productDescription, String productPrice, String count,
			   String orderFlag, String receiveDate, String receiverName, String receiverAddress, String receiverTel, String orderNumPrice, String paymentKind) {
		super();
		this.orderDate = orderDate;
		this.orderNumber = orderNumber;
		this.productBrand = productBrand;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.count = count;
		this.orderFlag = orderFlag;
		this.receiveDate = receiveDate;
		this.receiverName = receiverName;
		this.receiverAddress = receiverAddress;
		this.receiverTel = receiverTel;
		this.orderNumPrice = orderNumPrice;
		this.paymentKind = null;
	}
			
	public Buy(String id, String userId, String buyerName, String buyerTel, String buyerAddress, String receiverName,
			String receiverTel, String receiverAddress, String count, String productBrand, String productDescription,
			String fileName, String passwd, String orderFlag, String categoryId, String createDate, int amount) {
		super();
		this.id = id;
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
		this.createDate = createDate;
		this.categoryId = categoryId;
		this.amount = amount;
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

	public String getNumPurchase() {
		return numPurchase;
	}

	public void setNumPurchase(String numPurchase) {
		this.numPurchase = numPurchase;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderNumPrice() {
		return orderNumPrice;
	}

	public void setOrderNumPrice(String orderNumPrice) {
		this.orderNumPrice = orderNumPrice;
	}

	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getPaymentKind() {
		return paymentKind;
	}

	public void setPaymentKind(String paymentKind) {
		this.paymentKind = paymentKind;
	}
	
	public String getManageId() {
		return manageId;
	}

	public void setManageId(String manageId) {
		this.manageId = manageId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String receiverTel() {
		return userId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	@Override
	public String toString() {
		return "Buy [orderDate=" + orderDate + ", orderNumber=" + orderNumber + ", orderNumPrice=" + orderNumPrice
				+ ", orderFlag=" + orderFlag + ", userId=" + userId + ", buyerName=" + buyerName + ", buyerTel="
				+ buyerTel + ", buyerAddress=" + buyerAddress + ", receiverName=" + receiverName + ", receiverTel="
				+ receiverTel + ", receiverAddress=" + receiverAddress + ", receiveDate=" + receiveDate
				+ ", recentAddressName=" + recentAddressName + ", count=" + count + ", productBrand=" + productBrand
				+ ", productDescription=" + productDescription + ", productPrice=" + productPrice + ", fileName="
				+ fileName + ", passwd=" + passwd + ", paymentKind=" + paymentKind + ", numPurchase=" + numPurchase
				+ "]";
	}

}