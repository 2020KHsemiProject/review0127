package rw.reviewnote.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.col.model.service.CollectionService;
import rw.col.model.vo.ReviewCollection;
import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.ReviewCard;
import rw.review.model.vo.ReviewLike;
import rw.reviewnote.model.service.LibraryReviewNoteService;
import rw.reviewnote.model.vo.ReviewNotePageData;

/**
 * Servlet implementation class SelectAlignTitleServlet
 */
@WebServlet("/rnAlignTitle.rw")
public class LRNSelectAlignTitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LRNSelectAlignTitleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LibraryReviewNoteService rnService = new LibraryReviewNoteService();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member!=null) { // 로그인 했다면 
		String memberId = member.getMemberId(); // session 
		// System.out.println("[내 서재] 내 멤버고유번호 : "+memberNo);
		
		// 서재 주인
		String libraryOwner = request.getParameter("libraryOwner");
		
		Member m = new Member();
		
		if(memberId.equals(libraryOwner)) {
			m = new MemberService().selectOneMemberId(memberId);  // 내 서재
			if(m!=null) { // 세션에 넣어줌
				session.setAttribute("member", m); 
			}
		}else {
			m = new MemberService().selectOneMemberId(libraryOwner); // 남의 서재
		}
		
		if(m!=null) { // m 객체가 null이 아닐 때
		// 내 서재 리뷰 개수
		int count = rnService.countAllReview(m.getMemberNo());
		
		// 페이징 처리
		int currentPage; // 현재 페이지값을 가지고 있는 변수
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 리뷰 (리뷰테이블 + 도서 API / 멤버테이블 / 좋아요테이블)
		ReviewNotePageData rnpd = rnService.selectAllReviewDataAlignTitle(m.getMemberNo(),m.getMemberId(),currentPage);
		ArrayList<ReviewCard> list = rnpd.getList();
		String pageNavi = rnpd.getPageNavi(); // System.out.println(pageNavi);
		for(ReviewCard rc : list) {
			if(rc.getProfileImg()==null) {
				rc.setProfileImg("default_user_dark.png");
			}
			int likeCount = new ReviewService().countReviewLikePoint(rc.getReviewId());
			rc.setReviewLikeCount(likeCount);
		}
		
		
		CollectionService colService = new CollectionService();
		
		// 내 리뷰 컬렉션 데이터 가져오기
		ArrayList<ReviewCollection> rColList = colService.selectColReview(member.getMemberNo());
		
		// 내 서재 컬렉션 데이터 가져오기 / 남의 서재가 내 컬렉션에 있는지 확인
		boolean result =  colService.existsMyLibCol(member.getMemberNo(),m.getMemberId()); // 세션 No / Owner Id
		
		// 내가 좋아요 한 리뷰 리스트
		ArrayList<ReviewLike> rLikeList = new ReviewService().myReviewLikeList(member.getMemberNo());
				
		RequestDispatcher view = request.getRequestDispatcher("/views/library/review_note.jsp?libraryOwner="+libraryOwner);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageNavi", pageNavi); 
		request.setAttribute("member", m);
		request.setAttribute("rColList", rColList); // 리뷰 컬렉션
		request.setAttribute("inMyLibCol", result); // 서재 컬렉션
		request.setAttribute("rLikeList", rLikeList); // 내가 좋아요한 리뷰
		view.forward(request, response);
		
		}else { // m 객체가 null일 때 즉
			RequestDispatcher view = request.getRequestDispatcher("/views/library/member_load_fail.jsp");
			view.forward(request, response);
		}
		
		}else { // 로그인 안 했다면
			
			
			
			// 서재 주인
			String libraryOwner = request.getParameter("libraryOwner");
			
			Member m = new MemberService().selectOneMemberId(libraryOwner); // 남의 서재
			
			
			if(m!=null) { // m 객체가 null이 아닐 때
			// 내 서재 리뷰 개수
			int count = rnService.countAllReview(m.getMemberNo());
			
			// 페이징 처리
			int currentPage; // 현재 페이지값을 가지고 있는 변수
			if(request.getParameter("currentPage")==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// 리뷰 (리뷰테이블 + 도서 API / 멤버테이블 / 좋아요테이블)
			ReviewNotePageData rnpd = rnService.selectAllReviewData(m.getMemberNo(),m.getMemberId(),currentPage);
			ArrayList<ReviewCard> list = rnpd.getList();
			String pageNavi = rnpd.getPageNavi(); // System.out.println(pageNavi);
			for(ReviewCard rc : list) {
				if(rc.getProfileImg()==null) {
					rc.setProfileImg("default_user_dark.png");
				}
				int likeCount = new ReviewService().countReviewLikePoint(rc.getReviewId());
				rc.setReviewLikeCount(likeCount);
			}
			
			RequestDispatcher view = request.getRequestDispatcher("/views/library/review_note.jsp?libraryOwner="+libraryOwner);
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pageNavi", pageNavi); //System.out.println(pageNavi);
			request.setAttribute("member", m);
			view.forward(request, response);
			
			}else { // m 객체가 null일 때 즉, 탈퇴하거나 없는 회원
				RequestDispatcher view = request.getRequestDispatcher("/views/member/released_login.jsp");
				view.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
