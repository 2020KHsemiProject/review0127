package rw.col.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import rw.col.model.dao.CollectionDAO;
import rw.col.model.vo.BookshelfCollection;
import rw.col.model.vo.CollectionPageData;
import rw.col.model.vo.OtherBookcase;
import rw.col.model.vo.ReviewCollection;
import rw.common.JDBCTemplate;
import rw.library.model.dao.LibraryDAO;
import rw.member.model.vo.Member;
import rw.review.model.vo.Book;
import rw.review.model.vo.ReviewCard;

public class CollectionService {
	CollectionDAO cDAO = new CollectionDAO(); 
	
	public CollectionPageData<ReviewCard> selectReviewCollection(int reviewCurrentPage, String ownerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; //한페이지에 보일 게시물 갯수
		
		//리뷰데이터 가져올 때 로그인한 사람(memberNo)의 좋아요 여부 가져오기
		CollectionPageData<ReviewCard> cpd = cDAO.selectReviewCollecton(conn,reviewCurrentPage,recordCountPerPage,ownerNo);
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getReviewPageNavi(conn,reviewCurrentPage,recordCountPerPage,naviCountPerPage,ownerNo);
		cpd.setPageNavi(pageNavi);
		
		int rcTotalCount = cDAO.rcTotalCount(conn, ownerNo);
		cpd.setTotalCount(rcTotalCount);
		
		JDBCTemplate.close(conn);
		return cpd;
	}
	
	public CollectionPageData<Member> selectLibraryCollection(int libraryCurrentPage, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 6; //한페이지에 보일 게시물 갯수
		
		CollectionPageData<Member> cpd = cDAO.selectLibraryCollection(conn,libraryCurrentPage,recordCountPerPage,memberNo);
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getLibraryPageNavi(conn,libraryCurrentPage,recordCountPerPage,naviCountPerPage,memberNo);
		cpd.setPageNavi(pageNavi);
		
		int lcTotalCount = cDAO.lcTotalCount(conn, memberNo);
		cpd.setTotalCount(lcTotalCount);
		
		JDBCTemplate.close(conn);
		return cpd;
	}

	public CollectionPageData<OtherBookcase> selectBookshelfCollection(int bookshelfCurrentPage, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 2;
		
		CollectionPageData<OtherBookcase> cpd= cDAO.selectBookshelfCollection(conn,bookshelfCurrentPage,recordCountPerPage,memberNo);
		
		//book데이터 받아오기
		ArrayList<OtherBookcase> obList = cpd.getList();
		LibraryDAO lDAO = new LibraryDAO();
		for(OtherBookcase ob : obList) { //book리스트를 받아서 ob에 추가.
			ArrayList<Book> blist =lDAO.selectBookInOneCase(conn, ob.getLib().getBookShelfId());
			ob.setBookList(blist);
		}
		cpd.setList(obList); //마지막에 리스트 업뎃
		
		int naviCountPerPage = 5; //페이지 네비 보여줄 갯수
		String pageNavi = cDAO.getBookshelfPageNavi(conn,bookshelfCurrentPage,recordCountPerPage,naviCountPerPage,memberNo);
		cpd.setPageNavi(pageNavi);
		
		int bsTotalCount = cDAO.bsTotalCount(conn, memberNo);
		cpd.setTotalCount(bsTotalCount);
		
		JDBCTemplate.close(conn);
		return cpd;
	}

	public int insertLibraryCollection(String memberNo, String ownerId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.insertLibraryCollection(conn,memberNo,ownerId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean existsMyLibCol(String memberNo, String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = cDAO.existsMyLibCol(conn,memberNo,memberId);
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteLibraryCollection(String memberNo, String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.deleteLibraryCollection(conn,memberNo, memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBookshelfCollection(String memberNo, String bookshelfId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.deleteBookshelfCollection(conn,memberNo, bookshelfId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteReviewCollection(String memberNo, String reviewId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.deleteReviewCollection(conn,memberNo, reviewId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public HashMap<String, String> selectReviewLikeInRC(String memberNo, String ownerNo) {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<String, String> likeYNlist = cDAO.selectReviewLikeInRC(conn,memberNo,ownerNo);
		JDBCTemplate.close(conn);
		return likeYNlist;
	}

	public int insertReview(String memberNo, String reviewId) {
		// 남의 서재- 리뷰노트 에서 리뷰 추가 
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.insertReview(conn,memberNo,reviewId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteReview(String memberNo, String reviewId) {
		// 남의 서재- 리뷰노트 에서 리뷰 제거
		Connection conn = JDBCTemplate.getConnection(); 
		int result = cDAO.deleteReview(conn,memberNo,reviewId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<ReviewCollection> selectColReview(String memberNo) {
		// 내가 스크랩한 리뷰카드
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewCollection> rColList = cDAO.selectColReview(conn,memberNo);
		JDBCTemplate.close(conn);
		return rColList;
	}

	public int insertBookCase(String memberNo, String bookCaseId) {
		// 남의 서재- 책장 에서 책장 추가 
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.insertBookCase(conn,memberNo,bookCaseId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBookCase(String memberNo, String bookCaseId) {
		// 남의 서재- 책장 에서 책장 추가 
		Connection conn = JDBCTemplate.getConnection();
		int result = cDAO.deleteBookCase(conn,memberNo,bookCaseId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<BookshelfCollection> selectColBookshelf(String memberNo) {
		// 내가 스크랩한 책장
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BookshelfCollection> bcColList = cDAO.selectColBookshelf(conn,memberNo);
		JDBCTemplate.close(conn);
		return bcColList;
	
	}
}
