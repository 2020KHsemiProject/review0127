package rw.col.model.vo;

public class ReviewCollection {
	
	private int colReviewId;	// 컬렉션 - 리뷰 고유 ID
	private String memberNo;	// 멤버 고유 번호
	private String reviewId;	// 리뷰 고유 ID
	public ReviewCollection() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewCollection(int colReviewId, String memberNo, String reviewId) {
		super();
		this.colReviewId = colReviewId;
		this.memberNo = memberNo;
		this.reviewId = reviewId;
	}
	public int getColReviewId() {
		return colReviewId;
	}
	public void setColReviewId(int colReviewId) {
		this.colReviewId = colReviewId;
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
	

}
