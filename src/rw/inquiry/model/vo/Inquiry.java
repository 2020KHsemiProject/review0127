package rw.inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	private int inquiryNo;
	private String memberId;
	private String replyEmail;
	private String inquiryTitle;
	private String inquiryCont;
	private Date inquiryDate;
	private String category;
	private char replyYN;
	private char delYN;

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReplyEmail() {
		return replyEmail;
	}

	public void setReplyEmail(String replyEmail) {
		this.replyEmail = replyEmail;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryCont() {
		return inquiryCont;
	}

	public void setInquiryCont(String inquiryCont) {
		this.inquiryCont = inquiryCont;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public char getReplyYN() {
		return replyYN;
	}

	public void setReplyYN(char replyYN) {
		this.replyYN = replyYN;
	}

	public char getDelYN() {
		return delYN;
	}

	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}

	public Inquiry(int inquiryNo, String memberId, String replyEmail, String inquiryTitle, String inquiryCont,
			Date inquiryDate, String category, char replyYN, char delYN) {
		super();
		this.inquiryNo = inquiryNo;
		this.memberId = memberId;
		this.replyEmail = replyEmail;
		this.inquiryTitle = inquiryTitle;
		this.inquiryCont = inquiryCont;
		this.inquiryDate = inquiryDate;
		this.category = category;
		this.replyYN = replyYN;
		this.delYN = delYN;
	}

	public Inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}

}