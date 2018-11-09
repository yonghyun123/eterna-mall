package kr.or.kosta.eterna.productImage.domain;

public class ProductImage {
   /**이미지 식별자*/
   private String imageId;
   /**이미지 카테고리 식별자*/
   private String imageType;
   /**제품 식별자*/
   private String productId;
   /** 파일 식별자*/
   private String fileName;
   
   private String fileId;
   
   public ProductImage() {
      super();
   }
   

   public ProductImage(String imageId, String imageType, String productId, String fileName, String fileId) {
      super();
      this.imageId = imageId;
      this.imageType = imageType;
      this.productId = productId;
      this.fileName = fileName;
      this.fileId = fileId;
   }

   public String getImageId() {
      return imageId;
   }

   public void setImageId(String imageId) {
      this.imageId = imageId;
   }

   public String getImageType() {
      return imageType;
   }

   public void setImageType(String imageType) {
      this.imageType = imageType;
   }

   public String getProductId() {
      return productId;
   }

   public void setProductId(String productId) {
      this.productId = productId;
   }


   public String getFileName() {
      return fileName;
   }

   public void setFileName(String fileName) {
      this.fileName = fileName;
   }

   
   public String getFileId() {
      return fileId;
   }


   public void setFileId(String fileId) {
      this.fileId = fileId;
   }


   @Override
   public String toString() {
      return "ProductImage [imageId=" + imageId + ", imageType=" + imageType + ", productId=" + productId
            + ", fileName=" + fileName + ", fileId=" + fileId + "]";
   }



}