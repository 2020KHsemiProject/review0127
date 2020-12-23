
package rw.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.vo.BookReview;
import rw.review.model.vo.Review;
import rw.review.model.vo.ReviewCard;
import rw.review.model.vo.ReviewLike;
import rw.review.model.vo.ReviewList;

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
			while (rset.next()) {
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
		} finally {
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
			pstmt.setInt(1, rw.getReviewRate());
			pstmt.setString(2, rw.getReviewCont());
			pstmt.setString(3, rw.getBookId());
			pstmt.setString(4, rw.getMemberNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ReviewCard selectOneReviewCard(Connection conn, String reviewId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReviewCard rc = null;
		String query = "SELECT * FROM REVIEW JOIN BOOK USING(BOOK_ID) JOIN MEMBER " + 
				"USING(MEMBER_NO) WHERE REVIEW_ID = ? AND DEL_YN = 'N'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				rc = new ReviewCard();
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

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rc;
	}

	public int selectOneReviewLike(Connection conn, String reviewId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = "SELECT COUNT(LIKE_YN) AS LIKE_COUNT FROM REVIEW_LIKE GROUP BY REVIEW_ID, LIKE_YN " + 
				"HAVING REVIEW_ID = ? AND LIKE_YN ='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("like_count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}

	public int deleteReview(Connection conn, String reviewId, String memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE REVIEW SET DEL_YN ='Y' WHERE REVIEW_ID=? AND MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public BookReview selectOneBookReview(Connection conn, String reviewId, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BookReview br = null;
		
		String query = "SELECT * FROM REVIEW JOIN (SELECT MEMBER_NO, MEMBER_ID, NICKNAME, PROFILE_IMG FROM MEMBER) " + 
				"USING(MEMBER_NO) WHERE REVIEW_ID=? AND MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				br = new BookReview();
				br.setBookId(rset.getString("book_Id"));
				br.setMemberNo(rset.getString("member_no"));
				br.setMemberId(rset.getString("member_id"));
				br.setDelYn(rset.getString("del_yn").charAt(0));
				br.setNickname(rset.getString("nickname"));
				br.setProfileImg(rset.getString("profile_img"));
				br.setReviewCont(rset.getString("review_cont"));
				br.setReviewDate(rset.getDate("review_date"));
				br.setReviewId(rset.getString("review_id"));
				br.setReviewRate(rset.getInt("review_rate"));
				br.setReviewCount(rset.getInt("review_count"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return br;
	}

	public int updateReview(Connection conn, String memberNo, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE REVIEW SET REVIEW_RATE = ?, REVIEW_CONT = ? WHERE REVIEW_ID =? AND MEMBER_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getReviewRate());
			pstmt.setString(2, r.getReviewCont());
			pstmt.setString(3, r.getReviewId());
			pstmt.setString(4, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public char existsReviewLike(Connection conn, String reviewId, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		char result = 'F'; //null값인 경우의 반환값
		String query = "SELECT * FROM REVIEW_LIKE WHERE REVIEW_ID = ? AND MEMBER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getString("like_yn").charAt(0);
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

	public int insertReviewLike(Connection conn, String reviewId, String memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO REVIEW_LIKE VALUES(REVIEW_LIKE_SEQ.NEXTVAL, 'Y', ?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateReviewLike(Connection conn, char resultYN, String reviewId, String memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE REVIEW_LIKE SET LIKE_YN = ? WHERE REVIEW_ID =? AND MEMBER_NO =?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, Character.toString(resultYN));
				pstmt.setString(2, reviewId);
				pstmt.setString(3, memberNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
	}

	public ArrayList<ReviewCard> selectBestReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCard> list = new ArrayList<ReviewCard>();
		
		String query = "SELECT * FROM REVIEW JOIN MEMBER USING(MEMBER_NO) JOIN BOOK USING(BOOK_ID) WHERE REVIEW_ID IN " + 
				"(SELECT REVIEW_ID FROM (SELECT REVIEW_ID, COUNT(LIKE_YN) TOTAL FROM REVIEW_LIKE " + 
				"JOIN REVIEW USING(REVIEW_ID) GROUP BY REVIEW_ID, DEL_YN, LIKE_YN  " + 
				"HAVING DEL_YN = 'N' AND LIKE_YN = 'Y' ORDER BY 2 DESC) WHERE ROWNUM <=6)";
		
		try {
			pstmt = conn.prepareStatement(query);
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

				rc.setMemberId(rset.getString("MEMBER_ID"));
				rc.setNickname(rset.getString("NICKNAME"));
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

	public int addViewCount(Connection conn, String reviewId, int reviewCount) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE REVIEW SET REVIEW_COUNT = ? WHERE REVIEW_ID = ?"; 
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewCount);
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

	public char selectMyReviewLike(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		char likeYN = 'N';
		
		String query = "SELECT LIKE_YN FROM REVIEW_LIKE WHERE REVIEW_ID =? AND MEMBER_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				likeYN = rset.getString(1).charAt(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return likeYN;
	}
	
	public int countReviewLikePoint(Connection conn, String reviewId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM REVIEW_LIKE WHERE REVIEW_ID=? AND LIKE_YN='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}

	public ArrayList<ReviewLike> myReviewLikeList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewLike> rLikeList = new ArrayList<ReviewLike>();
		String query = "SELECT * FROM REVIEW_LIKE WHERE MEMBER_NO=? AND LIKE_YN='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewLike rLike = new ReviewLike();
				rLike.setLikeId(rset.getInt("LIKE_ID"));
				rLike.setLikeYN(rset.getString("LIKE_YN").charAt(0));
				rLike.setReviewId(rset.getString("REVIEW_ID"));
				rLike.setMemberNo(rset.getString("MEMBER_NO"));
				rLikeList.add(rLike);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rLikeList;
	}

}
