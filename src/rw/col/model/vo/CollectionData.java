package rw.col.model.vo;

import java.util.ArrayList;

public class CollectionData<T,E> {
	private ArrayList<T> list; //보여줄 게시물
	private ArrayList<E> colList; //콜렉션 데이터
	private String pageNavi;
	

	public CollectionData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CollectionData(ArrayList<T> list, ArrayList<E> colList, String pageNavi) {
		super();
		this.list = list;
		this.colList = colList;
		this.pageNavi = pageNavi;
	}

	public ArrayList<T> getList() {
		return list;
	}

	public void setList(ArrayList<T> list) {
		this.list = list;
	}

	public ArrayList<E> getColList() {
		return colList;
	}

	public void setColList(ArrayList<E> colList) {
		this.colList = colList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
