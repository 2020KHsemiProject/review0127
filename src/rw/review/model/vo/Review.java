package rw.review.model.vo;

import java.sql.Date;

public class Review {
	private String reviewId;
	private Date reviewDate;
	private int reviewCount;
	private int reviewRate;
	private String reviewCont;
	private String bookId;
	private String memberNo;
	private char delYN;

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public String getReviewCont() {
		return reviewCont;
	}

	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public char getDelYN() {
		return delYN;
	}

	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewId, Date reviewDate, int reviewCount, int reviewRate, String reviewCont, String bookId,
			String memberNo, char delYN) {
		super();
		this.reviewId = reviewId;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.reviewRate = reviewRate;
		this.reviewCont = reviewCont;
		this.bookId = bookId;
		this.memberNo = memberNo;
		this.delYN = delYN;
	}

}