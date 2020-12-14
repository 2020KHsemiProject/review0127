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

}