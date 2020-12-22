package rw.admin.inquiry.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.inquiry.model.vo.Inquiry;

public class InquiryDAO {

	public ArrayList<Inquiry> selectAll(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();

		String query = "select *"
				+ "from (select row_number() over (order by inquiry_no desc) as row_num, inquiry.* from inquiry) "
				+ "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {

				Inquiry i = new Inquiry();
				i.setInquiryNo(rset.getInt("inquiry_no"));
				i.setMemberId(rset.getString("member_id"));
				i.setReplyEmail(rset.getString("reply_email"));
				i.setInquiryTitle(rset.getString("inquiry_title"));
				i.setInquiryCont(rset.getString("inquiry_cont"));
				i.setInquiryDate(rset.getDate("inquiry_date"));
				i.setCategory(rset.getString("category"));
				i.setReplyYN(rset.getString("reply_yn").charAt(0));
				i.setDelYN(rset.getString("del_yn").charAt(0));
				list.add(i);
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

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {

		int totalCount = totalCount(conn);

		int pageTotalCount; // 전체 페이지를 저장하는 변수
		if (totalCount % recordCountPerPage > 0) {
			pageTotalCount = totalCount / recordCountPerPage + 1;
			// ex) pageTotalCount = 108 / 5 + 1 -> 22 Page

		} else {
			pageTotalCount = totalCount / recordCountPerPage + 0;
			// ex) pageTotalCount = 105 / 5 + 0 -> 21 Page
		}

		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		StringBuilder sb = new StringBuilder();

		if (startNavi != 1) {

			sb.append(
					"<li class='page-item'><a class='page-link' href='/inquirySelect.ad?currentPage=" + (startNavi - 1)
							+ "' aria-label='Previous'>" + "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/inquirySelect.ad?currentPage=" + i
						+ "'><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/inquirySelect.ad?currentPage=" + i + "'>"
						+ i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/inquirySelect.ad?currentPage=" + (endNavi + 1)
					+ "' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>" + "</a></li>");
		}
		return sb.toString();
	}

	public int totalCount(Connection conn) {
		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select count(*) as totalcount from Inquiry";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt("totalcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return totalCount;
	}

	public Inquiry selectOne(Connection conn, int inquiryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquiry inquiry = null;

		String query = "SELECT * FROM inquiry WHERE inquiry_No=? AND DEL_YN='N'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				inquiry = new Inquiry();
				inquiry.setInquiryNo(rset.getInt("inquiry_No"));
				inquiry.setMemberId(rset.getString("member_Id"));
				inquiry.setReplyEmail(rset.getString("reply_Email"));
				inquiry.setInquiryTitle(rset.getString("inquiry_Title"));
				inquiry.setInquiryCont(rset.getString("inquiry_Cont"));
				inquiry.setInquiryDate(rset.getDate("inquiry_Date"));
				inquiry.setCategory(rset.getString("category"));
				inquiry.setReplyYN(rset.getString("reply_YN").charAt(0));
				inquiry.setDelYN(rset.getString("del_YN").charAt(0));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return inquiry;

	}

	public int deleteInquiry(Connection conn, int inquiryNo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update inquiry set del_yn='Y' where inquiry_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);

		}

		return result;
	}

	public int restoreInquiry(Connection conn, int inquiryNo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update inquiry set del_yn='N' where inquiry_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);

		}

		return result;
	}

	public int deleteInquiryList(Connection conn, String inquiryNoArr) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update inquiry set del_yn='Y' where " + inquiryNoArr;

		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);

		}
		return result;
	}

	public int update(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int update = 0;
		
		String query = "UPDATE INQUIRY SET REPLY_YN='Y' WHERE REPLY_EMAIL=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			update = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return update;
	}

}
