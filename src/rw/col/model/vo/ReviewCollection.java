package rw.col.model.vo;

public class ReviewCollection {
	
	private int colReviewId;	// 컬렉션 - 리뷰 고유 ID
	private String memberId;	// 멤버 고유 번호
	private String reviewId;	// 리뷰 고유 ID
	
	public int getColReviewId() {
		return colReviewId;
	}
	public void setColReviewId(int colReviewId) {
		this.colReviewId = colReviewId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public ReviewCollection(int colReviewId, String memberId, String reviewId) {
		super();
		this.colReviewId = colReviewId;
		this.memberId = memberId;
		this.reviewId = reviewId;
	}
	public ReviewCollection() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
