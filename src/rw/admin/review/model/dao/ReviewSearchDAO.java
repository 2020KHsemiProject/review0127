package rw.admin.review.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.review.model.vo.ReviewAdmin;

public class ReviewSearchDAO {
	
	public ArrayList<ReviewAdmin> searchReview(Connection conn, int currentPage, int recordCountPerPage, Date dateFrom,
			Date dateTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewAdmin> list = new ArrayList<ReviewAdmin>();

		String query = "WITH admin_review AS (select * from (select * from review join book using (book_id)) join member using (member_no))" +
				"select * " + "from (select row_number() over ( order by to_number(substr(review_id,2)) desc )"
				+ "as row_num, admin_review.* from admin_review where ( review_date between ? and ? ))"
				+ "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, dateFrom);
			pstmt.setDate(2, dateTill);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				ReviewAdmin ra = new ReviewAdmin();
				ra.setReviewId(rset.getString("review_id"));
				ra.setBookImage(rset.getString("book_image"));
				ra.setBookTitle(rset.getString("book_title"));
				ra.setNickName(rset.getString("nickname"));
				ra.setMemberId(rset.getString("member_id"));
				ra.setReviewRate(rset.getInt("review_rate"));
				ra.setReviewCont(rset.getString("review_cont"));
				ra.setReviewDate(rset.getDate("review_date"));
				ra.setReviewCount(rset.getInt("review_count"));
				ra.setDelYN(rset.getString("del_yn").charAt(0));
				
				list.add(ra);

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

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			Date dateFrom, Date dateTill) {

		int totalCount = totalCount(conn, dateFrom, dateTill);

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

			sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + (startNavi - 1)
					+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString()
					+ "&category=&keyword='' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + i
						+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString()
						+ "&category=&keyword='><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + i
						+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString()
						+ "&category=&keyword='>" + i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + (endNavi + 1)
					+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString()
					+ "&category=&keyword='' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>"
					+ "</a></li>");
		}

		return sb.toString();

	}

	public int totalCount(Connection conn, Date dateFrom, Date dateTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "WITH admin_review AS (select * from (select * from review join book using (book_id)) join member using (member_no))" +
				"select count(*) as totalCount from admin_review where (review_date between ? and ?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, dateFrom);
			pstmt.setDate(2, dateTill);

			rset = pstmt.executeQuery();
			rset.next();

			totalCount = rset.getInt("totalCount");
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return totalCount;

	}

	public ArrayList<ReviewAdmin> searchReview(Connection conn, int currentPage, int recordCountPerPage, Date dateFrom,
			Date dateTill, String keyword, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewAdmin> list = new ArrayList<ReviewAdmin>();

		String query = "WITH admin_review AS (select * from (select * from review join book using (book_id)) join member using (member_no))" +
				"select * " + "from (select row_number() over ( order by to_number(substr(review_id,2)) desc )"
				+ "as row_num, admin_review.* from admin_review where ( review_date between ? and ? ) and ( " + category + " like ? ))"
				+ "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, dateFrom);
			pstmt.setDate(2, dateTill);
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				ReviewAdmin ra = new ReviewAdmin();
				ra.setReviewId(rset.getString("review_id"));
				ra.setBookImage(rset.getString("book_image"));
				ra.setBookTitle(rset.getString("book_title"));
				ra.setNickName(rset.getString("nickname"));
				ra.setMemberId(rset.getString("member_id"));
				ra.setReviewRate(rset.getInt("review_rate"));
				ra.setReviewCont(rset.getString("review_cont"));
				ra.setReviewDate(rset.getDate("review_date"));
				ra.setReviewCount(rset.getInt("review_count"));
				ra.setDelYN(rset.getString("del_yn").charAt(0));
				
				list.add(ra);

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

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
			Date dateFrom, Date dateTill, String keyword, String category) {

		int totalCount = totalCount(conn, dateFrom, dateTill, keyword, category);

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

			sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + (startNavi - 1)
					+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString() + "&category="
					+ category + "&keyword=" + keyword + "'' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + i
						+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString() + "&category="
						+ category + "&keyword=" + keyword + "'><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + i
						+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString() + "&category="
						+ category + "&keyword=" + keyword + "'>" + i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchReview.ad?currentPage=" + (endNavi + 1)
					+ "&dateFrom=" + dateFrom.toString() + "&dateTill=" + dateTill.toString() + "&category=" + category
					+ "&keyword='" + keyword + "' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>");
		}

		return sb.toString();
	}

	public int totalCount(Connection conn, Date dateFrom, Date dateTill, String keyword, String category) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "WITH admin_review AS (select * from (select * from review join book using (book_id)) join member using (member_no))" +
				"select count(*) as totalCount from admin_review where (review_date between ? and ?) and ( "+category+ " like ? )";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, dateFrom);
			pstmt.setDate(2, dateTill);
			pstmt.setString(3, "%" + keyword + "%");

			rset = pstmt.executeQuery();
			rset.next();

			totalCount = rset.getInt("totalCount");
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return totalCount;
	}

}
