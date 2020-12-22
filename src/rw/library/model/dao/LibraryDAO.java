package rw.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.library.model.vo.BookCase2;
import rw.library.model.vo.Library;
import rw.review.model.vo.Book;

public class LibraryDAO {

	public int countAllBookCase(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM LIBRARY WHERE MEMBER_NO=? AND DEL_YN='N'";
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
	public ArrayList<Library> selectAllCase(Connection conn, String memberNo, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Library> listLib = new ArrayList<Library>(); 
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY TO_NUMBER(SUBSTR(L.BOOKSHELF_ID,2)) DESC) AS ROW_NUM,L.* FROM LIBRARY L LEFT JOIN MEMBER M ON (M.MEMBER_NO=L.MEMBER_NO) WHERE L.MEMBER_NO=? AND L.DEL_YN='N') WHERE ROW_NUM BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
		String query = "SELECT B.* FROM (SELECT * FROM LIBRARY WHERE BOOKSHELF_ID=? AND DEL_YN='N') L LEFT JOIN PERSONAL_LIBRARY PL ON (PL.BOOKSHELF_ID=L.BOOKSHELF_ID) LEFT JOIN BOOK B ON (B.BOOK_ID=PL.BOOK_ID) ORDER BY B.BOOK_TITLE";
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
	public int insertBookInCase(Connection conn, String bookShelfId, String bookId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO PERSONAL_LIBRARY VALUES(PSN_LIBRARY_SEQ.NEXTVAL,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookShelfId);
			pstmt.setString(2, bookId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int deleteBookInCase(Connection conn, String bookShelfId, String bookId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM PERSONAL_LIBRARY WHERE BOOKSHELF_ID=? AND BOOK_ID=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookShelfId);
			pstmt.setString(2, bookId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public String getPageNavi(Connection conn, String memberNo, String libraryOwner, int currentPage,
			int recordCountPerPage, int naviCountPerPage) {
		int postTotalCount = countOtherAllBookCase(conn,memberNo);
		
		int pageTotalCount; // 전체페이지를 저장하는 변수
		if(postTotalCount % recordCountPerPage > 0){
			pageTotalCount = postTotalCount / recordCountPerPage + 1;
			// ex) pageTotalCount = 108 / 5 + 1 -> 22 Page
		}else {
			pageTotalCount = postTotalCount / recordCountPerPage + 0;
			// ex) pageTotalCount = 105 / 5 + 0 -> 21 Page
		}
		
		// 현재 페이지 번호 구하기
		// startNavi = ((현재페이지-1)/보여질 navi개수) * 보여질navi개수 +1;
		int startNavi = ((currentPage -1) / naviCountPerPage) * naviCountPerPage +1;
		// endNavi = 시작navi번호 + 보여질 navi개수 - 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		// 마지막 페이지 번호가 총 페이지 수보다 높을 때
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}		
		
		StringBuilder sb = new StringBuilder();
		
		// 만약 첫번째 pageNavi가 아니라면 '<' 모양을 추가해라 (첫번째 pageNavi이면 추가하지 말아라)
		if(startNavi != 1) { //href='/myBookCase.rw?libraryOwner="+memberId+"&currentPage="+(startNavi-1)+"'
			sb.append("<li class='page-item'><a class='page-link' href='/myBookCase.rw?libraryOwner="+libraryOwner+"&currentPage="+(startNavi-1)+"'>></a></li>");
		}
						
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li class='page-item active'><a class='page-link' href='/myBookCase.rw?libraryOwner="+libraryOwner+"&currentPage="+i+"'><B style='color:white;'>"+i+"</B></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/myBookCase.rw?libraryOwner="+libraryOwner+"&currentPage="+i+"'>"+i+"</a></li>");
			}
		}
				
		//만약 마지막 pageNavi가 아니라면 '>' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/myBookCase.rw?libraryOwner="+libraryOwner+"&currentPage="+(startNavi+1)+"'>></a></li>");
		}
				
		return sb+"";
	}
	public int insertBookCase(Connection conn, String memberNo, String bookCaseTitle) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO LIBRARY VALUES('L'||LIBRARY_SEQ.NEXTVAL,?,?,'N','N')";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookCaseTitle);
			pstmt.setString(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public String selectOneBookCase(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String bookShelfId = null;
		String query = "SELECT * FROM (SELECT ROWNUM,L.* FROM LIBRARY l WHERE MEMBER_NO=? ORDER BY ROWNUM DESC) WHERE ROWNUM = 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bookShelfId = rset.getString("BOOKSHELF_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bookShelfId;
	}
	public ArrayList<Library> selectOtherAllCase(Connection conn, String memberNo, int currentPage,
			int recordCountPerPage) { //// 남으 ㅣ책장 전체 리스트
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Library> listLib = new ArrayList<Library>(); 
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY L.BOOKSHELF_ID DESC) AS ROW_NUM,L.* FROM LIBRARY L LEFT JOIN MEMBER M ON (M.MEMBER_NO=L.MEMBER_NO) WHERE L.MEMBER_NO=? AND PRIVATE_YN='N' AND L.DEL_YN='N') WHERE ROW_NUM BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
	public int countOtherAllBookCase(Connection conn, String memberNo) { //// 다른사람 책장의 총 책장 수 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM LIBRARY WHERE MEMBER_NO=? AND PRIVATE_YN='N' AND DEL_YN='N'";
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
	public int deleteBookCase(Connection conn, String memberNo, String bookShelfId) {
		PreparedStatement pstmt = null; // 책장 삭제
		int result = 0;
		String query = "UPDATE LIBRARY SET DEL_YN='Y' WHERE BOOKSHELF_ID=? AND MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookShelfId);
			pstmt.setString(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int disconnectBook(Connection conn, String bookShelfId) { 
		PreparedStatement pstmt = null; // 삭제한 책장의 책 모두 삭제
		int result = 0;
		String query = "DELETE FROM PERSONAL_LIBRARY WHERE BOOKSHELF_ID=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookShelfId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int countAllLibrary(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = "SELECT COUNT(*) TOTAL FROM LIBRARY WHERE PRIVATE_YN = 'N' AND DEL_YN ='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			count = rset.getInt("total");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	public BookCase2 selectOneLibraryByRow(Connection conn, int rowNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BookCase2 bc = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM AS RN, L.BOOKSHELF_ID, L.BOOKSHELF_NAME, " + 
				"L.MEMBER_NO, M.MEMBER_ID, M.NICKNAME FROM LIBRARY L JOIN MEMBER M ON L.MEMBER_NO = M.MEMBER_NO " + 
				"WHERE PRIVATE_YN = 'N' AND DEL_YN ='N') WHERE RN = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rowNum);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bc = new BookCase2();
				bc.setBookshelfId(rset.getString("bookshelf_id"));
				bc.setBookshelfName(rset.getString("bookshelf_name"));
				bc.setMemberId(rset.getString("member_id"));
				bc.setMemberNo(rset.getString("member_no"));
				bc.setNickname(rset.getString("nickname"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bc;
	}
	public ArrayList<Book> selectOnePSNLibrary(Connection conn, String bookshelfId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Book> list = new ArrayList<Book>();
		
		String query = "SELECT * FROM BOOK WHERE BOOK_ID IN (SELECT BOOK_ID FROM PERSONAL_LIBRARY WHERE BOOKSHELF_ID =?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookshelfId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book b = new Book();
				b.setBookId("book_id");
				b.setBookTitle("book_title");
				b.setBookImage("book_image");
				
				list.add(b);
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

}