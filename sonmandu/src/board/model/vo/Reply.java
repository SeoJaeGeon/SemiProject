package board.model.vo;

import java.sql.Date;

public class Reply {
	private int rId;
	private String rContent;
	private int refBid;
	private int rWriter;
	private String userName;
	private Date createDate;
	private Date modifyDatel;
	private String status;
	
	public Reply() {}

	public Reply(int rId, String rContent, int refBid, int rWriter, String userName, Date createDate, Date modifyDatel,
			String status) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.userName = userName;
		this.createDate = createDate; 
		this.modifyDatel = modifyDatel;
		this.status = status;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public int getrWriter() {
		return rWriter;
	}

	public void setrWriter(int rWriter) {
		this.rWriter = rWriter;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDatel() {
		return modifyDatel;
	}

	public void setModifyDatel(Date modifyDatel) {
		this.modifyDatel = modifyDatel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", userName=" + userName + ", createDate=" + createDate + ", modifyDatel=" + modifyDatel + ", status="
				+ status + "]";
	}
	
	
}
