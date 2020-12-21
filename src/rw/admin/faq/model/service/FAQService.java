package rw.admin.faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.admin.faq.model.dao.FAQDAO;
import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;
import rw.faq.model.vo.FAQList;

public class FAQService {

	FAQDAO fDAO = new FAQDAO();
	
	
	public int insertFAQ(String title, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = fDAO.insertFAQ(conn, title, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public FAQList selectAll(int currentPage) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 10;
		
		ArrayList <FAQ> list = fDAO.selectAll(conn, currentPage, recordCountPerPage);
		
		int naviCountPerPage = 3;
		
		String pageNavi = fDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		
		FAQList nl = new FAQList();
		nl.setList(list);
		nl.setPageNavi(pageNavi);
		
		
		JDBCTemplate.close(conn);
		

		return nl;
		
	}


	public int deleteFAQ(int faqNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = fDAO.deleteFAQ(conn,faqNo);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	public int restoreFAQ(int faqNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = fDAO.restoreFAQ(conn,faqNo);
		
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public int deleteFAQList(String faqNoArr) {
		

		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = fDAO.deleteFAQList(conn,faqNoArr);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}


	public int updateFAQ(String faqCont, String faqTitle, int faqNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = fDAO.updateFAQ(conn, faqTitle, faqCont, faqNo);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}



}
