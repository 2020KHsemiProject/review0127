package rw.admin.member.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.member.model.vo.Member;
import rw.common.JDBCTemplate;

public class MemberDAO {

	public Member memberLogin(Connection conn, String adminId, String adminPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = "select * from member where member_Id=? and member_Pwd=? and member_no = 'M0001' and END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_Id"));
				m.setNickname(rset.getString("nickname"));
				m.setMemberPwd(rset.getString("member_Pwd"));
				m.setEmail(rset.getString("email"));
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

	public ArrayList<Member> selectAll(Connection conn, int currentPage, int recordCountPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = "select *"
				+ "from (select row_number() over (order by member_no desc) as row_num, member.* from member) "
				+ "where row_num between ? and ?";
		
		int start =  currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				m.setMemberNo(rset.getString("Member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getNString("nickname"));
				m.setBirthYear(rset.getInt("birth_year"));
				m.setGender(rset.getString("gender").charAt(0));
				m.setEmail(rset.getString("email"));
				m.setEmailYN(rset.getString("email_yn").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setEndDate(rset.getDate("end_date"));
				m.setEndYN(rset.getString("end_YN").charAt(0));
				
				list.add(m);

			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		return list;
		
		
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		
		
		int totalCount = totalCount(conn);
		
		
		int pageTotalCount ; //전체 페이지를 저장하는 변수
		if(totalCount % recordCountPerPage > 0) {
			pageTotalCount = totalCount / recordCountPerPage + 1;
			//ex) pageTotalCount = 108 / 5  + 1   -> 22 Page
			
		}else {
			pageTotalCount = totalCount / recordCountPerPage + 0;
			//ex) pageTotalCount = 105 / 5  + 0   -> 21 Page
		}
		
		int startNavi = ((currentPage-1) / naviCountPerPage) * naviCountPerPage +1;
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		
		
		StringBuilder sb = new StringBuilder();
		
		
		
		
		if(startNavi!=1)
		{
			
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllMember.ad?currentPage="+(startNavi-1)+"' aria-label='Previous'>" + 
					"<span aria-hidden='true'>&laquo;</span></a></li>");
		}	
		
		
		for(int i=startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllMember.ad?currentPage="+i+"'><b>"+i+"</b></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllMember.ad?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		//만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount)
		{
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllMember.ad?currentPage="+(endNavi+1)+"' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>"+ 
					"</a></li>");
		}
		
		
		
		return sb.toString();
		
		
		
	}
	
	
	public int totalCount(Connection conn){
		
		int totalCount=0 ;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = "select count(*) as totalcount from Member";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				totalCount = rset.getInt("totalcount");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
			
		}
		

		return totalCount;
		
	}

	public int withdrawMember(Connection conn, String memberNo) {
		int result =0;
		PreparedStatement pstmt = null;
		String query = "update member set end_yn='Y', end_date=sysdate where member_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		
		
		return result;
	}

	public int restoreMember(Connection conn, String memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set end_yn='N', end_date=null where member_no=?";
		//endDate 업데이트 하는 쿼리.
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	
	
}
