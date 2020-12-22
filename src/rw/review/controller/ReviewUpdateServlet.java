package rw.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.member.model.vo.Member;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/reviewUpdate.rw")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reviewId = request.getParameter("reviewId");
		int reviewRate = Integer.parseInt(request.getParameter("reviewRate"));
		String reviewCont = request.getParameter("reviewCont");
		
		Review r = new Review();
		r.setReviewId(reviewId);
		r.setReviewRate(reviewRate);
		r.setReviewCont(reviewCont);
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String memberNo = m.getMemberNo();
		
		int result = new ReviewService().updateReview(memberNo,r);
		RequestDispatcher view = request.getRequestDispatcher("/views/review/review_modify_done.jsp");
		if(result>0) {
			request.setAttribute("result", true);
			request.setAttribute("reviewId", reviewId);
		}else {
			request.setAttribute("result", false);
		}
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
