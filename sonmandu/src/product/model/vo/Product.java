package product.model.vo;

import java.sql.Date;

import oracle.sql.DATE;

public class Product {
   private int productId;         // 상품 넘버
   private String productName;   // 상품 이름
   private int price;            // 상품 가격
   private int stock;         // 상품 재고
   private int productTime;   // 상품 제작 기간
   private int charge;            // 배송비
   private String url;		// 판매 경험
   private String introduction;		// 상점 소개
   
   private String categoryKey;   // 카테고리 넘버
   private String categoryName;   // 카테고리 이름
   
   private int storeId;         // 상점 넘버
   private String storeName;      // 상점 이름
   private int memNum;            // 유저 넘버
   
   private int fId;            // 파일 넘버
   //private int PRODUCT_ID;      // 상품 넘버
   private String originName;      // 파일 원래 이름
   private String changeName;      // 변경된 파일 이름
   private String filePath;      // 파일 경로 지정
   private int fileLevel;         // 파일 우선순위 지정
   private Date uploadDate;      // 파일 업로드 날짜(SYSDATE)
   private String pstatus;         // Product상품의 상태 ( Y/N )
   
   public Product() {}

   public Product(int productId, String productName, int price, int stock, int productTime, int charge, String url, String introduction,
         String categoryKey, String categoryName, int storeId, String storeName, int memNum, int fId,
         String originName, String changeName, String filePath, int fileLevel, Date uploadDate, String pstatus) {
      super();
      this.productId = productId;
      this.productName = productName;
      this.price = price;
      this.stock = stock;
      this.productTime = productTime;
      this.charge = charge;
      this.url = url;
      this.introduction = introduction;
      this.categoryKey = categoryKey;
      this.categoryName = categoryName;
      this.storeId = storeId;
      this.storeName = storeName;
      this.memNum = memNum;
      this.fId = fId;
      this.originName = originName;
      this.changeName = changeName;
      this.filePath = filePath;
      this.fileLevel = fileLevel;
      this.uploadDate = uploadDate;
      this.pstatus = pstatus;
   }
   
   // 판매자 회원가입
   public Product(String storeName, String url, String introduction) {
	super();
	this.storeName = storeName;
	this.url = url;
	this.introduction = introduction;
	
}

public int getProductId() {
      return productId;
   }

   public void setProductId(int productId) {
      this.productId = productId;
   }

   public String getProductName() {
      return productName;
   }

   public void setProductName(String productName) {
      this.productName = productName;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public int getStock() {
      return stock;
   }

   public void setStock(int stock) {
      this.stock = stock;
   }
   
   public String getIntroduction() {
	   return introduction;
   }
   
   public void setIntroduction(String introduction) {
	   this.introduction = introduction;
   }
   
   public String getUrl() {
	   return url;
   }
   
   public void setUrl(String url) {
	   this.url = url;
   }

   public int getProductTime() {
      return productTime;
   }

   public void setProductTime(int productTime) {
      this.productTime = productTime;
   }

   public int getCharge() {
      return charge;
   }

   public void setCharge(int charge) {
      this.charge = charge;
   }

   public String getCategoryKey() {
      return categoryKey;
   }

   public void setCategoryKey(String categoryKey) {
      this.categoryKey = categoryKey;
   }

   public String getCategoryName() {
      return categoryName;
   }

   public void setCategoryName(String categoryName) {
      this.categoryName = categoryName;
   }

   public int getStoreId() {
      return storeId;
   }

   public void setStoreId(int storeId) {
      this.storeId = storeId;
   }

   public String getStoreName() {
      return storeName;
   }

   public void setStoreName(String storeName) {
      this.storeName = storeName;
   }

   public int getMemNum() {
      return memNum;
   }

   public void setMemNum(int memNum) {
      this.memNum = memNum;
   }

   public int getfId() {
      return fId;
   }

   public void setfId(int fId) {
      this.fId = fId;
   }

   public String getOriginName() {
      return originName;
   }

   public void setOriginName(String originName) {
      this.originName = originName;
   }

   public String getChangeName() {
      return changeName;
   }

   public void setChangeName(String changeName) {
      this.changeName = changeName;
   }

   public String getFilePath() {
      return filePath;
   }

   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }

   public int getFileLevel() {
      return fileLevel;
   }

   public void setFileLevel(int fileLevel) {
      this.fileLevel = fileLevel;
   }

   public Date getUploadDate() {
      return uploadDate;
   }

   public void setUploadDate(Date uploadDate) {
      this.uploadDate = uploadDate;
   }

   public String getPstatus() {
      return pstatus;
   }

   public void setPstatus(String pstatus) {
      this.pstatus = pstatus;
   }

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", price=" + price + ", stock=" + stock
				+ ", productTime=" + productTime + ", charge=" + charge + ", url=" + url + ", introduction="
				+ introduction + ", categoryKey=" + categoryKey + ", categoryName=" + categoryName + ", storeId=" + storeId
				+ ", storeName=" + storeName + ", memNum=" + memNum + ", fId=" + fId + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", uploadDate="
				+ uploadDate + ", pstatus=" + pstatus + "]";
	}

  
   
   
}