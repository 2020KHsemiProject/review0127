package rw.review.model.vo;

import java.sql.Date;

public class BookReview {
	private String memberNo;
	private String reviewId;
	private Date reviewDate;
	private int reviewCount;
	private int reviewRate;
	private String reviewCont;
	private String bookId;
	private char delYn;
	private String nickname;
	private String profileImg;
	
	public BookReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookReview(String memberNo, String reviewId, Date reviewDate, int reviewCount, int reviewRate,
			String reviewCont, String bookId, char delYn, String nickname, String profileImg) {
		super();
		this.memberNo = memberNo;
		this.reviewId = reviewId;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.reviewRate = reviewRate;
		this.reviewCont = reviewCont;
		this.bookId = bookId;
		this.delYn = delYn;
		this.nickname = nickname;
		this.profileImg = profileImg;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
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
	public char getDelYn() {
		return delYn;
	}
	public void setDelYn(char delYn) {
		this.delYn = delYn;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	
}
