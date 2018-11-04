package kr.or.kosta.eterna.cart.domain;

/**
 * 장바구니 domain
 * @author 조희진
 *
 */
public class Cart {
	
	private String userId;
	private String count;
	private String productId;
	private String productBrand;
	private String productDescription;
	private String price;
	private String fileName;
	
	
	public Cart() {
		super();
	}


	public Cart(String userId, String count, String productId, String productBrand, String productDescription,
			String price, String fileName) {
		super();
		this.userId = userId;
		this.count = count;
		this.productId = productId;
		this.productBrand = productBrand;
		this.productDescription = productDescription;
		this.price = price;
		this.fileName = fileName;
	}
	
	public Cart(String userId, String count, String productId) {
		this.userId = userId;
		this.count = count;
		this.productId = productId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getCount() {
		return count;
	}


	public void setCount(String count) {
		this.count = count;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
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


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	@Override
	public String toString() {
		return "Cart [userId=" + userId + ", count=" + count + ", productId=" + productId + ", productBrand="
				+ productBrand + ", productDescription=" + productDescription + ", price=" + price + ", fileName="
				+ fileName + "]";
	}


	
}
