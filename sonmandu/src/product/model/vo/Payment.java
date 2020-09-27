package product.model.vo;

import java.sql.Date;

public class Payment {
	public Payment() {}
	
	private int orderNum;		// 주문 번호(시퀀스)
	private int memNum;			// 주문자 번호
	private int totalSal;		// 총가격
	private String orderName;	// 주문자 이름
	private String orderPhone;	// 주문자 전화번호
	private String orderEmail;	// 주문자 이메일
	private String orderAddress;// 주문자 주소
	private String paySelect;	// 결재 방법
	private Date payDate;		// 결재한 날짜
	private String payStatus;	// 결재 상태
	
	
	
	public Payment(int totalSal, String orderName, String orderPhone, String orderEmail, String orderAddress,
			String paySelect, Date payDate) {
		super();
		this.totalSal = totalSal;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.orderAddress = orderAddress;
		this.paySelect = paySelect;
		this.payDate = payDate;
	}



	public Payment(int orderNum, int memNum, int totalSal, String orderName, String orderPhone, String orderEmail,
			String orderAddress, String paySelect, Date payDate, String payStatus) {
		super();
		this.orderNum = orderNum;
		this.memNum = memNum;
		this.totalSal = totalSal;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.orderAddress = orderAddress;
		this.paySelect = paySelect;
		this.payDate = payDate;
		this.payStatus = payStatus;
	}
	
	

	public Payment(int memNum, int totalSal, String orderName, String orderPhone, String orderEmail,
			String orderAddress) {
		super();
		this.memNum = memNum;
		this.totalSal = totalSal;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.orderAddress = orderAddress;
	}



	public Payment(int memNum, String orderName, String orderPhone, String orderEmail, String orderAddress) {
		super();
		this.memNum = memNum;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.orderAddress = orderAddress;
	}



	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public int getTotalSal() {
		return totalSal;
	}

	public void setTotalSal(int totalSal) {
		this.totalSal = totalSal;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getPaySelect() {
		return paySelect;
	}

	public void setPaySelect(String paySelect) {
		this.paySelect = paySelect;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	@Override
	public String toString() {
		return "Payment [orderNum=" + orderNum + ", memNum=" + memNum + ", totalSal=" + totalSal + ", orderName="
				+ orderName + ", orderPhone=" + orderPhone + ", orderEmail=" + orderEmail + ", orderAddress="
				+ orderAddress + ", paySelect=" + paySelect + ", payDate=" + payDate + ", payStatus=" + payStatus + "]";
	}
	
	
}
