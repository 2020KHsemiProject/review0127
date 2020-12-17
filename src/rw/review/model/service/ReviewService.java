
package rw.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.dao.ReviewDAO;
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

	
}

