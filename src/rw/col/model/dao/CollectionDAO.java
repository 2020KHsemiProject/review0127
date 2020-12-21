package rw.col.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import rw.common.JDBCTemplate;

public class CollectionDAO {

	public int insertReview(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0; 
		String query = "INSERT INTO REVIEW_COLLECTION VALUES (REVIEW_COLLECTION_SEQ.NEXTVAL,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, reviewId);
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
