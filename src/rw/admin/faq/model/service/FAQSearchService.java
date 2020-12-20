package rw.admin.faq.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.faq.model.dao.FAQSearchDAO;
import rw.admin.notice.model.dao.NoticeSearchDAO;
import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;
import rw.faq.model.vo.FAQList;
import rw.notice.model.vo.Notice;
import rw.notice.model.vo.NoticeList;

public class FAQSearchService {
	
	
	public FAQList searchFAQ(int currentPage, Date dateFrom, Date dateTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<FAQ> list = new FAQSearchDAO().searchFAQ(conn,currentPage,recordCountPerPage,dateFrom,dateTill);

		int naviCountPerPage = 3;
		
		String pageNavi = new FAQSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill);
		
		
		FAQList fl = new FAQList();
		fl.setList(list);
		fl.setPageNavi(pageNavi);
		
		
		return fl;
	}

	public FAQList searchFAQ(int currentPage, String category, String keyword, Date dateFrom, Date dateTill) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<FAQ> list = new FAQSearchDAO().searchFAQ(conn,currentPage,recordCountPerPage,dateFrom,dateTill,keyword,category);

		int naviCountPerPage = 3;
		
		String pageNavi = new FAQSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill,keyword,category);
		
		
		FAQList nl = new FAQList();
		nl.setList(list);
		nl.setPageNavi(pageNavi);
		
		
		return nl;
	}

}
