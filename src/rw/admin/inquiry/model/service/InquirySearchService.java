package rw.admin.inquiry.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.inquiry.model.dao.InquirySearchDAO;
import rw.admin.notice.model.dao.NoticeSearchDAO;
import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;
import rw.inquiry.model.vo.InquiryList;
import rw.notice.model.vo.NoticeList;

public class InquirySearchService {
	
	
	

	public InquiryList searchInquiry(int currentPage, Date dateFrom, Date dateTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<Inquiry> list = new InquirySearchDAO().searchInquiry(conn,currentPage,recordCountPerPage,dateFrom,dateTill);

		int naviCountPerPage = 3;
		
		String pageNavi = new InquirySearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill);
		
		
		InquiryList il = new InquiryList();
		il.setList(list);
		il.setPageNavi(pageNavi);
		
		
		return il;
	}

	public InquiryList searchInquiry(int currentPage, String category, String keyword, Date dateFrom, Date dateTill) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<Inquiry> list = new InquirySearchDAO().searchInquiry(conn,currentPage,recordCountPerPage,dateFrom,dateTill,keyword,category);

		int naviCountPerPage = 3;
		
		String pageNavi = new InquirySearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill,keyword,category);
		
		
		InquiryList il = new InquiryList();
		il.setList(list);
		il.setPageNavi(pageNavi);
		
		
		return il;
	}

}
