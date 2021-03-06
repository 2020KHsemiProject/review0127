package rw.library.model.vo;

public class PersonalLibrary {
	private int psnShelfId;		// 책장-도서 고유ID
	private String bookShelfId;	// 책장고유ID
	private String bookId;		// 책고유ID

	public PersonalLibrary() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PersonalLibrary(int psnShelfId, String bookShelfId, String bookId) {
		super();
		this.psnShelfId = psnShelfId;
		this.bookShelfId = bookShelfId;
		this.bookId = bookId;
	}
	public int getPsnShelfId() {
		return psnShelfId;
	}
	public void setPsnShelfId(int psnShelfId) {
		this.psnShelfId = psnShelfId;
	}
	public String getBookShelfId() {
		return bookShelfId;
	}
	public void setBookShelfId(String bookShelfId) {
		this.bookShelfId = bookShelfId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
}
