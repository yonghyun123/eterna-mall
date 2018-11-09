package kr.or.kosta.eterna.fileInfo.domain;

public class FileInfo {
   /**파일 식별자*/
   private String fileId;
   /**파일명*/
   private String fileName;
   /**파일 확장자*/
   private String contentType;
   
   public FileInfo() {
      super();
   }
   
   
   public FileInfo(String fileId, String fileName, String contentType) {
      super();
      this.fileId = fileId;
      this.fileName = fileName;
      this.contentType = contentType;
   }
   
   
   public String getFileId() {
      return fileId;
   }


   public void setFileId(String fileId) {
      this.fileId = fileId;
   }


   public String getFileName() {
      return fileName;
   }


   public void setFileName(String fileName) {
      this.fileName = fileName;
   }


   public String getContentType() {
      return contentType;
   }


   public void setContentType(String contentType) {
      this.contentType = contentType;
   }

   @Override
   public String toString() {
      return "productImage [file_id=" + fileId + ", file_name=" + fileName + ", content_type=" + contentType +"]";
   }
}