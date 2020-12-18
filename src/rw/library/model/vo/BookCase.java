package rw.library.model.vo;

import java.util.ArrayList;

import rw.review.model.vo.Book;

public class BookCase {
	private Library libr;
	private ArrayList<Book> listB;
	public BookCase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookCase(Library libr, ArrayList<Book> listB) {
		super();
		this.libr = libr;
		this.listB = listB;
	}
	public Library getLibr() {
		return libr;
	}
	public void setLibr(Library libr) {
		this.libr = libr;
	}
	public ArrayList<Book> getListB() {
		return listB;
	}
	public void setListB(ArrayList<Book> listB) {
		this.listB = listB;
	}

	
	
	
	
}
