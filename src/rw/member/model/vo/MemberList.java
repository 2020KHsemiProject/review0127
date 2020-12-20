package rw.member.model.vo;

import java.util.ArrayList;

public class MemberList {
	
	private ArrayList<Member> list;
	private String pageNavi;
	
	
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public MemberList(ArrayList<Member> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public MemberList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
