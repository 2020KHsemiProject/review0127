package rw.inquiry.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.inquiry.model.dao.InquiryDAO;
import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;
import rw.inquiry.model.vo.InquiryList;

public class InquiryService {
	InquiryDAO iDAO = new InquiryDAO();

	public int insertInquiry(String memberId, String category, String email, String title, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = iDAO.insertInquiry(conn, memberId, category, email, title, content);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}