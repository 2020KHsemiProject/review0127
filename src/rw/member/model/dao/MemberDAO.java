
package rw.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rw.common.JDBCTemplate;
import rw.member.model.vo.Member;

public class MemberDAO {

	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=? AND END_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setNickname(rset.getString("NICKNAME"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEmailYN(rset.getString("EMAIL_YN").charAt(0));
				m.setBirthYear(rset.getInt("BIRTH_YEAR"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setEndYN(rset.getString("END_YN").charAt(0));
				m.setEndDate(rset.getDate("END_DATE"));
				m.setProfileImg(rset.getString("PROFILE_IMG"));
				
				System.out.println(rset.getString("MEMBER_NO"));
				System.out.println(rset.getString("MEMBER_ID"));
				System.out.println(rset.getString("NICKNAME"));
				System.out.println(rset.getString("MEMBER_PWD"));
				System.out.println(rset.getString("EMAIL"));
				System.out.println(rset.getString("EMAIL_YN").charAt(0));
				System.out.println(rset.getInt("BIRTH_YEAR"));
				System.out.println(rset.getString("GENDER").charAt(0));
				System.out.println(rset.getDate("ENROLL_DATE"));
				System.out.println(rset.getString("END_YN").charAt(0));
				System.out.println(rset.getDate("END_DATE"));
				System.out.println(rset.getString("PROFILE_IMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
//		System.out.println("디비데이터 : "+m.getMemberNo()+"/"+m.getEnrollDate());
		return m;
	}


	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into member values('M'||member_seq.nextval,?,?,?,?,'N',?,?,sysdate,'N',null,null)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getNickname());
			pstmt.setString(3, m.getMemberPwd());
			pstmt.setString(4, m.getEmail());
			pstmt.setInt(5, m.getBirthYear());
			pstmt.setString(6, Character.toString(m.getGender()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		} return result;		
	}
	
	public Member selectOneMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND END_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setNickname(rset.getString("NICKNAME"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEmailYN(rset.getString("EMAIL_YN").charAt(0));
				m.setBirthYear(rset.getInt("BIRTH_YEAR"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setEndYN(rset.getString("END_YN").charAt(0));
				m.setEndDate(rset.getDate("END_DATE"));
				m.setProfileImg(rset.getString("PROFILE_IMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		//System.out.println("디비데이터 : "+m.getMemberNo()+"/"+m.getEnrollDate());
		return m;

	}
}
