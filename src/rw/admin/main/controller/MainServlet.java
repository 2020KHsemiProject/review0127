package rw.admin.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.main.model.service.MainService;
import rw.faq.model.vo.FAQ;
import rw.inquiry.model.vo.Inquiry;
import rw.notice.model.vo.Notice;
import rw.review.model.vo.ReviewAdmin;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.ad")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList <ReviewAdmin> rl = new MainService().selectReview();
		ArrayList <Inquiry> il = new MainService().selectInquiry();
		ArrayList <Notice> nl = new MainService().selectNotice();
		ArrayList <FAQ> fl = new MainService().selectFAQ();
		
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/main_page.jsp");
		
		
		//이미 있는 vo와 혼동하지 않아야함 .. 임의적으로 명칭 지은 것. 
		//기존 List VO 는 네비 + list 
		request.setAttribute("reviewList", rl);
		request.setAttribute("inquiryList", il);
		request.setAttribute("noticeList", nl);
		request.setAttribute("faqList", fl);
	
		
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
