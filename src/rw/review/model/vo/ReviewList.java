package rw.review.model.vo;

import java.util.ArrayList;

public class ReviewList {
	
	private ArrayList <ReviewAdmin> list;
	private String pageNavi;
	
	
	
	public ArrayList<ReviewAdmin> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewAdmin> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ReviewList(ArrayList<ReviewAdmin> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ReviewList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
