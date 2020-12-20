package rw.faq.model.vo;

import java.util.ArrayList;

public class FAQList {
	
	private ArrayList<Faq> list;
	private String pageNavi;
	
	
	public FAQList(ArrayList<Faq> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	
	public FAQList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Faq> getList() {
		return list;
	}
	public void setList(ArrayList<Faq> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
	

}
