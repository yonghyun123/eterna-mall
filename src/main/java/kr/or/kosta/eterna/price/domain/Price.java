package kr.or.kosta.eterna.price.domain;

public class Price {
   /**가격 식별자*/
   private String id;
   /**제품 id*/
   private String productId;
   /**제품 가격*/
   private String price;
   
   public Price() {
      super();
   }
   
   public Price(String id, String productId, String price) {
      super();
      this.id = id;
      this.productId = productId;
      this.price = price;
   }



   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getProductId() {
      return productId;
   }

   public void setProductId(String productId) {
      this.productId = productId;
   }

   public String getPrice() {
      return price;
   }

   public void setPrice(String price) {
      this.price = price;
   }

   @Override
   public String toString() {
      return "productImage [id=" + id + ", productId=" + productId + ", price=" + price +"]";
   }
}