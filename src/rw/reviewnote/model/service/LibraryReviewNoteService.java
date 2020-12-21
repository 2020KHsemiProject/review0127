package rw.reviewnote.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.col.model.vo.ReviewCollection;
import rw.common.JDBCTemplate;
import rw.member.model.vo.Member;
import rw.review.model.vo.ReviewCard;
import rw.reviewnote.model.dao.LibraryReviewNoteDAO;
import rw.reviewnote.model.vo.ReviewNotePageData;

public class LibraryReviewNoteService {
	LibraryReviewNoteDAO rnDAO = new LibraryReviewNoteDAO();
	
	public int countAllReview(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = rnDAO.countAllReview(conn,memberNo);
		JDBCTemplate.close(conn);
		return count;
	}
	public ReviewNotePageData selectAllReviewData(String memberNo, String memberId, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; // 한 페이지당 몇개의 게시물이 보이게 될 것인지
		ArrayList<ReviewCard> list = rnDAO.selectAllReviewData(conn,memberNo,currentPage,recordCountPerPage);
		
		int naviCountPerPage = 5; // page Navi값이 몇개씩 보여줄 것인지
		String pageNavi = rnDAO.getPageNavi(conn,memberNo,memberId,currentPage,recordCountPerPage,naviCountPerPage);
		ReviewNotePageData rnpd = new ReviewNotePageData();
		rnpd.setList(list);
		rnpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return rnpd;
	}
	public ReviewNotePageData selectAllReviewDataAlignTitle(String libraryOwner, String memberNo, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; // 한 페이지당 몇개의 게시물이 보이게 될 것인지
		ArrayList<ReviewCard> list = rnDAO.selectAllReviewDataAlignTitle(conn,memberNo,currentPage,recordCountPerPage);
		
		int naviCountPerPage = 5; // page Navi값이 몇개씩 보여줄 것인지
		String pageNavi = rnDAO.getPageNaviAlignTitle(conn,libraryOwner,memberNo,currentPage,recordCountPerPage,naviCountPerPage);
		ReviewNotePageData rnpd = new ReviewNotePageData();
		rnpd.setList(list);
		rnpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return rnpd;
	}
	public ArrayList<ReviewCollection> selectColReview(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewCollection> rColList = rnDAO.selectColReview(conn,memberNo);
		JDBCTemplate.close(conn);
		return rColList;
	}
	
}
	