package rw.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rw.common.JDBCTemplate;
import rw.member.model.vo.Member;

public class LibraryReviewNoteDAO {

	public Member selecAlltMyLibraryHeader(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NO=? AND END_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
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
		return m;
	}

}
