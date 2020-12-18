package rw.library.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.common.JDBCTemplate;
import rw.library.model.dao.LibraryDAO;
import rw.library.model.vo.BookCase;
import rw.library.model.vo.Library;
import rw.review.model.vo.Book;

public class LibraryService {
	
	private LibraryDAO lDAO = new LibraryDAO();
	
	public ArrayList<BookCase> selectAllBookCase(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Library> listLib = lDAO.selectAllCase(conn,memberNo);
		ArrayList<BookCase> list = new ArrayList<BookCase>();
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
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int countAllBookCase(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = lDAO.countAllBookCase(conn,memberNo);
		JDBCTemplate.close(conn);
		return count;
	}

}
