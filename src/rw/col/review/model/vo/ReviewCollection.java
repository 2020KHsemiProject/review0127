package rw.col.review.model.vo;

public class ReviewCollection {
	
	private int colReviewId;
	private String memberId;
	private String reviewId;
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
