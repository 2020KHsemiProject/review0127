package rw.member.model.service;

import java.sql.Connection;

import rw.common.JDBCTemplate;
import rw.member.model.dao.MemberDAO;
import rw.member.model.vo.Member;

public class MemberService {
	private MemberDAO mDAO = new MemberDAO();
	public Member loginMember(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = mDAO.loginMember(conn,memberId,memberPwd);
		JDBCTemplate.close(conn);
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.insertMember(conn,m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn); 
		return result;		
	}	

	public Member selectOneMemberId(String memberId) { // 회원 ID로 회원 찾기
		Connection conn = JDBCTemplate.getConnection();
		Member m = mDAO.selectOneMemberId(conn,memberId);
		JDBCTemplate.close(conn);
		return m;

	}

	public boolean memberIdCheck(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = mDAO.memberIdCheck(conn,memberId);
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean nickNameCheck(String nickName) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = mDAO.nickNameCheck(conn,nickName);
		JDBCTemplate.close(conn);
		return result;		
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.deleteMember(conn,memberId);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateMemberPwd(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.updateMemberPwd(conn,memberId,memberPwd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}
}
