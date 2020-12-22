package rw.review.controller;

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
import rw.member.model.vo.Member;
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
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		
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
		
		RequestDispatcher view = request.getRequestDispatcher("/views/review/review_list.jsp");
		request.setAttribute("list", list);
		request.setAttribute("end", end);
		if(member!=null) {
			// 내 컬렉션 데이터 가져오기
			ArrayList<ReviewCollection> rColList = new CollectionService().selectColReview(member.getMemberNo());
			request.setAttribute("rColList", rColList);
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
