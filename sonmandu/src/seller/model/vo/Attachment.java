package seller.model.vo;

import java.sql.Date;

public class Attachment {
	private int fId;
	private int productId;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private Date uploadDate;
	private String status;
	
	public Attachment() {}

	public Attachment(int fId, int productId, String originName, String changeName, String filePath, int fileLevel,
			Date uploadDate, String status) {
		super();
		this.fId = fId;
		this.productId = productId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", productId=" + productId + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", uploadDate=" + uploadDate
				+ ", status=" + status + "]";
	}

	
	
}