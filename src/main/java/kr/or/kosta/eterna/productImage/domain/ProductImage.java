package kr.or.kosta.eterna.productImage.domain;

public class ProductImage {
	/**이미지 식별자*/
	private int imageId;
	/**이미지 카테고리 식별자*/
	private String imageType;
	/**제품 식별자*/
	private int productId;
	/** 파일 식별자*/
	private int fileId;
	
	public ProductImage() {
		super();
	}
	
	public ProductImage(int imageId, String imageType, int productId, int fileId) {
		super();
		this.imageId = imageId;
		this.imageType = imageType;
		this.productId = productId;
		this.fileId = fileId;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	@Override
	public String toString() {
		return "productImage [imageId=" + imageId + ", imageType=" + imageType + ", productId=" + productId + ", fileId=" + fileId +"]";
	}
}
