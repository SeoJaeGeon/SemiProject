package product.model.vo;

public class History {
	public History() {}
	
	private int stay; 			// 주문리스트 번호(시퀀스)
	private int orderNum; 		// 주문번호(시퀀스.currval)
	private int productNum; 	// 상품번호
	private int orderQuantity;	// 상품갯수
	
	public History(int stay, int orderNum, int productNum, int orderQuantity) {
		super();
		this.stay = stay;
		this.orderNum = orderNum;
		this.productNum = productNum;
		this.orderQuantity = orderQuantity;
	}
	
	
	
	public History(int productNum, int orderQuantity) {
		super();
		this.productNum = productNum;
		this.orderQuantity = orderQuantity;
	}



	public int getStay() {
		return stay;
	}
	public void setStay(int stay) {
		this.stay = stay;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	@Override
	public String toString() {
		return "History [stay=" + stay + ", orderNum=" + orderNum + ", productNum=" + productNum + ", orderQuantity="
				+ orderQuantity + "]";
	}
	
	
}
