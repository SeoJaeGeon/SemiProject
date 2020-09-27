package member.model.vo;

import java.sql.Date;

public class Member {
	private int memNum;
	private String memName;
	private String memId;
	private String memPwd;
	private String memPhone;
	private String address;
	private String email;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private int loginToken;		// 토큰
	private String division;	// 구분
	private String storeNo;		// 상점 번호(시퀀스처리)
	private String storeName;	// 상점명
	
	public Member() {}

	// 유저 생성자
	public Member(int memNum, String memName, String memId, String memPwd, String memPhone, String address,
			String email, Date enrollDate, Date modifyDate, String status, String division) {
		super();
		this.memNum = memNum;
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memPhone = memPhone;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.division = division;
	}

	// 회원가입 생성자
	public Member(String memName, String memId, String memPwd, String memPhone, String address, String email) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memPhone = memPhone;
		this.address = address;
		this.email = email;
	}

	public Member(String memId, String memName, String memPhone, String address, String email) {
		super();
		
		this.memName = memName;
		this.memId = memId;
		this.memPhone = memPhone;
		this.address = address;
		this.email = email;
	}

	// 판매자 생성자
	public Member(int memNum, String memName, String memId, String memPwd, String memPhone, String address,
			String email, Date enrollDate, Date modifyDate, String status, String division, String storeNo,
			String storeName) {
		super();
		this.memNum = memNum;
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memPhone = memPhone;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.division = division;
		this.storeNo = storeNo;
		this.storeName = storeName;
	}
	
	// 판매자 회원가입 생성자
	public Member(String memName, String memId, String memPwd, String memPhone, String address, String email,
			String storeName) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memPhone = memPhone;
		this.address = address;
		this.email = email;
		this.storeName = storeName;
	}

	
	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getLoginToken() {
		return loginToken;
	}

	public void setLoginToken(int loginToken) {
		this.loginToken = loginToken;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	@Override
	public String toString() {
		return "Member [memNum=" + memNum + ", memName=" + memName + ", memId=" + memId + ", memPwd=" + memPwd
				+ ", memPhone=" + memPhone + ", address=" + address + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", loginToken=" + loginToken + ", division="
				+ division + ", storeName=" + storeName + "]";
	}
	
	
	
	

}
