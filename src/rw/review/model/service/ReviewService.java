package rw.review.model.service;

import java.sql.Connection;

import rw.common.JDBCTemplate;
import rw.review.model.dao.ReviewDAO;
import rw.review.model.vo.Review;

public class ReviewService {
	ReviewDAO rDAO = new ReviewDAO();

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

	
}
