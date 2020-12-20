package rw.admin.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.admin.main.model.dao.MainDAO;
import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;
import rw.inquiry.model.vo.Inquiry;
import rw.notice.model.vo.Notice;
import rw.review.model.vo.ReviewAdmin;

public class MainService {

	public ArrayList<ReviewAdmin> selectReview() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewAdmin> list = new MainDAO().selectReview(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

	public ArrayList<Inquiry> selectInquiry() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Inquiry> list = new MainDAO().selectInquiry(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

	public ArrayList<Notice> selectNotice() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> list = new MainDAO().selectNotice(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

	public ArrayList<FAQ> selectFAQ() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FAQ> list = new MainDAO().selectFAQ(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

}
