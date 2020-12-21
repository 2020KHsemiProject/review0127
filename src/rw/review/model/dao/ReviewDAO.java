
package rw.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.vo.Review;
import rw.review.model.vo.ReviewCard;

public class ReviewDAO {

	public ArrayList<ReviewCard> selectAllReview(Connection conn, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCard> list = new ArrayList<ReviewCard>();
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY REVIEW_ID DESC) AS ROW_NUM, RV.* FROM REVIEW RV) R LEFT JOIN MEMBER M ON (M.MEMBER_NO=R.MEMBER_NO) LEFT JOIN BOOK B ON (B.BOOK_ID=R.BOOK_ID) WHERE ROW_NUM BETWEEN 1 AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewCard rc = new ReviewCard();
				rc.setReviewId(rset.getString("REVIEW_ID"));
				rc.setReviewDate(rset.getDate("REVIEW_DATE"));
				rc.setReviewCount(rset.getInt("REVIEW_COUNT"));
				rc.setReviewRate(rset.getInt("REVIEW_RATE"));
				rc.setReviewCont(rset.getString("REVIEW_CONT"));
				rc.setBookId(rset.getNString("BOOK_ID"));
				rc.setMemberNo(rset.getString("MEMBER_NO"));
				rc.setDelYN(rset.getString("DEL_YN").charAt(0));
				
				rc.setMemberId(rset.getString("MEMBER_ID"));
				rc.setNickname(rset.getString("NICKNAME"));
				rc.setMemberPwd(rset.getString("MEMBER_PWD"));
				rc.setEmail(rset.getString("EMAIL"));				
				rc.setEmailYN(rset.getString("EMAIL_YN").charAt(0));
				rc.setBirthYear(rset.getInt("BIRTH_YEAR"));
				rc.setGender(rset.getString("GENDER").charAt(0));
				rc.setEnrollDate(rset.getDate("ENROLL_DATE"));
				rc.setEndYN(rset.getString("END_YN").charAt(0));
				rc.setEndDate(rset.getDate("END_DATE"));
				rc.setProfileImg(rset.getString("PROFILE_IMG"));
				
				rc.setBookTitle(rset.getString("BOOK_TITLE"));
				rc.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				rc.setBookImage(rset.getString("BOOK_IMAGE"));
				
				
				list.add(rc);
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

