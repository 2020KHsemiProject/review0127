package rw.library.model.service;

import java.sql.Connection;

import rw.common.JDBCTemplate;
import rw.library.model.dao.LibraryReviewNoteDAO;
import rw.member.model.vo.Member;

public class LibraryReviewNoteService {
	LibraryReviewNoteDAO rDAO = new LibraryReviewNoteDAO();
	public Member selecAlltMyLibraryHeader(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = rDAO.selecAlltMyLibraryHeader(conn,memberNo);
		JDBCTemplate.close(conn);
		return m;
	}

}
	