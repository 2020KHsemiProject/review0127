
package rw.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.dao.ReviewDAO;
import rw.review.model.vo.BookReview;
import rw.review.model.vo.Review;
import rw.review.model.vo.ReviewCard;

public class ReviewService {
	ReviewDAO rDAO = new ReviewDAO();
	public ArrayList<ReviewCard> selectAllReview(int end) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewCard> list = rDAO.selectAllReview(conn,end);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertReview(Review rw) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.insertReview(conn,rw);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ReviewCard selectOneReviewCard(String reviewId) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewCard rc = rDAO.selectOneReviewCard(conn,reviewId);
		JDBCTemplate.close(conn);
		return rc;
	}

	public int selectOneReviewLike(String reviewId) {
		Connection conn = JDBCTemplate.getConnection();
		int count = rDAO.selectOneReviewLike(conn,reviewId);
		JDBCTemplate.close(conn);
		return count;
	}

	public int deleteReview(String reviewId, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.deleteReview(conn, reviewId,memberNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BookReview selectOneBookReview(String reviewId, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookReview br = rDAO.selectOneBookReview(conn,reviewId,memberNo);
		JDBCTemplate.close(conn);
		return br;
	}

	public int updateReview(String memberNo, Review r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.updateReview(conn,memberNo,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public char existsReviewLike(String reviewId, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		char result = rDAO.existsReviewLike(conn,reviewId, memberNo);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertReviewLike(String reviewId, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.insertReviewLike(conn,reviewId,memberNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReviewLike(char resultYN, String reviewId, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.updateReviewLike(conn,resultYN,reviewId,memberNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<ReviewCard> selectBestReview() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewCard> list = rDAO.selectBestReview(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int addViewCount(String reviewId, int reviewCount) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.addViewCount(conn, reviewId, reviewCount);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public char selectMyReviewLike(String memberNo, String reviewId) {
		//해당 멤버의 좋아요 여부 (YN)
		Connection conn = JDBCTemplate.getConnection();
		char likeYN = rDAO.selectMyReviewLike(conn,memberNo, reviewId);
		JDBCTemplate.close(conn);
		return likeYN;
	}

	
}

