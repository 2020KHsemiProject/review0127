package rw.inquiry.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;

public class InquiryDAO {

	public int insertInquiry(Connection conn, String memberId, String category, String email, String title, String content) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO Inquiry VALUES(inquiry_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, 'N', 'N')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, email);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, category);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}