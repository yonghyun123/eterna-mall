package kr.or.kosta.eterna.price.domain;

public class Price {
	/**가격 식별자*/
	private int id;
	/**제품 id*/
	private int productId;
	/**제품 가격*/
	private int price;
	
	public Price() {
		super();
	}
	

	public Price(int id, int productId, int price) {
		super();
		this.id = id;
		this.productId = productId;
		this.price = price;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "productImage [id=" + id + ", productId=" + productId + ", price=" + price +"]";
	}
}
