package rw.reviewnote.model.vo;

import java.util.ArrayList;

import rw.review.model.vo.ReviewCard;

public class ReviewNotePageData {
	private ArrayList<ReviewCard> list;
	private String pageNavi;
	
	public ReviewNotePageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewNotePageData(ArrayList<ReviewCard> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<ReviewCard> getList() {
		return list;
	}

	public void setList(ArrayList<ReviewCard> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
