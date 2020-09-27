package product.model.vo;

import java.sql.Date;

public class Basket {
	public Basket() {}
	
	private int basketId;				// 장바구니 번호
	private int quantity;				//장바구니수량
	private String basketStatus;		// 장바구니 상태
	private int productId;				// 상품 번호
	private int memId;					// 회원 번호
	
	private String productName;   // 상품 이름
	private int price;            // 상품 가격
	private int charge;           // 배송비
	
	private int storeId;         // 상점 넘버
	private String storeName;      // 상점 이름
	
	private int fId;            // 파일 넘버
	//private int PRODUCT_ID;      // 상품 넘버
	private String originName;      // 파일 원래 이름
	private String changeName;      // 변경된 파일 이름
	
	public Basket(int quantity, int productId, int memId) {
		super();
		this.quantity = quantity;
		this.productId = productId;
		this.memId = memId;
	}

	public Basket(int basketId, int quantity, String basketStatus, int productId, int memId, String productName,
			int price, int charge, int storeId, String storeName, int fId, String originName, String changeName) {
		super();
		this.basketId = basketId;
		this.quantity = quantity;
		this.basketStatus = basketStatus;
		this.productId = productId;
		this.memId = memId;
		this.productName = productName;
		this.price = price;
		this.charge = charge;
		this.storeId = storeId;
		this.storeName = storeName;
		this.fId = fId;
		this.originName = originName;
		this.changeName = changeName;
	}

	public int getBasketId() {
		return basketId;
	}

	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getBasketStatus() {
		return basketStatus;
	}

	public void setBasketStatus(String basketStatus) {
		this.basketStatus = basketStatus;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
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

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
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

	@Override
	public String toString() {
		return "Basket [basketId=" + basketId + ", quantity=" + quantity + ", basketStatus=" + basketStatus
				+ ", productId=" + productId + ", memId=" + memId + ", productName=" + productName + ", price=" + price
				+ ", charge=" + charge + ", storeId=" + storeId + ", storeName=" + storeName + ", fId=" + fId
				+ ", originName=" + originName + ", changeName=" + changeName + "]";
	}

	
	
}
