package rw.review.model.vo;

public class BookLike {
	private int likeId;
	private String memberNo;
	private String bookId;
	
	public BookLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookLike(int likeId, String memberNo, String bookId) {
		super();
		this.likeId = likeId;
		this.memberNo = memberNo;
		this.bookId = bookId;
	}
	
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	
}
