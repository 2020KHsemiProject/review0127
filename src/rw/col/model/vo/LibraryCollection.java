package rw.col.model.vo;

public class LibraryCollection {
	
	private int colLibraryId;	// 컬렉션 - 서재 고유 ID
	private String memberNo;	// (본인)회원 고유 번호
	private String memberId;	// (타인)회원 ID
	
	public int getColLibraryId() {
		return colLibraryId;
	}
	public void setColLibraryId(int colLibraryId) {
		this.colLibraryId = colLibraryId;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public LibraryCollection(int colLibraryId, String memberNo, String memberId) {
		super();
		this.colLibraryId = colLibraryId;
		this.memberNo = memberNo;
		this.memberId = memberId;
	}
	public LibraryCollection() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
