package rw.reviewnote.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rw.col.model.vo.ReviewCollection;
import rw.common.JDBCTemplate;
import rw.review.model.vo.ReviewCard;

public class LibraryReviewNoteDAO {

	public int countAllReview(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = "SELECT COUNT(*) AS REVIEWCOUNT FROM REVIEW WHERE MEMBER_NO=? AND DEL_YN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("REVIEWCOUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		//System.out.println("리뷰노트 개수 : " + count);
		return count;
	}

	public ArrayList<ReviewCard> selectAllReviewData(Connection conn, String memberNo, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCard> list = new ArrayList<ReviewCard>();
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		// 조인으로 로우넘 탑앤 쿼리 날릴 땐 먼저 메인 테이블에서 탑엔 처리한 후 조인
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY R_ROW_NUM ASC) AS ROW_NUM, A.* FROM (SELECT * FROM (SELECT ROW_NUMBER()OVER(ORDER BY TO_NUMBER(SUBSTR(REVIEW_ID,2)) DESC) AS R_ROW_NUM,REVIEW.* FROM REVIEW WHERE MEMBER_NO=? AND DEL_YN='N') R LEFT JOIN MEMBER M ON (M.MEMBER_NO=R.MEMBER_NO) LEFT JOIN BOOK B ON (B.BOOK_ID=R.BOOK_ID)) A) WHERE ROW_NUM BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewCard rc = new ReviewCard();
				rc.setReviewId(rset.getString("REVIEW_ID"));
				rc.setReviewDate(rset.getDate("REVIEW_DATE"));
				rc.setReviewCount(rset.getInt("REVIEW_COUNT"));
				rc.setReviewRate(rset.getInt("REVIEW_RATE"));
				rc.setReviewCont(rset.getString("REVIEW_CONT"));
				rc.setBookId(rset.getNString("BOOK_ID"));
				rc.setMemberNo(rset.getString("MEMBER_NO"));
				rc.setDelYN(rset.getString("DEL_YN").charAt(0));
				
				rc.setMemberId(rset.getString("MEMBER_ID"));
				rc.setNickname(rset.getString("NICKNAME"));
				rc.setMemberPwd(rset.getString("MEMBER_PWD"));
				rc.setEmail(rset.getString("EMAIL"));				
				rc.setEmailYN(rset.getString("EMAIL_YN").charAt(0));
				rc.setBirthYear(rset.getInt("BIRTH_YEAR"));
				rc.setGender(rset.getString("GENDER").charAt(0));
				rc.setEnrollDate(rset.getDate("ENROLL_DATE"));
				rc.setEndYN(rset.getString("END_YN").charAt(0));
				rc.setEndDate(rset.getDate("END_DATE"));
				rc.setProfileImg(rset.getString("PROFILE_IMG"));
				
				rc.setBookTitle(rset.getString("BOOK_TITLE"));
				rc.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				rc.setBookImage(rset.getString("BOOK_IMAGE"));
				
				list.add(rc);
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

	public String getPageNavi(Connection conn, String memberNo, String memberId, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		// 현재 변수 재확인
		// currentPage			: 현재 페이지를 가지고 있는 변수
		// recordCountPerPage	: 한 페이지당 보여질 게시물의 개수
		// naviCountPerPage		: pageNavi가 몇개씩 보여질 것인지에 대한 변수
		int postTotalCount = countAllReview(conn,memberNo); // 전체 게시물을 구하기 위한 메소드
		
		// 생성될 페이지 개수 구하기
		
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
		
		// 이제 pageNavi의 모양을 구성해야 함
		
		StringBuilder sb = new StringBuilder();
				
		// 만약 첫번째 pageNavi가 아니라면 '<' 모양을 추가해라 (첫번째 pageNavi이면 추가하지 말아라)
		if(startNavi != 1) { //href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi-1)+"'
			sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi-1)+"'>></a></li>");
		}
				
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li class='page-item active'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+i+"'><B>"+i+"</B></a></li>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		//만약 마지막 pageNavi가 아니라면 '>' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		if(endNavi != pageTotalCount) {
			sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi+1)+"'>></a></li>");
		}
				
		return sb+"";
	}

	public ArrayList<ReviewCard> selectAllReviewDataAlignTitle(Connection conn, String memberNo, int currentPage,
			int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewCard> list = new ArrayList<ReviewCard>();
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		// 조인으로 로우넘 탑앤 쿼리 날릴 땐 먼저 메인 테이블에서 탑엔 처리한 후 조인
		String query = "SELECT * FROM (SELECT ROW_NUMBER()OVER(ORDER BY B_ROW_NUM ASC) AS ROW_NUM, A.* FROM (SELECT * FROM REVIEW R LEFT JOIN MEMBER M ON (M.MEMBER_NO=R.MEMBER_NO) LEFT JOIN (SELECT ROW_NUMBER() OVER(ORDER BY BOOK_TITLE ASC) AS B_ROW_NUM, BOOK.* FROM BOOK) B ON (B.BOOK_ID=R.BOOK_ID) WHERE R.MEMBER_NO=? AND R.DEL_YN='N') A) WHERE ROW_NUM BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewCard rc = new ReviewCard();
				rc.setReviewId(rset.getString("REVIEW_ID"));
				rc.setReviewDate(rset.getDate("REVIEW_DATE"));
				rc.setReviewCount(rset.getInt("REVIEW_COUNT"));
				rc.setReviewRate(rset.getInt("REVIEW_RATE"));
				rc.setReviewCont(rset.getString("REVIEW_CONT"));
				rc.setBookId(rset.getNString("BOOK_ID"));
				rc.setMemberNo(rset.getString("MEMBER_NO"));
				rc.setDelYN(rset.getString("DEL_YN").charAt(0));
				
				rc.setMemberId(rset.getString("MEMBER_ID"));
				rc.setNickname(rset.getString("NICKNAME"));
				rc.setMemberPwd(rset.getString("MEMBER_PWD"));
				rc.setEmail(rset.getString("EMAIL"));				
				rc.setEmailYN(rset.getString("EMAIL_YN").charAt(0));
				rc.setBirthYear(rset.getInt("BIRTH_YEAR"));
				rc.setGender(rset.getString("GENDER").charAt(0));
				rc.setEnrollDate(rset.getDate("ENROLL_DATE"));
				rc.setEndYN(rset.getString("END_YN").charAt(0));
				rc.setEndDate(rset.getDate("END_DATE"));
				rc.setProfileImg(rset.getString("PROFILE_IMG"));
				
				rc.setBookTitle(rset.getString("BOOK_TITLE"));
				rc.setBookAuthor(rset.getString("BOOK_AUTHOR"));
				rc.setBookImage(rset.getString("BOOK_IMAGE"));
				
				list.add(rc);
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

	public String getPageNaviAlignTitle(Connection conn, String memberNo, String memberId, int currentPage,
			int recordCountPerPage, int naviCountPerPage) {
		// 현재 변수 재확인
				// currentPage			: 현재 페이지를 가지고 있는 변수
				// recordCountPerPage	: 한 페이지당 보여질 게시물의 개수
				// naviCountPerPage		: pageNavi가 몇개씩 보여질 것인지에 대한 변수
				int postTotalCount = countAllReview(conn,memberNo); // 전체 게시물을 구하기 위한 메소드
				
				// 생성될 페이지 개수 구하기
				
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
				
				// 이제 pageNavi의 모양을 구성해야 함
				
				StringBuilder sb = new StringBuilder();
						
				// 만약 첫번째 pageNavi가 아니라면 '<' 모양을 추가해라 (첫번째 pageNavi이면 추가하지 말아라)
				if(startNavi != 1) { //href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi-1)+"'
					sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi-1)+"'>></a></li>");
				}
						
				for(int i=startNavi; i<=endNavi; i++) {
					if(i==currentPage) {
						sb.append("<li class='page-item active'><a class='page-link' style='color:white;' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+i+"'><B>"+i+"</B></a></li>");
					}else {
						sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+i+"'>"+i+"</a></li>");
					}
				}
									
				//만약 마지막 pageNavi가 아니라면 '>' 모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
				if(endNavi != pageTotalCount) {
					sb.append("<li class='page-item'><a class='page-link' href='/myReviewNote.rw?libraryOwner="+memberId+"&currentPage="+(startNavi+1)+"'>></a></li>");
				}
						
				return sb+"";
			}

	

}