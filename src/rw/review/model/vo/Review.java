package rw.review.model.vo;

import java.sql.Date;

public class Review {
	
	private String reviewId;	// 리뷰 고유 ID
	private Date reviewDate;	// 리뷰 작성일
	private int reviewCount;	// 리뷰 조회수
	private int reviewRate;		// 리뷰 별점
	private String reviewCont;	// 리뷰 내용
	private String bookId;		// 책 고유 ID
	private String memberNo;	// 회원 고유 번호
	private char delYN;			// 리뷰 삭제 여부

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