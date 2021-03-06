
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


	public boolean memberIdCheck(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = "select member_id from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = true; 
			} else {
				result = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public boolean nickNameCheck(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = "select nickname from member where nickname=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = true;
			} else {
				result = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;		
	}
	
	public boolean emailCheck(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = "select email from member where email=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = true;
			} else {
				result = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;		
	}

	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set end_YN='Y', end_date=sysdate where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;		
	}


	public int updateMemberPwd(Connection conn, String memberId, String memberPwd, String currentPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set member_pwd=? where member_id=? and member_pwd=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberPwd);
			pstmt.setString(2, memberId);
			pstmt.setString(3, currentPwd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;		
	}


	public int updateEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set email_YN='Y' where email=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);		
		}
		return result;
	}


	public int uploadFile(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set profile_img=? where memberId=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getProfileImg());
			pstmt.setString(2, m.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		} 
		return result;
	}


	public int emailChange(Connection conn, String email, String memberId) {
		PreparedStatement pstmt = null;
		int upload = 0;
		
		String query = "update member set email=?, email_YN='N' where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, memberId);
			upload = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return upload;		
	}


	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set "
				+ "nickname=?, "
				+ "birth_year=?, "
				+ "gender=?  where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getNickname());
			pstmt.setInt(2, m.getBirthYear());
			pstmt.setString(3, Character.toString(m.getGender()));
			pstmt.setString(4, m.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}	                       
		return result;
	}
}
