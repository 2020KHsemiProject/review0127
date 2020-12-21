package rw.admin.notice.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.notice.model.vo.Notice;
import rw.notice.model.vo.NoticeList;

public class NoticeDAO {

	public ArrayList<Notice> selectAll(Connection conn, int currentPage, int recordCountPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = "select *"
				+ "from (select row_number() over (order by notice_no desc) as row_num, notice.* from notice ) "
				+ "where row_num between ? and ?";
		
		
		int start =  currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeCont(rset.getString("notice_cont"));
				n.setDelYN(rset.getString("del_yn").charAt(0));
				
				list.add(n);
			
				
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
			
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllNotice.ad?currentPage="+(startNavi-1)+"' aria-label='Previous'>" + 
					"<span aria-hidden='true'>&laquo;</span></a></li>");
		}	
		
		
		for(int i=startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllNotice.ad?currentPage="+i+"'><b>"+i+"</b></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllNotice.ad?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		//만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount)
		{
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllNotice.ad?currentPage="+(endNavi+1)+"' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>"+ 
					"</a></li>");
		}
		
		
		
		return sb.toString();
	}
	
	
	
	public int totalCount(Connection conn){
		
		int totalCount=0 ;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = "select count(*) as totalcount from notice";
		
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

	public int deleteNotice(Connection conn, int noticeNo) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update notice set del_yn='Y' where notice_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}

	
	
	
	public int restoreNotice(Connection conn, int noticeNo) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update notice set del_yn='N' where notice_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}

	public int deleteNoticeList(Connection conn, String noticeNoArr) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update notice set del_yn='Y' where "+noticeNoArr;
		
		try {
			pstmt =conn.prepareStatement(query);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}

	public int updateNotice(Connection conn, String noticeTitle, String noticeCont, int noticeNo) {
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update notice set notice_title = ? , notice_cont = ? where notice_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeCont);
			pstmt.setInt(3, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}
	
	public int insertNotice(Connection conn, String title, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO NOTICE VALUES(notice_seq.NEXTVAL, ?, SYSDATE, ?, 'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
