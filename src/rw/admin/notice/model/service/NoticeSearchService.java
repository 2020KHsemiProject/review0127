package rw.admin.notice.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.notice.model.dao.NoticeSearchDAO;
import rw.common.JDBCTemplate;
import rw.notice.model.vo.Notice;
import rw.notice.model.vo.NoticeList;

public class NoticeSearchService {
	
	
	

	public NoticeList searchNotice(int currentPage, Date dateFrom, Date dateTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<Notice> list = new NoticeSearchDAO().searchNotice(conn,currentPage,recordCountPerPage,dateFrom,dateTill);

		int naviCountPerPage = 3;
		
		String pageNavi = new NoticeSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill);
		
		
		NoticeList nl = new NoticeList();
		nl.setList(list);
		nl.setPageNavi(pageNavi);
		
		
		return nl;
	}

	public NoticeList searchNotice(int currentPage, String category, String keyword, Date dateFrom, Date dateTill) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		
		ArrayList<Notice> list = new NoticeSearchDAO().searchNotice(conn,currentPage,recordCountPerPage,dateFrom,dateTill,keyword,category);

		int naviCountPerPage = 3;
		
		String pageNavi = new NoticeSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill,keyword,category);
		
		
		NoticeList nl = new NoticeList();
		nl.setList(list);
		nl.setPageNavi(pageNavi);
		
		
		return nl;
	}

}
