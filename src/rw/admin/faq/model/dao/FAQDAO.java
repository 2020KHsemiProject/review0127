package rw.admin.faq.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;

public class FAQDAO {

	public ArrayList<FAQ> selectAll(Connection conn, int currentPage, int recordCountPerPage) {
		

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> list = new ArrayList<FAQ>();
		
		String query = "select *"
				+ "from (select row_number() over (order by faq_no desc) as row_num, faq.* from faq ) "
				+ "where row_num between ? and ?";
		
		
		int start =  currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqDate(rset.getDate("faq_date"));
				f.setFaqCont(rset.getString("faq_cont"));
				f.setDelYN(rset.getString("del_yn").charAt(0));
				
				list.add(f);
			
				
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
			
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllFAQ.ad?currentPage="+(startNavi-1)+"' aria-label='Previous'>" + 
					"<span aria-hidden='true'>&laquo;</span></a></li>");
		}	
		
		
		for(int i=startNavi; i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllFAQ.ad?currentPage="+i+"'><b>"+i+"</b></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/selectAllFAQ.ad?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		//만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount)
		{
			sb.append("<li class='page-item'><a class='page-link' href='/selectAllFAQ.ad?currentPage="+(endNavi+1)+"' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>"+ 
					"</a></li>");
		}
		
		
		
		return sb.toString();
	}
	
	
	
	public int totalCount(Connection conn){
		
		int totalCount=0 ;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = "select count(*) as totalcount from faq";
		
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
	
	public int deleteFAQ(Connection conn, int faqNo) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update faq set del_yn='Y' where faq_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}

	
	
	
	public int restoreFAQ(Connection conn, int faqNo) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update faq set del_yn='N' where faq_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}

	public int deleteFAQList(Connection conn, String faqNoArr) {
		
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update faq set del_yn='Y' where "+faqNoArr;
		
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

	public int updateFAQ(Connection conn, String faqTitle, String faqCont, int faqNo) {
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = "update faq set faq_title = ? , faq_cont = ? where faq_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			
			pstmt.setString(1, faqTitle);
			pstmt.setString(2, faqCont);
			pstmt.setInt(3, faqNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		

		return result;
	}
	
	public int insertFAQ(Connection conn, String title, String content) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO FAQ VALUES(faq_seq.NEXTVAL, ?, SYSDATE, ?, 'N')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);

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
