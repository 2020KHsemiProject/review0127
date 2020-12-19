package rw.review.model.vo;

public class ReviewLike {
	private String likeId;		// 좋아요 ID
	private char likeYN;		// 좋아요 YN
	private String reviewId;	// 리뷰고유ID
	private String memberNo;	// 내 멤버고유번호
	
	public ReviewLike() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewLike(String likeId, char likeYN, String reviewId, String memberNo) {
		super();
		this.likeId = likeId;
		this.likeYN = likeYN;
		this.reviewId = reviewId;
		this.memberNo = memberNo;
	}

	public String getLikeId() {
		return likeId;
	}

	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}

	public char getLikeYN() {
		return likeYN;
	}

	public void setLikeYN(char likeYN) {
		this.likeYN = likeYN;
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
