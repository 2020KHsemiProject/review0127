package rw.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.vo.Book;
import rw.review.model.vo.BookReview;

public class BookDAO {

	public int insertBook(Connection conn, Book book) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO BOOK VALUES(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, book.getBookId());
			pstmt.setString(2, book.getBookTitle());
			pstmt.setString(3, book.getBookAuthor());
			pstmt.setString(4, book.getBookImage());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public boolean existsBookId(Connection conn, String bookId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = "SELECT 1 FROM BOOK WHERE BOOK_ID = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<BookReview> selectReviewList(Connection conn, String bookId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BookReview> list = new ArrayList<BookReview>();
		
		String query = "SELECT * FROM REVIEW JOIN (SELECT MEMBER_NO, NICKNAME, PROFILE_IMG FROM MEMBER WHERE MEMBER_NO IN " + 
				"(SELECT MEMBER_NO FROM REVIEW WHERE BOOK_ID = ?)) USING(MEMBER_NO) WHERE DEL_YN='N' AND BOOK_ID =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookId);
			pstmt.setString(2, bookId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BookReview br = new BookReview();
				br.setBookId(rset.getString("book_Id"));
				br.setMemberNo(rset.getString("member_no"));
				br.setDelYn(rset.getString("del_yn").charAt(0));
				br.setNickname(rset.getString("nickname"));
				br.setProfileImg(rset.getString("profile_img"));
				br.setReviewCont(rset.getString("review_cont"));
				br.setReviewDate(rset.getDate("review_date"));
				br.setReviewId(rset.getString("review_id"));
				br.setReviewRate(rset.getInt("review_rate"));
				
				list.add(br);
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

	public double getReviewRateAvg(Connection conn, String bookId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		double avg = 0; 
		
		String query = "SELECT AVG(REVIEW_RATE) AS AVERAGE FROM REVIEW GROUP BY BOOK_ID, DEL_YN HAVING BOOK_ID = ? AND DEL_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				avg = rset.getDouble("average");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return avg;
	}

}
