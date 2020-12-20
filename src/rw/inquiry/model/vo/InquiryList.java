package rw.inquiry.model.vo;

import java.util.ArrayList;

public class InquiryList {

	private ArrayList<Inquiry> list;
	private String pageNavi;

	public ArrayList<Inquiry> getList() {
		return list;
	}

	public void setList(ArrayList<Inquiry> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public InquiryList(ArrayList<Inquiry> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public InquiryList() {
		super();
		// TODO Auto-generated constructor stub
	}

}
