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
	private String fileName;
	
	public ProductImage() {
		super();
	}
	
	public ProductImage(int imageId, String imageType, int productId, int fileId, String fileName) {
		super();
		this.imageId = imageId;
		this.imageType = imageType;
		this.productId = productId;
		this.fileId = fileId;
		this.fileName = fileName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "ProductImage [imageId=" + imageId + ", imageType=" + imageType + ", productId=" + productId
				+ ", fileId=" + fileId + ", fileName=" + fileName + "]";
	}

}
