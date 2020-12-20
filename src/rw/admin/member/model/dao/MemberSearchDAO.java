package rw.admin.member.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.member.model.vo.Member;

public class MemberSearchDAO {

	public ArrayList<Member> searchMember(Connection conn, int recordCountPerPage, int currentPage, Date enrollFrom,
			Date enrollTill, Date endFrom, Date endTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();

		String query = "select * " + "from (select row_number() over (order by member_no desc)"
				+ "as row_num, member.* from member where ( enroll_date between ? and ? ) and (end_date between ? and ?))"
				+ "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setDate(3, endFrom);
			pstmt.setDate(4, endTill);
			pstmt.setInt(5, start);
			pstmt.setInt(6, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				m.setBirthYear(rset.getInt("birth_year"));
				m.setEmail(rset.getString("email"));
				m.setEmailYN(rset.getString("email_yn").charAt(0));
				m.setGender(rset.getString("gender").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
				m.setEndDate(rset.getDate("end_date"));

				list.add(m);

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

	public ArrayList<Member> searchMember(Connection conn, int recordCountPerPage, String category, String keyword,
			int currentPage, Date enrollFrom, Date enrollTill, Date endFrom, Date endTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();

		String query = "select * " + "from (select row_number() over (order by member_no desc)"
				+ "as row_num, member.* from member where ( enroll_date between ? and ? ) and ( end_date between ? and ?)"
				+ " and  " + category + " like ? )" + "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setDate(3, endFrom);
			pstmt.setDate(4, endTill);
			// category는 쿼리에 바로 넣어줘야함
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setInt(6, start);
			pstmt.setInt(7, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				m.setBirthYear(rset.getInt("birth_year"));
				m.setEmail(rset.getString("email"));
				m.setEmailYN(rset.getString("email_yn").charAt(0));
				m.setGender(rset.getString("gender").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
				m.setEndDate(rset.getDate("end_date"));

				list.add(m);

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

	public ArrayList<Member> searchMember(Connection conn, int recordCountPerPage, int currentPage, Date enrollFrom,
			Date enrollTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();

		String query = "select * " + "from (select row_number() over (order by member_no desc)"
				+ "as row_num, member.* from member where ( enroll_date between ? and ? ))"
				+ "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				m.setBirthYear(rset.getInt("birth_year"));
				m.setEmail(rset.getString("email"));
				m.setEmailYN(rset.getString("email_yn").charAt(0));
				m.setGender(rset.getString("gender").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
				m.setEndDate(rset.getDate("end_date"));

				list.add(m);

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

	public ArrayList<Member> searchMember(Connection conn, int recordCountPerPage, String category, String keyword,
			int currentPage, Date enrollFrom, Date enrollTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();

		String query = "select * " + "from (select row_number() over (order by member_no desc)"
				+ "as row_num, member.* from member where ( enroll_date between ? and ? )" + " and  " + category
				+ " like ? )" + "where row_num between ? and ?";

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				m.setBirthYear(rset.getInt("birth_year"));
				m.setEmail(rset.getString("email"));
				m.setEmailYN(rset.getString("email_yn").charAt(0));
				m.setGender(rset.getString("gender").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
				m.setEndDate(rset.getDate("end_date"));

				list.add(m);

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

	public String getPageNavi(Connection conn, int recordCountPerPage, int naviCountPerPage, int currentPage,
			Date enrollFrom, Date enrollTill) {

		int totalCount = totalCount(conn, enrollFrom, enrollTill);

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

			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (startNavi - 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
					+ "&endFrom=&endTill=&category=&keyword='' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
						+ "&endFrom=&endTill=&category=&keyword='><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
						+ "&endFrom=&endTill=&category=&keyword='>" + i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (endNavi + 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
					+ "&endFrom=&endTill=&category=&keyword='' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "</a></li>");
		}

		return sb.toString();

	}

	public String getPageNavi(Connection conn, int recordCountPerPage, int naviCountPerPage, String category,
			String keyword, int currentPage, Date enrollFrom, Date enrollTill) {
		int totalCount = totalCount(conn, enrollFrom, enrollTill, keyword, category);

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

			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (startNavi - 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
					+ "&endFrom=&endTill=&category=" + category + "&keyword=" + keyword + "'' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
						+ "&endFrom=&endTill=&category=" + category + "&keyword=" + keyword + "'><b>" + i
						+ "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
						+ "&endFrom=&endTill=&category=" + category + "&keyword=" + keyword + "'>" + i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (endNavi + 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString()
					+ "&endFrom=&endTill=&category=" + category + "&keyword=" + keyword + "' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "</a></li>");
		}

		return sb.toString();

	}

	public String getPageNavi(Connection conn, int recordCountPerPage, int naviCountPerPage, int currentPage,
			Date enrollFrom, Date enrollTill, Date endFrom, Date endTill) {

		int totalCount = totalCount(conn, enrollFrom, enrollTill, endFrom, endTill);

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

			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (startNavi - 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
					+ endFrom.toString() + "&endTill=" + endTill.toString()
					+ "&category=&keyword=' ' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
						+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=&keyword='><b>" + i
						+ "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
						+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=&keyword='>" + i
						+ "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (endNavi + 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
					+ endFrom.toString() + "&endTill=" + endTill.toString()
					+ "&category=&keyword=' ' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>"
					+ "</a></li>");
		}

		return sb.toString();
	}

	public String getPageNavi(Connection conn, int recordCountPerPage, int naviCountPerPage, int currentPage,
			String keyword, String category, Date enrollFrom, Date enrollTill, Date endFrom, Date endTill) {
		int totalCount = totalCount(conn, enrollFrom, enrollTill, endFrom, endTill, category, keyword);
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

			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (startNavi - 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
					+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=" + category + "&keyword="
					+ keyword + "'' aria-label='Previous'>" + "<span aria-hidden='true'>&laquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
						+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=" + category + "&keyword="
						+ keyword + "'><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + i
						+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
						+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=" + category + "&keyword="
						+ keyword + "'>" + i + "</a></li>");
			}
		}

		// 만약 마지막 pageNavi가 아니라면 ' > ' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if (endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/searchMember.ad?currentPage=" + (endNavi + 1)
					+ "&enrollFrom=" + enrollFrom.toString() + "&enrollTill=" + enrollTill.toString() + "&endFrom="
					+ endFrom.toString() + "&endTill=" + endTill.toString() + "&category=" + category + "&keyword="
					+ keyword + "'' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>" + "</a></li>");
		}

		return sb.toString();
	}

	private int totalCount(Connection conn, Date enrollFrom, Date enrollTill, Date endFrom, Date endTill,
			String category, String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as totalCount from member "
				+ "where (enroll_date between ? and ?) and (end_date between ? and ?) and " + category + " like ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setDate(3, endFrom);
			pstmt.setDate(4, endTill);
			pstmt.setString(5, "%" + keyword + "%");

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

	public int totalCount(Connection conn, Date enrollFrom, Date enrollTill, Date endFrom, Date endTill) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as totalCount from member "
				+ "where (enroll_date between ? and ?) and (end_date between ? and ?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
			pstmt.setDate(3, endFrom);
			pstmt.setDate(4, endTill);

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

	private int totalCount(Connection conn, Date enrollFrom, Date enrollTill, String keyword, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as totalCount from member " + "where (enroll_date between ? and ?) and "
				+ category + " like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);
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

	private int totalCount(Connection conn, Date enrollFrom, Date enrollTill) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as totalCount from member " + "where (enroll_date between ? and ?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, enrollFrom);
			pstmt.setDate(2, enrollTill);

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
