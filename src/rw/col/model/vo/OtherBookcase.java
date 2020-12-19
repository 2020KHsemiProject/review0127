package rw.col.model.vo;

import java.util.ArrayList;

import rw.library.model.vo.Library;
import rw.member.model.vo.Member;
import rw.review.model.vo.Book;

public class OtherBookcase {
	private Library lib;
	private Member m;
	private ArrayList<Book> bookList;
	
	public OtherBookcase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OtherBookcase(Library lib, Member m, ArrayList<Book> bookList) {
		super();
		this.lib = lib;
		this.m = m;
		this.bookList = bookList;
	}
	public Library getLib() {
		return lib;
	}
	public void setLib(Library lib) {
		this.lib = lib;
	}
	public Member getM() {
		return m;
	}
	public void setM(Member m) {
		this.m = m;
	}
	public ArrayList<Book> getBookList() {
		return bookList;
	}
	public void setBookList(ArrayList<Book> bookList) {
		this.bookList = bookList;
	}
	
	
}
