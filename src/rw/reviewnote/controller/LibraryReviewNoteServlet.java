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

import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.vo.ReviewCard;
import rw.reviewnote.model.service.LibraryReviewNoteService;
import rw.reviewnote.model.vo.ReviewNotePageData;

/**
 * Servlet implementation class MyLibraryReviewNoteServlet
 */
@WebServlet("/myRivewNote.rw")
public class LibraryReviewNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibraryReviewNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LibraryReviewNoteService rnService = new LibraryReviewNoteService();
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		String memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		// System.out.println("[내 서재] 내 멤버고유번호 : "+memberNo);
		
		// 서재 주인
		String libraryOwner = request.getParameter("libraryOwner");
		
		Member m = new Member();
		if(memberId.equals(libraryOwner)) {
			m = rnService.selecAlltMyLibraryHeader(memberNo);  // 내 서재
			if(m.getProfileImg()==null) { // 이미지 이름
				m.setProfileImg("default_user_dark.png");
			}
			if(m!=null) { // 세션에 넣어줌
				session.setAttribute("member", m);
			}
		}else {
			m = new MemberService().selectOneMemberId(libraryOwner); // 남의 서재
			if(m.getProfileImg()!=null) { // 이미지 이름
				m.setProfileImg("default_user_dark.png");
			}
		}
		
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
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/library/review_note.jsp?libraryOwner="+libraryOwner);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageNavi", pageNavi); //System.out.println(pageNavi);
		request.setAttribute("member", m);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
