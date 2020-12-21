package rw.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.review.model.service.ReviewService;
import rw.review.model.vo.ReviewCard;

/**
 * Servlet implementation class ReviewSelectAllServlet
 */
@WebServlet("/reviewPage.rw")
public class ReviewSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int end;
		if(request.getParameter("end")==null) {
			end=12;
		}else {
			end=Integer.parseInt(request.getParameter("end"))+6;
		}
		ArrayList<ReviewCard> list = new ReviewService().selectAllReview(end);
		for(ReviewCard rc : list) {
			if(rc.getProfileImg()==null) {
				rc.setProfileImg("default_user_dark.png");
			}
		}
		String moreLocal = request.getParameter("moreLocal"); //System.out.println(moreLocal);
		String jspLink;
		if(request.getParameter("moreLocal")==null) {
			jspLink = "/views/review/review_list.jsp";
		}else {
			jspLink = "/views/review/review_list.jsp#"+moreLocal;
		}
		RequestDispatcher view = request.getRequestDispatcher(jspLink);
		request.setAttribute("list", list);
		request.setAttribute("end", end);
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
