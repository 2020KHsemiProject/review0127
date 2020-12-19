package rw.col.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import rw.col.model.dao.CollectionDAO;
import rw.col.model.vo.BookshelfCollection;
import rw.col.model.vo.CollectionData;
import rw.col.model.vo.LibraryCollection;
import rw.col.model.vo.OtherBookcase;
import rw.col.model.vo.ReviewCollection;
import rw.common.JDBCTemplate;
import rw.library.model.dao.LibraryDAO;
import rw.member.model.vo.Member;
import rw.review.model.vo.Book;
import rw.review.model.vo.ReviewCard;

public class CollectionService {
	CollectionDAO cDAO = new CollectionDAO(); 
	
	public CollectionData<ReviewCard, ReviewCollection> selectReviewCollection(int reviewCurrentPage, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; //한페이지에 보일 게시물 갯수
		
		CollectionData<ReviewCard,ReviewCollection> cd = cDAO.selectReviewCollecton(conn,reviewCurrentPage,recordCountPerPage,memberNo);
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getReviewPageNavi(conn,reviewCurrentPage,recordCountPerPage,naviCountPerPage,memberNo);
		cd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		return cd;
	}
	
	public int rcTotalCount(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = cDAO.rcTotalCount(conn,memberNo);
		JDBCTemplate.close(conn);
		return totalCount;
	}

	public CollectionData<Member, LibraryCollection> selectLibraryCollection(int libraryCurrentPage, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; //한페이지에 보일 게시물 갯수
		
		CollectionData<Member, LibraryCollection> cd = cDAO.selectLibraryCollection(conn,libraryCurrentPage,recordCountPerPage,memberNo);
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getLibraryPageNavi(conn,libraryCurrentPage,recordCountPerPage,naviCountPerPage,memberNo);
		cd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		return cd;
	}

	public int lcTotalCount(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = cDAO.lcTotalCount(conn,memberNo);
		JDBCTemplate.close(conn);
		return totalCount;
	}

	public CollectionData<OtherBookcase, BookshelfCollection> selectBookshelfCollection(int bookshelfCurrentPage, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 2;
		
		CollectionData<OtherBookcase,BookshelfCollection> cd= cDAO.selectBookshelfCollection(conn,bookshelfCurrentPage,recordCountPerPage,memberNo);
		
		//book데이터 받아오기
		ArrayList<OtherBookcase> obList = cd.getList();
		LibraryDAO lDAO = new LibraryDAO();
		for(OtherBookcase ob : obList) { //book리스트를 받아서 ob에 추가.
			ArrayList<Book> blist =lDAO.selectBookInOneCase(conn, ob.getLib().getBookShelfId());
			ob.setBookList(blist);
		}
		cd.setList(obList); //마지막에 리스트 업뎃
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getBookshelfPageNavi(conn,bookshelfCurrentPage,recordCountPerPage,naviCountPerPage,memberNo);
		cd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		return cd;
	}

	public int bsTotalCount(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = cDAO.bsTotalCount(conn,memberNo);
		JDBCTemplate.close(conn);
		return totalCount;
	}

	

}
