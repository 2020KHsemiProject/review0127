package rw.admin.main.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;
import rw.inquiry.model.vo.Inquiry;
import rw.notice.model.vo.Notice;
import rw.review.model.vo.ReviewAdmin;

public class MainDAO {

	public ArrayList<ReviewAdmin> selectReview(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewAdmin> list = new ArrayList<ReviewAdmin> ();
		
		String query =
				"WITH admin_review AS (select book_title, review_date, review_id from review join book using(book_id))" + 
				"select * from (select row_number() over (order by to_number(substr(review_id,2))desc) as row_num, "+ 
				"admin_review.* from admin_review)" + 
				"where row_num between 1 and 7";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				ReviewAdmin ra = new ReviewAdmin();
				ra.setBookTitle(rset.getString("book_title"));
				ra.setReviewDate(rset.getDate("review_date"));
				
				list.add(ra);
				
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

	public ArrayList<Inquiry> selectInquiry(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = new ArrayList<Inquiry> ();
		
		String query =
				"select * from (select row_number() over (order by inquiry_no desc) as row_num,"+
					" inquiry.* from inquiry) where row_num between 1 and 7";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				Inquiry i = new Inquiry();
				i.setInquiryTitle(rset.getString("inquiry_title"));
				i.setReplyYN(rset.getString("reply_yn").charAt(0));
				i.setInquiryDate(rset.getDate("inquiry_date"));
				
				
				list.add(i);
				
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

	public ArrayList<FAQ> selectFAQ(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> list = new ArrayList<FAQ> ();
		
		String query =
				"select * from (select row_number() over (order by faq_no desc) as row_num, faq.* from faq)"
				+ "where row_num between 1 and 7";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				FAQ faq = new FAQ();
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqDate(rset.getDate("faq_date"));
				
				
				list.add(faq);
			
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

	public ArrayList<Notice> selectNotice(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice> ();
		
		String query =
				"select * from (select row_number() over (order by notice_no desc) as row_num, notice.* from notice)"
				+ "where row_num between 1 and 7";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				Notice n = new Notice();
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeDate(rset.getDate("notice_date"));
				
				
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

}
