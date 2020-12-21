package rw.col.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import rw.col.model.vo.CollectionPageData;
import rw.col.model.vo.OtherBookcase;
import rw.common.JDBCTemplate;
import rw.library.model.vo.Library;
import rw.member.model.vo.Member;
import rw.review.model.vo.ReviewCard;

public class CollectionDAO {

	public CollectionPageData<ReviewCard> selectReviewCollecton(Connection conn, int reviewCurrentPage, int recordCountPerPage, String ownerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CollectionPageData<ReviewCard> cpd = new CollectionPageData<ReviewCard>();  
		ArrayList<ReviewCard> rcList = new ArrayList<ReviewCard>();
		
		//리뷰카드로 다시 수정. 쿼리문 수정필요.
		int start = reviewCurrentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = reviewCurrentPage * recordCountPerPage;

		String query = "SELECT * FROM (WITH RV AS (SELECT RC.COL_REVIEW_ID, RC.MEMBER_NO RCMN, RC.REVIEW_ID, R.REVIEW_CONT, " + 
				"R.REVIEW_COUNT, R.REVIEW_DATE, R.REVIEW_RATE, R.DEL_YN, M.*, B.* FROM REVIEW_COLLECTION RC " + 
				"JOIN REVIEW R ON RC.REVIEW_ID = R.REVIEW_ID JOIN MEMBER M ON R.MEMBER_NO = M.MEMBER_NO " + 
				"JOIN BOOK B ON R.BOOK_ID = B.BOOK_ID WHERE RC.MEMBER_NO = ? AND R.DEL_YN = 'N') " + 
				"SELECT ROW_NUMBER() OVER(ORDER BY RV.COL_REVIEW_ID DESC) AS RN, RV.* FROM RV) WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ownerNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewCard rd = new ReviewCard();
				rd.setReviewId(rset.getString("REVIEW_ID"));
				rd.setReviewDate(rset.getDate("REVIEW_DATE"));
				rd.setReviewCount(rset.getInt("REVIEW_COUNT"));
				rd.setReviewRate(rset.getInt("REVIEW_RATE"));
				rd.setReviewCont(rset.getString("REVIEW_CONT"));
				rd.setBookId(rset.getNString("BOOK_ID"));
				rd.setMemberNo(rset.getString("MEMBER_NO"));
				rd.setDelYN(rset.getString("DEL_YN").charAt(0));

				rd.setMemberId(rset.getString("MEMBER_ID"));
				rd.setNickname(rset.getString("NICKNAME"));
				rd.setProfileImg(rset.getString("PROFILE_IMG"));
				rd.setBookTitle(rset.getString("BOOK_TITLE"));
				rd.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				rd.setBookImage(rset.getString("BOOK_IMAGE"));
				
				rcList.add(rd);
			}
			
			cpd.setList(rcList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cpd;
		
	}
	
