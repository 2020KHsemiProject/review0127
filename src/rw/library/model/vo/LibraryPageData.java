package rw.library.model.vo;

import java.util.ArrayList;

public class LibraryPageData {
	private ArrayList<BookCase> list;
	private String pageNavi;
	public LibraryPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LibraryPageData(ArrayList<BookCase> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<BookCase> getList() {
		return list;
	}
	public void setList(ArrayList<BookCase> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
