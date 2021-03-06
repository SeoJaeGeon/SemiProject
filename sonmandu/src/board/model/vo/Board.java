package board.model.vo;

import java.sql.Date;

public class Board {

	private int bId;			// 게시글 번호 1
	private String bTitle;		// 게시글 제목 2
	private String bContent;	// 게시글 내용 3
	private String bWriter;		// 게시글 작성자 4
	private int bCount;			// 게시글 조회수 5 
	private Date createDate;	// 게시글 작성일 6
	private Date modifyDate;	// 게시글 수정일 7
	private String status;		// 게시글 상태(Y : 활성화, N : 삭제)
	
	public Board() {}

	public Board(int bId, String bTitle, String bContent, String bWriter, int bCount, Date createDate, Date modifyDate,
			String status) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bCount=" + bCount + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status="
				+ status + "]";
	}
	
	

}