	public String getReviewPageNavi(Connection conn, int reviewCurrentPage, int recordCountPerPage,
			int naviCountPerPage, String memberNo) {
		int postTotalCount = rcTotalCount(conn,memberNo); //게시글의 전체 갯수 -
		
		//생성될 페이지 갯수
		int pageTotalCount;
		if(postTotalCount % recordCountPerPage>0) {
			pageTotalCount = (postTotalCount / recordCountPerPage)+1 ;
		}else {
			pageTotalCount = (postTotalCount / recordCountPerPage)+0 ;
		}
		
		int startNavi = ((reviewCurrentPage-1) / naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi+ naviCountPerPage -1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		
		// < 버튼 출력
		if(startNavi !=1) {//페이지 서블릿 생성 후 링크 넣기 - ajax
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#other-review-card-wrap\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>	</a></li>");
		}
		
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==reviewCurrentPage) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#other-review-card-wrap\">"+i+"</a></li>");
			}else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#other-review-card-wrap\">"+i+"</a></li>");
			}
		}
		// > 버튼 출력
		if(endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#other-review-card-wrap\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>	</a></li>");
		}
		
		return sb.toString();
	}

	public int rcTotalCount(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0; 

		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM REVIEW_COLLECTION RC JOIN MEMBER M " + 
				"ON RC.MEMBER_NO = M.MEMBER_NO WHERE RC.MEMBER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			rset.next();
			totalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public CollectionPageData<Member> selectLibraryCollection(Connection conn, int libraryCurrentPage, int recordCountPerPage, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CollectionPageData<Member> cpd = new CollectionPageData<Member>();
		ArrayList<Member> mList = new ArrayList<Member>();
		
		int start = libraryCurrentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = libraryCurrentPage * recordCountPerPage;
		
		String query = "SELECT * FROM (WITH LM AS (SELECT LC.COL_LIBRARY_ID, LC.MEMBER_NO AS LCMNO, M.*  " + 
				"FROM LIBRARY_COLLECTION LC JOIN MEMBER M ON LC.MEMBER_ID = M.MEMBER_ID " + 
				"WHERE LC.MEMBER_NO = ? AND END_YN ='N') " + 
				"SELECT ROW_NUMBER() OVER(ORDER BY LM.COL_LIBRARY_ID DESC) AS RN, LM.* FROM LM) " + 
				"WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));//내가 추가한 사람들의 회원번호 및 정보(4개)
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				m.setProfileImg(rset.getString("profile_img"));
				mList.add(m);
			}
			
			cpd.setList(mList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cpd;
	}

	public String getLibraryPageNavi(Connection conn, int libraryCurrentPage, int recordCountPerPage, int naviCountPerPage, String memberNo) {
		int postTotalCount = lcTotalCount(conn,memberNo); //게시글의 전체 갯수 -
		
		//생성될 페이지 갯수
		int pageTotalCount;
		if(postTotalCount % recordCountPerPage>0) {
			pageTotalCount = (postTotalCount / recordCountPerPage)+1 ;
		}else {
			pageTotalCount = (postTotalCount / recordCountPerPage)+0 ;
		}
		
		int startNavi = ((libraryCurrentPage-1) / naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi+ naviCountPerPage -1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		
		// < 버튼 출력
		if(startNavi !=1) {//페이지 서블릿 생성 후 링크 넣기 - ajax
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#others-library-wrap\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>	</a></li>");
		}
		
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==libraryCurrentPage) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#others-library-wrap\">"+i+"</a></li>");
			}else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#others-library-wrap\">"+i+"</a></li>");
			}
		}
		// > 버튼 출력
		if(endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#others-library-wrap\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>	</a></li>");
		}
		
		return sb.toString();
	}

	public int lcTotalCount(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0; 

		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM LIBRARY_COLLECTION LC JOIN MEMBER M USING(MEMBER_ID) " + 
				"WHERE LC.MEMBER_NO = ? AND END_YN = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			rset.next();
			totalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public CollectionPageData<OtherBookcase> selectBookshelfCollection(Connection conn, int bookshelfCurrentPage, int recordCountPerPage,
			String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CollectionPageData<OtherBookcase> cpd = new CollectionPageData<OtherBookcase>();
		ArrayList<OtherBookcase> obList = new ArrayList<OtherBookcase>();
		
		int start = bookshelfCurrentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = bookshelfCurrentPage * recordCountPerPage;
		
		String query = "SELECT * FROM (WITH BL AS (SELECT BC.COL_BOOKSHELF_ID, BC.MEMBER_NO AS BCMN, L.*, M.MEMBER_ID, M.NICKNAME " + 
				"FROM BOOKSHELF_COLLECTION BC JOIN LIBRARY L " + 
				"ON BC.BOOKSHELF_ID = L.BOOKSHELF_ID JOIN MEMBER M ON L.MEMBER_NO = M.MEMBER_NO " + 
				"WHERE BC.MEMBER_NO = ? AND L.PRIVATE_YN='N' AND L.DEL_YN='N' AND M.END_YN='N') " + 
				"SELECT ROW_NUMBER() OVER (ORDER BY BL.COL_BOOKSHELF_ID DESC) AS RN, BL.* FROM BL) " + 
				"WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OtherBookcase ob = new OtherBookcase();
				Library l = new Library();
				Member m  = new Member();
				l.setBookShelfId(rset.getString("bookshelf_id"));
				l.setBookShelfName(rset.getString("bookshelf_name"));
				l.setMemberNo(rset.getString("member_no"));//책장 주인
				l.setPrivateYN(rset.getString("private_yn").charAt(0));
				l.setDelYN(rset.getString("del_yn").charAt(0));
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setNickname(rset.getString("nickname"));
				
				ob.setLib(l);
				ob.setM(m);
				obList.add(ob);
			}
			
			cpd.setList(obList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cpd;
	}

	public String getBookshelfPageNavi(Connection conn, int bookshelfCurrentPage, int recordCountPerPage,
			int naviCountPerPage, String memberNo) {
		
		int postTotalCount = bsTotalCount(conn,memberNo); //게시글의 전체 갯수 -
		
		//생성될 페이지 갯수
		int pageTotalCount;
		if(postTotalCount % recordCountPerPage>0) {
			pageTotalCount = (postTotalCount / recordCountPerPage)+1 ;
		}else {
			pageTotalCount = (postTotalCount / recordCountPerPage)+0 ;
		}
		
		int startNavi = ((bookshelfCurrentPage-1) / naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi+ naviCountPerPage -1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		
		// < 버튼 출력
		if(startNavi !=1) {//페이지 서블릿 생성 후 링크 넣기 - ajax
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#myCollection-collectionlist\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>	</a></li>");
		}
		
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==bookshelfCurrentPage) {
				sb.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#myCollection-collectionlist\">"+i+"</a></li>");
			}else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#myCollection-collectionlist\">"+i+"</a></li>");
			}
		}
		// > 버튼 출력
		if(endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#myCollection-collectionlist\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>	</a></li>");
		}
		
		return sb.toString();
	}

	public int bsTotalCount(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) TOTALCOUNT FROM BOOKSHELF_COLLECTION BC JOIN LIBRARY L USING(BOOKSHELF_ID) " + 
				"JOIN MEMBER M ON L.MEMBER_NO = M.MEMBER_NO WHERE BC.MEMBER_NO = ? AND M.END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			rset.next();
			totalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public int insertLibraryCollection(Connection conn, String memberNo, String ownerId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO LIBRARY_COLLECTION VALUES(LIBRARY_COLLECTION_SEQ.NEXTVAL, ?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, ownerId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public boolean existsMyLibCol(Connection conn, String memberNo, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = "SELECT 1 FROM LIBRARY_COLLECTION WHERE MEMBER_NO = ? AND MEMBER_ID = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteLibraryCollection(Connection conn, String memberNo, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM LIBRARY_COLLECTION WHERE MEMBER_NO = ? AND MEMBER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,memberNo);
			pstmt.setString(2,memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteBookshelfCollection(Connection conn, String memberNo, String bookshelfId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM BOOKSHELF_COLLECTION WHERE MEMBER_NO = ? AND BOOKSHELF_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,memberNo);
			pstmt.setString(2,bookshelfId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteReviewCollection(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM REVIEW_COLLECTION WHERE MEMBER_NO = ? AND REVIEW_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,memberNo);
			pstmt.setString(2,reviewId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public HashMap<String, String> selelctReviewLikeInRC(Connection conn, String memberNo, String ownerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, String> likeYNlist = new HashMap<String, String>();
		
		String query = "SELECT * FROM REVIEW_LIKE WHERE MEMBER_NO = ? AND REVIEW_ID IN " + 
				"(SELECT REVIEW_ID FROM REVIEW_COLLECTION WHERE MEMBER_NO = ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, ownerNo);
			rset = pstmt.executeQuery();
			while((rset.next())) {
				//리뷰id를 키값으로 로그인한 회원의 YN여부 추가
				String likeYN = rset.getString("like_yn");
				
				if(likeYN==null) {
					likeYNlist.put(rset.getString("review_id"), "N");
				}else {
					likeYNlist.put(rset.getString("review_id"), likeYN);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return likeYNlist;
	}

	public int insertReview(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0; 
		String query = "INSERT INTO REVIEW_COLLECTION VALUES (REVIEW_COLLECTION_SEQ.NEXTVAL,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, reviewId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteReview(Connection conn, String memberNo, String reviewId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM REVIEW_COLLECTION WHERE MEMBER_NO=? AND REVIEW_ID=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, reviewId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<ReviewCollection> selectColReview(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCollection> rColList = new ArrayList<ReviewCollection>();
		String query = "SELECT * FROM REVIEW_COLLECTION WHERE MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewCollection rCol = new ReviewCollection();
				rCol.setColReviewId(rset.getInt("COL_REVIEW_ID"));
				rCol.setMemberNo(rset.getString("MEMBER_NO"));
				rCol.setReviewId(rset.getString("REVIEW_ID"));
				rColList.add(rCol);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rColList;
	}

}
