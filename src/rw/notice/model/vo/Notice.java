package rw.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeCont;
	private char delYN;
	
	
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public Notice(int noticeNo, String noticeTitle, Date noticeDate, String noticeCont, char delYN) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeCont = noticeCont;
		this.delYN = delYN;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	
	

}
