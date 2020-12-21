package rw.admin.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.member.model.dao.MemberDAO;
import rw.member.model.vo.Member;
import rw.member.model.vo.MemberList;
import rw.common.JDBCTemplate;

public class MemberService {
	MemberDAO mDAO = new MemberDAO();
	
	public Member memberLogin(String adminId, String adminPwd) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = mDAO.memberLogin(conn, adminId, adminPwd);
		JDBCTemplate.close(conn);
		return m;
		
	}

	public MemberList selectAll(int currentPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		
		ArrayList<Member> list = mDAO.selectAll(conn, currentPage, recordCountPerPage);
		
		
		int naviCountPerPage = 3;
		String pageNavi = mDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		MemberList ml = new MemberList();
		ml.setList(list);
		ml.setPageNavi(pageNavi);
		
		
		JDBCTemplate.close(conn);
		return ml;
	}

	public int withdrawMember(String memberNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.withdrawMember(conn, memberNo);
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		
		return result;
	}

	public int restoreMember(String memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.restoreMember(conn, memberNo);
		
		
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		
		
		
		return result;
	}

	

}
