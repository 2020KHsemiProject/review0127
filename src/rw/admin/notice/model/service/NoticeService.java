package rw.admin.notice.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import rw.admin.notice.model.dao.NoticeDAO;
import rw.common.JDBCTemplate;
import rw.notice.model.vo.Notice;
import rw.notice.model.vo.NoticeList;

public class NoticeService {

	
	NoticeDAO nDAO = new NoticeDAO();
	

	public NoticeList selectAll(int currentPage) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int recordCountPerPage = 10;
		
		ArrayList <Notice> list = nDAO.selectAll(conn, currentPage, recordCountPerPage);
		
		int naviCountPerPage = 3;
		
		String pageNavi = nDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		
		NoticeList nl = new NoticeList();
		nl.setList(list);
		nl.setPageNavi(pageNavi);
		
		
		JDBCTemplate.close(conn);
		

		return nl;
		
	}


	public int deleteNotice(int noticeNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = nDAO.deleteNotice(conn,noticeNo);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	public int restoreNotice(int noticeNo) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = nDAO.restoreNotice(conn,noticeNo);
		
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public int deleteNoticeList(String noticeNoArr) {
		

		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = nDAO.deleteNoticeList(conn,noticeNoArr);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}


	public int updateNotice(String noticeCont, String noticeTitle, int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = nDAO.updateNotice(conn,noticeTitle, noticeCont, noticeNo);
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public int insertNotice(String title, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = nDAO.insertNotice(conn, title, content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

}
