package rw.admin.inquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.inquiry.model.service.InquiryService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/deleteInquiry.ad")
public class InquiryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
		
		int result = new InquiryService().deleteInquiry(inquiryNo);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/inquiry/inquiry_delete_result.jsp");
		
		
		
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
