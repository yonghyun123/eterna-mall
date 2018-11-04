package kr.or.kosta.eterna.product.domain;

public class Product {
	/**제품식별자*/
	private int productId;
	/**카테고리 식별자*/
	private int categoryId;
	/**제품 브랜드*/
	private String productBrand;
	/**사용 성별*/
	private String productSex;
	/**재품 설명*/
	private String productDescription;
	/**재고*/
	private int productStock;
	/**생산일*/
	private String createDate;
	/**수정일?*/
	private String modifyDate;
	/**사용가능 최저연령*/
	private int minAge;
	/**사용가능 최고연령*/
	private int maxAge;
	/**제품 섬네일*/
	private String thumnail;
	/**제품 mainImage*/
	private String mainImg;
	/*제품 etcImage*/
	private String etcImage;
	/**제품 가격*/
	private int price;
	
	public Product() {
		super();
	}
	
	public Product(int productId, int categoryId, String productBrand, String productSex, String productDescription,
			int productStock, String createDate, String modifyDate, int minAge, int maxAge, String thumnail,
			String mainImg, String etcImage, int price) {
		super();
		this.productId = productId;
		this.categoryId = categoryId;
		this.productBrand = productBrand;
		this.productSex = productSex;
		this.productDescription = productDescription;
		this.productStock = productStock;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.minAge = minAge;
		this.maxAge = maxAge;
		this.thumnail = thumnail;
		this.mainImg = mainImg;
		this.etcImage = etcImage;
		this.price = price;
	}

	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getProductBrand() {
		return productBrand;
	}


	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}


	public String getProductSex() {
		return productSex;
	}


	public void setProductSex(String productSex) {
		this.productSex = productSex;
	}


	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public int getProductStock() {
		return productStock;
	}


	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getMinAge() {
		return minAge;
	}


	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}


	public int getMaxAge() {
		return maxAge;
	}


	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}


	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getEtcImage() {
		return etcImage;
	}

	public void setEtcImage(String etcImage) {
		this.etcImage = etcImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "User [productId=" + productId + ", categoryId=" + categoryId + ", productBrand=" + productBrand + ", productSex=" + productSex + ", productDescription=" + productDescription
				+ ", productStock=" + productStock + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", minAge=" + minAge + ", maxAge=" + maxAge +
				minAge + ", thumnail=" + thumnail + ", mainImg=" + mainImg +", etcImage=" + etcImage +", price=" + price+"]";
	}
}
