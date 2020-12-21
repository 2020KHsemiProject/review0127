package rw.admin.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.admin.review.model.dao.ReviewDAO;
import rw.common.JDBCTemplate;
import rw.review.model.vo.ReviewAdmin;
import rw.review.model.vo.ReviewList;

public class ReviewService {
	
	
	ReviewDAO rDAO = new ReviewDAO();

	public ReviewList selectAll(int currentPage) {
		
		
		
		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 5;
		
		
		ArrayList<ReviewAdmin> list = rDAO.selectAll(conn, currentPage, recordCountPerPage);
		
		
		int naviCountPerPage = 3;
		
		String pageNavi = rDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		
		ReviewList rl = new ReviewList();
		rl.setList(list);
		rl.setPageNavi(pageNavi);		
				
		
		JDBCTemplate.close(conn);
		
		
		return rl;
	}

	public int deleteReview(String reviewId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = rDAO.deleteReview(conn, reviewId);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int restoreReview(String reviewId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = rDAO.restoreReview(conn, reviewId);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public int deleteReviewList(String reviewIdArr) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = rDAO.deleteReviewList(conn, reviewIdArr);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

}
