package rw.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.library.model.vo.Library;
import rw.review.model.vo.Book;

public class LibraryDAO {

	public int countAllBookCase(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM LIBRARY WHERE MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			rset.next();
			count = rset.getInt("COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
/*
	public ArrayList<BookCase> selectAllBookCase(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BookCase> list = new ArrayList<BookCase>();
		String query = "SELECT * FROM MEMBER M LEFT JOIN LIBRARY L ON (L.MEMBER_NO=M.MEMBER_NO) LEFT JOIN PERSONAL_LIBRARY PL ON (PL.BOOKSHELF_ID=L.BOOKSHELF_ID) WHERE M.MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookCase bkc = new BookCase();
				bkc.setMemberNo(rset.getString("MEMBER_NO"));
				bkc.setMemberId(rset.getString("MEMBER_ID"));
				bkc.setNickname(rset.getString("NICKNAME"));
				bkc.setBirthYear(rset.getInt("BIRTH_YEAR"));
				bkc.setGender(rset.getString("GENDER").charAt(0));
				bkc.setEndYN(rset.getString("END_YN").charAt(0));
				bkc.setBookshelfId(rset.getNString("BOOKSHELF_ID"));
				bkc.setBookshelfName(rset.getNString("BOOKSHELF_NAME"));
				bkc.setPrivateYN(rset.getString("PRIVATE_YN").charAt(0));
				bkc.setDelYN(rset.getString("DEL_YN").charAt(0));
				bkc.setPsnShelfId(rset.getString("PSN_SHELF_ID"));
				list.add(bkc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
*/
	public ArrayList<Library> selectAllCase(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Library> listLib = new ArrayList<Library>(); 
		String query = "SELECT ROWNUM,L.* FROM LIBRARY L LEFT JOIN MEMBER M ON (M.MEMBER_NO=L.MEMBER_NO) WHERE L.MEMBER_NO=? ORDER BY ROWNUM DESC";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Library libr = new Library();
				libr.setBookShelfId(rset.getString("BOOKSHELF_ID"));
				libr.setBookShelfName(rset.getString("BOOKSHELF_NAME"));
				libr.setMemberNo(rset.getString("MEMBER_NO"));
				libr.setPrivateYN(rset.getString("PRIVATE_YN").charAt(0));
				libr.setDelYN(rset.getString("DEL_YN").charAt(0));
				listLib.add(libr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listLib;
	}
	public ArrayList<Book> selectBookInOneCase(Connection conn, String bookShelfId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Book> listB = new ArrayList<Book>();
		String query = "SELECT B.* FROM (SELECT * FROM LIBRARY WHERE BOOKSHELF_ID=?) L LEFT JOIN PERSONAL_LIBRARY PL ON (PL.BOOKSHELF_ID=L.BOOKSHELF_ID) LEFT JOIN BOOK B ON (B.BOOK_ID=PL.BOOK_ID) ORDER BY B.BOOK_TITLE";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookShelfId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book b = new Book();
				b.setBookId(rset.getString("BOOK_ID"));
				b.setBookTitle(rset.getString("BOOK_TITLE"));
				b.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				b.setBookImage(rset.getString("BOOK_IMAGE"));
				listB.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listB;
	}
	public int updateTitle(Connection conn, String memberNo, String bookShelfId, String titleName) {
		/// 책장 이름 수정
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE LIBRARY SET BOOKSHELF_NAME=? WHERE BOOKSHELF_ID=? AND MEMBER_NO=? AND DEL_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, titleName);
			pstmt.setString(2, bookShelfId);
			pstmt.setString(3, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int updateLock(Connection conn, String memberNo, String bookShelfId, char lockData) {
		// 책장 잠금 수정
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE LIBRARY SET PRIVATE_YN=? WHERE BOOKSHELF_ID=? AND MEMBER_NO=? AND DEL_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lockData+"");
			pstmt.setString(2, bookShelfId);
			pstmt.setString(3, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<Book> selectLikeBook(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Book> listLB = new ArrayList<Book>();
		String query = "SELECT * FROM BOOK_LIKE LEFT JOIN BOOK USING(BOOK_ID) WHERE MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book b = new Book();
				b.setBookId(rset.getString("BOOK_ID"));
				b.setBookTitle(rset.getString("BOOK_TITLE"));
				b.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				b.setBookImage(rset.getString("BOOK_IMAGE"));
				listLB.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listLB;
	}

}
