package rw.library.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.library.model.dao.LibraryDAO;
import rw.library.model.vo.BookCase;
import rw.library.model.vo.Library;
import rw.library.model.vo.LibraryPageData;
import rw.review.model.vo.Book;
import rw.reviewnote.model.vo.ReviewNotePageData;

public class LibraryService {
	
	private LibraryDAO lDAO = new LibraryDAO();
	
	public LibraryPageData selectAllBookCase(String memberNo, String libraryOwner, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 3; // 한 페이지당 몇개의 게시물이 보이게 될 것인지
		ArrayList<Library> listLib = lDAO.selectAllCase(conn,memberNo,currentPage,recordCountPerPage);
		ArrayList<BookCase> list = new ArrayList<BookCase>(); // 책장 + 책장에 담긴 책들 vo
		if(!listLib.isEmpty()) {
			for(Library libr : listLib) { // 각각의 책장에 담아진 책 list를 가져와서 BookCase vo에 넣어준다.
				BookCase bCase = new BookCase();
				bCase.setLibr(libr);
				ArrayList<Book> listB = lDAO.selectBookInOneCase(conn,libr.getBookShelfId());
				if(!listB.isEmpty()) {
					bCase.setListB(listB); // ArrayList 객체
				}
				list.add(bCase); // 하나의 책장 + 해당 책장의 책 list 를 담은 객체를 배열로 담음
			}
		}
		
		int naviCountPerPage = 5; // page Navi값이 몇개씩 보여줄 것인지
		String pageNavi = lDAO.getPageNavi(conn,memberNo,libraryOwner,currentPage,recordCountPerPage,naviCountPerPage);
		LibraryPageData lpd = new LibraryPageData();
		lpd.setList(list);
		lpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return lpd;
	}

	public int countAllBookCase(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = lDAO.countAllBookCase(conn,memberNo);
		JDBCTemplate.close(conn);
		return count;
	}

	public int updateTitle(String memberNo, String bookShelfId, String titleName) {
		// 책장의 타이틀 수정
		Connection conn = JDBCTemplate.getConnection();
		int result = lDAO.updateTitle(conn,memberNo,bookShelfId,titleName);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateLock(String memberNo, String bookShelfId, char lockData) {
		Connection conn = JDBCTemplate.getConnection();
		int result = lDAO.updateLock(conn,memberNo,bookShelfId,lockData);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}

	public ArrayList<Book> selectLikeBook(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> listLB = lDAO.selectLikeBook(conn,memberNo);
		JDBCTemplate.close(conn);
		return listLB;
	}

	public int insertBookInCase(String bookShelfId, String bookId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = lDAO.insertBookInCase(conn,bookShelfId,bookId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBookInCase(String bookShelfId, String bookId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = lDAO.deleteBookInCase(conn,bookShelfId,bookId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertBookCase(String memberNo, String[] addBookList, String bookCaseTitle) {
		Connection conn = JDBCTemplate.getConnection();
		int addCaseResult = lDAO.insertBookCase(conn, memberNo, bookCaseTitle); // 책장 추가
		
		if(addCaseResult>0) {
			
			if(addBookList!=null) { // 추가할 책이 있으면
				String bookShelfId = lDAO.selectOneBookCase(conn, memberNo); // 책장 Id 가져오기
				for(int i=0; i<addBookList.length; i++) {
					lDAO.insertBookInCase(conn, bookShelfId, addBookList[i]); // 책장에 책 추가
				}
			}
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return addCaseResult;
		
	}

	public LibraryPageData selectOtherAllBookCase(String memberNo, String libraryOwner, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 3; // 한 페이지당 몇개의 게시물이 보이게 될 것인지
		ArrayList<Library> listLib = lDAO.selectOtherAllCase(conn,memberNo,currentPage,recordCountPerPage);
		ArrayList<BookCase> list = new ArrayList<BookCase>(); // 책장 + 책장에 담긴 책들 vo
		if(!listLib.isEmpty()) {
			for(Library libr : listLib) { // 각각의 책장에 담아진 책 list를 가져와서 BookCase vo에 넣어준다.
				BookCase bCase = new BookCase();
				bCase.setLibr(libr);
				ArrayList<Book> listB = lDAO.selectBookInOneCase(conn,libr.getBookShelfId());
				if(!listB.isEmpty()) {
					bCase.setListB(listB); // ArrayList 객체
				}
				list.add(bCase); // 하나의 책장 + 해당 책장의 책 list 를 담은 객체를 배열로 담음
			}
		}
		
		int naviCountPerPage = 5; // page Navi값이 몇개씩 보여줄 것인지
		String pageNavi = lDAO.getPageNavi(conn,memberNo,libraryOwner,currentPage,recordCountPerPage,naviCountPerPage);
		LibraryPageData lpd = new LibraryPageData();
		lpd.setList(list);
		lpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return lpd;
	}

	public int countOtherAllBookCase(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = lDAO.countOtherAllBookCase(conn,memberNo);
		JDBCTemplate.close(conn);
		return count;
	}

	public int deleteBookCase(String memberNo, String bookShelfId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = lDAO.deleteBookCase(conn,memberNo,bookShelfId);
		if(result>0) {
			lDAO.disconnectBook(conn,bookShelfId); // 책 삭제
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}