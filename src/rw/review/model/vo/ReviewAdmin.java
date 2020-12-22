package rw.review.model.vo;

import java.sql.Date;

public class ReviewAdmin {
	
	private String reviewId;
	private String bookImage;
	private String bookTitle;
	private String nickName;
	private String memberId;
	private int reviewRate;
	private int reviewCount;
	private Date reviewDate;
	private String reviewCont;
	private char delYN;
	
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewCont() {
		return reviewCont;
	}
	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	public ReviewAdmin(String reviewId, String bookImage, String bookTitle, String nickName, String memberId,
			int reviewRate, int reviewCount, Date reviewDate, String reviewCont, char delYN) {
		super();
		this.reviewId = reviewId;
		this.bookImage = bookImage;
		this.bookTitle = bookTitle;
		this.nickName = nickName;
		this.memberId = memberId;
		this.reviewRate = reviewRate;
		this.reviewCount = reviewCount;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.delYN = delYN;
	}
	public ReviewAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	

}
