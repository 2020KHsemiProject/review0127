package rw.col.model.vo;

import java.util.ArrayList;

public class CollectionPageData<T> {
	private ArrayList<T> list; //보여줄 게시물
	private int totalCount; //게시물 전체 갯수 
	private String pageNavi; //페이지 네비
	
	public CollectionPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CollectionPageData(ArrayList<T> list, int totalCount, String pageNavi) {
		super();
		this.list = list;
		this.totalCount = totalCount;
		this.pageNavi = pageNavi;
	}
	public ArrayList<T> getList() {
		return list;
	}
	public void setList(ArrayList<T> list) {
		this.list = list;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
