package rw.customer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.customer.model.dao.CustomerDAO;
import rw.faq.model.vo.FAQ;
import rw.notice.model.vo.Notice;

public class CustomerService {

	public ArrayList<Notice> selectNotice() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> list = new CustomerDAO().selectNotice(conn);
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<FAQ> selectFAQ(int end) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<FAQ> list = new CustomerDAO().selectFAQ(conn, end);
		
		JDBCTemplate.close(conn);

		return list;
	}

}