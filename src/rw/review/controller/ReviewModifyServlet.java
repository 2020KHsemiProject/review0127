package rw.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.review.model.service.BookService;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.Book;
import rw.review.model.vo.BookReview;

/**
 * Servlet implementation class ReviewModifyServlet
 */
@WebServlet("/reviewModify.rw")
public class ReviewModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");
		String memberNo = request.getParameter("memberNo");
		
		BookReview br = new ReviewService().selectOneBookReview(reviewId,memberNo);
		Book b = new BookService().selectOneBook(br.getBookId());
		
		RequestDispatcher view = request.getRequestDispatcher("/views/review/review_modify.jsp");
		request.setAttribute("bookReview", br);
		request.setAttribute("book", b);
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
