package rw.notice.model.service;

import java.sql.Connection;

import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;
import rw.notice.model.dao.NoticeDAO;
import rw.notice.model.vo.Notice;

public class NoticeService {
	NoticeDAO nDAO = new NoticeDAO();
	
	public Notice selectOne(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice notice = nDAO.selectOne(conn, noticeNo);
		JDBCTemplate.close(conn);
		return notice;
	}

}
