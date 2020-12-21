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
import rw.review.model.service.BookService;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.Book;
import rw.review.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/reviewWrite.rw")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //인코딩 부터
		
		//책정보
		String isbn = request.getParameter("isbn");
		String bookName = request.getParameter("bookName"); // 타이틀
		String bookAuthor = request.getParameter("author");
		String imageUrl = request.getParameter("imageUrl"); //도서 썸네일
		String[] isbnArray = isbn.split(" ");
		String bookId;
		if(isbnArray.length<2) {
			bookId = isbnArray[0];
		}else {
			bookId = isbnArray[1];
		}
		//도서DB에 넣을 데이터
		Book book = new Book();
		book.setBookId(bookId);
		book.setBookTitle(bookName);
		book.setBookAuthor(bookAuthor);
		book.setBookImage(imageUrl);
		
//		System.out.println(bookId);
//		System.out.println(bookName);
//		System.out.println(bookAuthor);
//		System.out.println(imageUrl);
		
		//리뷰정보
		int reviewRate = Integer.parseInt(request.getParameter("reviewRate"));
		String reviewCont = request.getParameter("reviewCont");
		
//		System.out.println(reviewRate);
//		System.out.println(reviewCont);
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String memberNo = m.getMemberNo();
		
		//리뷰 DB에 넣을 데이터
		Review rw = new Review();
		rw.setBookId(bookId);
		rw.setMemberNo(memberNo);
		rw.setReviewRate(reviewRate);
		rw.setReviewCont(reviewCont);
		
		//DB에 등록된 도서인지 확인
		boolean exist = new BookService().existsBookId(bookId);
		if(!exist) {//등록되어 있지 않으면
			int bResult = new BookService().insertBook(book); // 없으면 집어넣고 있으면 안넣음.
			if(bResult>0) {
				System.out.println("도서 DB 입력 완료");
			}else {
				System.out.println("도서 DB 입력 실패");
			}
		}
		//리뷰 DB에 등록 처리
		int result = new ReviewService().insertReview(rw);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/review/review_write_done.jsp");
		if(result>0) {
			request.setAttribute("result", true);
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
