package rw.review.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.member.model.vo.Member;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.ReviewCard;

/**
 * Servlet implementation class ReviewSelectOneServlet
 */
@WebServlet("/reviewRead.rw")
public class ReviewSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");
		ReviewService rService = new ReviewService();
		//리뷰 정보 로드
		ReviewCard rc = rService.selectOneReviewCard(reviewId);
		int reviewCount = rc.getReviewCount();
		rc.setReviewCount(++reviewCount); //1회 증가시켜서 넣고
		//조회수 증가처리 : 증가시킨값으로 업뎃하러 고! 그러면 1번만 접근하면 됨.
		int result = rService.addViewCount(reviewId,rc.getReviewCount());
		if(result<=0) {//처리가 안된 경우만
			System.out.println("조회수 업로드에 실패했습니다.");
		}
		
		//리뷰 좋아요 갯수 데이터
		int count = rService.selectOneReviewLike(reviewId);
		
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		//로그인한 사람의 좋아요 여부 : 로그인한 사람 + 컬렉션 소유주
		char likeYN = 'N';
		if(m!=null) {
			likeYN = rService.selectMyReviewLike(m.getMemberNo(),reviewId);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/review/review_detail.jsp");
		request.setAttribute("reviewCard", rc);
		request.setAttribute("likeCount", count);
		request.setAttribute("likeYN", likeYN);
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
