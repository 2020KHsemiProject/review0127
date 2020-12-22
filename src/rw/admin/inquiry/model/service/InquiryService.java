package rw.admin.inquiry.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import rw.admin.inquiry.model.dao.InquiryDAO;
import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;
import rw.inquiry.model.vo.InquiryList;

public class InquiryService {
	InquiryDAO iDAO = new InquiryDAO();
	
	public InquiryList selectAll(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;

		ArrayList<Inquiry> list = iDAO.selectAll(conn, currentPage, recordCountPerPage);

		int naviCountPerPage = 3;
		String pageNavi = iDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);

		InquiryList il = new InquiryList();
		il.setList(list);
		il.setPageNavi(pageNavi);

		JDBCTemplate.close(conn);
		return il;
	}

	public Inquiry selectOne(int inquiryNo) {
		Connection conn = JDBCTemplate.getConnection();
		Inquiry inquiry = iDAO.selectOne(conn, inquiryNo);
		JDBCTemplate.close(conn);
		return inquiry;
	}
	
	
public int deleteInquiry(int inquiryNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = iDAO.deleteInquiry(conn,inquiryNo);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	public int restoreInquiry(int inquiryNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = iDAO.restoreInquiry(conn,inquiryNo);
		
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public int deleteInquiryList(String inquiryNoArr) {
		

		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = iDAO.deleteInquiryList(conn,inquiryNoArr);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

}