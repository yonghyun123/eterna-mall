package kr.or.kosta.eterna.user.domain;

public class UserRcmd {
   String id;
   String userId;
   String cleansingCount;
   String libCount;
   String skinCount;
   String lotionCount;
   String sunCount;
   
   public UserRcmd() {

   }
   
   public UserRcmd(String id, String userId, String cleansingCount, String libCount, String skinCount,
         String lotionCount, String sunCount) {
      super();
      this.id = id;
      this.userId = userId;
      this.cleansingCount = cleansingCount;
      this.libCount = libCount;
      this.skinCount = skinCount;
      this.lotionCount = lotionCount;
      this.sunCount = sunCount;
   }
   
   public UserRcmd(String userId, String cleansingCount, String libCount, String skinCount,
         String lotionCount, String sunCount) {
      super();
      this.userId = userId;
      this.cleansingCount = cleansingCount;
      this.libCount = libCount;
      this.skinCount = skinCount;
      this.lotionCount = lotionCount;
      this.sunCount = sunCount;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getCleansingCount() {
      return cleansingCount;
   }
   public void setCleansingCount(String cleansingCount) {
      this.cleansingCount = cleansingCount;
   }
   public String getLibCount() {
      return libCount;
   }
   public void setLibCount(String libCount) {
      this.libCount = libCount;
   }
   public String getSkinCount() {
      return skinCount;
   }
   public void setSkinCount(String skinCount) {
      this.skinCount = skinCount;
   }
   public String getLotionCount() {
      return lotionCount;
   }
   public void setLotionCount(String lotionCount) {
      this.lotionCount = lotionCount;
   }
   public String getSunCount() {
      return sunCount;
   }
   public void setSunCount(String sunCount) {
      this.sunCount = sunCount;
   }

   @Override
   public String toString() {
      return "UserRcmd [id=" + id + ", userId=" + userId + ", cleansingCount=" + cleansingCount + ", libCount="
            + libCount + ", skinCount=" + skinCount + ", lotionCount=" + lotionCount + ", sunCount=" + sunCount
            + "]";
   }
   

}