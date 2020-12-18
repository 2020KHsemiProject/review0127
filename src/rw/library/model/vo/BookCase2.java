package rw.library.model.vo;

public class BookCase2 {
	private String memberNo;
	private String memberId;
	private String nickname;
	private int birthYear;
	private char gender;
	private char endYN;

	private String bookshelfId;
	private String bookshelfName;
	private char privateYN;
	private char delYN;
	
	private String psnShelfId;

	public BookCase2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookCase2(String memberNo, String memberId, String nickname, int birthYear, char gender, char endYN,
			String bookshelfId, String bookshelfName, char privateYN, char delYN, String psnShelfId) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.nickname = nickname;
		this.birthYear = birthYear;
		this.gender = gender;
		this.endYN = endYN;
		this.bookshelfId = bookshelfId;
		this.bookshelfName = bookshelfName;
		this.privateYN = privateYN;
		this.delYN = delYN;
		this.psnShelfId = psnShelfId;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public char getEndYN() {
		return endYN;
	}

	public void setEndYN(char endYN) {
		this.endYN = endYN;
	}

	public String getBookshelfId() {
		return bookshelfId;
	}

	public void setBookshelfId(String bookshelfId) {
		this.bookshelfId = bookshelfId;
	}

	public String getBookshelfName() {
		return bookshelfName;
	}

	public void setBookshelfName(String bookshelfName) {
		this.bookshelfName = bookshelfName;
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

	public String getPsnShelfId() {
		return psnShelfId;
	}

	public void setPsnShelfId(String psnShelfId) {
		this.psnShelfId = psnShelfId;
	}
	
	
}
