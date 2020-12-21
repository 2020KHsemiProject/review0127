package rw.col.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.col.model.vo.ReviewCollection;
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

	public int deleteReview(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM REVIEW_COLLECTION WHERE MEMBER_NO=? AND REVIEW_ID=?";
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
	
	public ArrayList<ReviewCollection> selectColReview(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCollection> rColList = new ArrayList<ReviewCollection>();
		String query = "SELECT * FROM REVIEW_COLLECTION WHERE MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewCollection rCol = new ReviewCollection();
				rCol.setColReviewId(rset.getInt("COL_REVIEW_ID"));
				rCol.setMemberNo(rset.getString("MEMBER_NO"));
				rCol.setReviewId(rset.getString("REVIEW_ID"));
				rColList.add(rCol);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rColList;
	}

}
