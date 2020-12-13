package rw.library.model.vo;

public class Library {
	private String bookShelfId;
	private String bookShelfName;
	private String memberNo;
	private char privateYN;
	private char delYN;
	
	public Library() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Library(String bookShelfId, String bookShelfName, String memberNo, char privateYN, char delYN) {
		super();
		this.bookShelfId = bookShelfId;
		this.bookShelfName = bookShelfName;
		this.memberNo = memberNo;
		this.privateYN = privateYN;
		this.delYN = delYN;
	}
	public String getBookShelfId() {
		return bookShelfId;
	}
	public void setBookShelfId(String bookShelfId) {
		this.bookShelfId = bookShelfId;
	}
	public String getBookShelfName() {
		return bookShelfName;
	}
	public void setBookShelfName(String bookShelfName) {
		this.bookShelfName = bookShelfName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public char getPrivateYN() {
		return privateYN;
	}
	public void setPrivateYN(char privateYN) {
		this.privateYN = privateYN;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	
}


