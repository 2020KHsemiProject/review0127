package rw.admin.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.vo.ReviewAdmin;

public class ReviewDAO {

	public ArrayList<ReviewAdmin> selectAll(Connection conn, int currentPage, int recordCountPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewAdmin> list = new ArrayList<ReviewAdmin>();
		
		int start =  currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		
		String query = "WITH admin_review AS (select * from (select * from review join book using (book_id)) join member using (member_no))" + 
				"select review_id, book_image, book_title, nickname, member_id, review_rate, review_count, review_date, review_cont, del_yn " + 
				"from (select row_number() over ( order by to_number(substr(review_id,2)) desc ) as row_num, admin_review.* from admin_review ) " + 
				"where row_num between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReviewAdmin ra = new ReviewAdmin();
				ra.setReviewId(rset.getString("review_id"));
				ra.setBookImage(rset.getString("book_image"));
				ra.setBookTitle(rset.getString("book_title"));
				ra.setNickName(rset.getString("nickname"));
				ra.setMemberId(rset.getString("member_id"));
				ra.setReviewRate(rset.getInt("review_rate"));
				ra.setReviewCont(rset.getString("review_cont"));
				ra.setReviewDate(rset.getDate("review_date"));
				ra.setReviewCount(rset.getInt("review_count"));
				ra.setDelYN(rset.getString("del_yn").charAt(0));
				
				list.add(ra);
				
				
			}
			
			
			System.out.println(list.size());
			
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
			
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllReview.ad?currentPage="+(startNavi-1)+"' aria-label='Previous'>" + 
					"<span aria-hidden='true'>&laquo;</span></a></li>");
		}	
		
		
		for(int i=startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllReview.ad?currentPage="+i+"'><b>"+i+"</b></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllReview.ad?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		//만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount)
		{
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllReview.ad?currentPage="+(endNavi+1)+"' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>"+ 
					"</a></li>");
		}
		
		
		
		return sb.toString();
	
	}
	
	
	
	public int totalCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		
		
		String query = "WITH admin_review AS "
				+ "(select * from (select * from review join book using (book_id)) join member using (member_no))"
				+"select count(*) as totalCount from admin_review";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			rset.next();
			totalCount = rset.getInt("totalCount");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		
		
		return totalCount;
		
	}

	public int deleteReview(Connection conn, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update review set del_yn='Y' where review_id = ?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}

		
		
		return result;
	}

	public int restoreReview(Connection conn, String reviewId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update review set del_yn='N' where review_id = ?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}

		
		
		return result;
		
		
		
	}

	public int deleteReviewList(Connection conn, String reviewIdArr) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update review set del_yn='Y' where "+reviewIdArr;
		
		try {
			pstmt=conn.prepareStatement(query);
			
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
