package rw.admin.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.member.model.dao.MemberSearchDAO;
import rw.common.JDBCTemplate;
import rw.member.model.vo.Member;
import rw.member.model.vo.MemberList;

public class MemberSearchService {

	public MemberList searchMember(int currentPage, Date enrollFrom, Date enrollTill, Date endFrom,
			Date endTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		ArrayList <Member> list = new MemberSearchDAO().searchMember(conn, recordCountPerPage, currentPage, 
																	enrollFrom, enrollTill, endFrom, endTill);
		
		
		int naviCountPerPage = 3;
		
		String pageNavi = new MemberSearchDAO().getPageNavi(conn, recordCountPerPage, naviCountPerPage, currentPage,
															enrollFrom, enrollTill, endFrom, endTill);
		
		MemberList ml = new MemberList();
		ml.setList(list);
		ml.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return ml;
	}

	public MemberList searchMember(int currentPage, String category, String keyword, Date enrollFrom,
			Date enrollTill, Date endFrom, Date endTill) {
		
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		ArrayList <Member> list = new MemberSearchDAO().searchMember(conn, recordCountPerPage, category, keyword, currentPage, 
																		enrollFrom, enrollTill, endFrom, endTill);
		
		
		int naviCountPerPage = 3;
		
		String pageNavi = new MemberSearchDAO().getPageNavi(conn, recordCountPerPage, naviCountPerPage, currentPage,
															keyword, category, enrollFrom, enrollTill, endFrom, endTill);
		
		MemberList ml = new MemberList();
		ml.setList(list);
		ml.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);		
		return ml;
	}

	public MemberList searchMember(int currentPage, Date enrollFrom, Date enrollTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		ArrayList <Member> list = new MemberSearchDAO().searchMember(conn, recordCountPerPage, currentPage, 
																	enrollFrom, enrollTill);
		
		
		int naviCountPerPage = 3;
		
		String pageNavi = new MemberSearchDAO().getPageNavi(conn, recordCountPerPage, naviCountPerPage, currentPage,
															enrollFrom, enrollTill);
		
		MemberList ml = new MemberList();
		ml.setList(list);
		ml.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return ml;
	}

	public MemberList searchMember(int currentPage, String category, String keyword, Date enrollFrom, Date enrollTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		ArrayList <Member> list = new MemberSearchDAO().searchMember(conn, recordCountPerPage, category, keyword, currentPage, 
																	enrollFrom, enrollTill);
		
		
		int naviCountPerPage = 3;
		
		String pageNavi = new MemberSearchDAO().getPageNavi(conn, recordCountPerPage, naviCountPerPage, category, keyword, currentPage,
															enrollFrom, enrollTill);
		
		MemberList ml = new MemberList();
		ml.setList(list);
		ml.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		
		
		return ml;
		
		
		
	}
	
	

}
