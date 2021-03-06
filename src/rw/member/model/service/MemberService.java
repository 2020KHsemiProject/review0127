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
	
	public boolean emailCheck(String email) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = mDAO.nickNameCheck(conn,email);
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

	public int updateMemberPwd(String memberId, String memberPwd, String currentPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.updateMemberPwd(conn,memberId,memberPwd,currentPwd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}

	public int updateEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.updateEmail(conn, email);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}

	public int uploadFile(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.uploadFile(conn,m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}

	public int emailChange(String email, String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int upload = mDAO.emailChange(conn,email,memberId);
		
		if(upload > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return upload;
	}

	public int updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.updateMember(conn, m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}
}
