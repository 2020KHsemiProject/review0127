package rw.col.model.service;

import java.sql.Connection;

import rw.col.model.dao.CollectionDAO;
import rw.common.JDBCTemplate;

public class CollectionService {
	CollectionDAO cDAO = new CollectionDAO();
	public int insertReview(String memberNo, String reviewId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.insertReview(conn,memberNo,reviewId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
