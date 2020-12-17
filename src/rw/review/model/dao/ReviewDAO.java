package rw.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import rw.common.JDBCTemplate;
import rw.review.model.vo.Review;

public class ReviewDAO {

	public int insertReview(Connection conn, Review rw) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO REVIEW VALUES('R'||REVIEW_SEQ.NEXTVAL,SYSDATE,0,?,?,?,?,'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,rw.getReviewRate());
			pstmt.setString(2,rw.getReviewCont());
			pstmt.setString(3,rw.getBookId());
			pstmt.setString(4,rw.getMemberNo());
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
