package rw.faq.model.vo;

import java.util.ArrayList;

public class FAQList {
	
	private ArrayList<FAQ> list;
	private String pageNavi;
	
	
	public FAQList(ArrayList<FAQ> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	
	public FAQList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<FAQ> getList() {
		return list;
	}
	public void setList(ArrayList<FAQ> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
	

}
