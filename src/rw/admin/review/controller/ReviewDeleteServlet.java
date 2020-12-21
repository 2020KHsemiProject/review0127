package rw.admin.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/deleteReview.ad")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//리뷰 테이블에서만 업데이트 해주면 됨
		
		String reviewId = request.getParameter("reviewId");
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int result = new ReviewService().deleteReview(reviewId);
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/review/review_delete_result.jsp");
		
		
		if(result>0) {
			
			request.setAttribute("result", true);
			request.setAttribute("currentPage", currentPage);
			
		}else {
			
			request.setAttribute("result", false);
			request.setAttribute("currentPage", currentPage);
			
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
