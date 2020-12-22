package rw.customer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.faq.model.vo.FAQ;
import rw.member.model.vo.Member;
import rw.notice.model.vo.Notice;

public class CustomerDAO {

	public ArrayList<FAQ> selectFAQ(Connection conn, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> list = new ArrayList<FAQ>();

		String query = "select * from (select row_number() over (order by faq_no asc) as row_num, faq.* from faq) where row_num between 1 and ?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, end);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {

				FAQ faq = new FAQ();
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqCont(rset.getString("faq_cont"));
				faq.setFaqDate(rset.getDate("faq_date"));

				list.add(faq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Notice> selectNotice(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();

		String query = "select * from (select row_number() over (order by notice_no asc) as row_num, notice.* from notice)"
				+ "where row_num between 1 and 5";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			while (rset.next()) {

				Notice n = new Notice();
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeNo(rset.getInt("notice_no"));

				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}