package rw.customer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.faq.model.vo.FAQ;
import rw.common.JDBCTemplate;
import rw.customer.model.dao.CustomerDAO;
import rw.notice.model.vo.Notice;

public class CostomerService {

	public ArrayList<Notice> selectNotice() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> list = new CustomerDAO().selectNotice(conn);
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<FAQ> selectFAQ() {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<FAQ> list = new CustomerDAO().selectFAQ(conn);

		JDBCTemplate.close(conn);

		return list;
	}

}
