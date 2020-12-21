package rw.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rw.common.JDBCTemplate;
import rw.notice.model.vo.Notice;

public class NoticeDAO {

	public Notice selectOne(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;

		String query = "SELECT * FROM notice WHERE notice_No=? AND DEL_YN='N'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeCont(rset.getString("notice_cont"));
				notice.setNoticeDate(rset.getDate("notice_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return notice;

	}

}
