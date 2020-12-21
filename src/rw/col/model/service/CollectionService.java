package rw.col.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.col.model.dao.CollectionDAO;
import rw.col.model.vo.ReviewCollection;
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
	public int deleteReview(String memberNo, String reviewId) {
		Connection conn = JDBCTemplate.getConnection(); 
		int result = cDAO.deleteReview(conn,memberNo,reviewId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<ReviewCollection> selectColReview(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewCollection> rColList = cDAO.selectColReview(conn,memberNo);
		JDBCTemplate.close(conn);
		return rColList;
	}
}
