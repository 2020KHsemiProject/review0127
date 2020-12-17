package rw.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.dao.BookDAO;
import rw.review.model.vo.Book;
import rw.review.model.vo.BookReview;

public class BookService {
	BookDAO bDAO = new BookDAO();
	
	public int insertBook(Book book) {
		Connection conn = JDBCTemplate.getConnection();
		int result = bDAO.insertBook(conn,book);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean existsBookId(String bookId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = bDAO.existsBookId(conn,bookId);
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<BookReview> selectReviewList(String bookId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BookReview> list = bDAO.selectReviewList(conn,bookId);
		JDBCTemplate.close(conn);
		return list;
	}

	public double getReviewRateAvg(String bookId) {
		Connection conn = JDBCTemplate.getConnection();
		double average = bDAO.getReviewRateAvg(conn,bookId);
		JDBCTemplate.close(conn);
		return average;
	}

}
