package rw.admin.faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.faq.model.service.FAQService;
import rw.faq.model.vo.FAQList;

/**
 * Servlet implementation class NoticeSelectAllServlet
 */
@WebServlet("/selectAllFAQ.ad")
public class FAQSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			
			currentPage = 1;
			
		}else {
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		
		FAQList fl = new FAQService().selectAll(currentPage);
		RequestDispatcher view = request.getRequestDispatcher("/admin/faq/faq_board.jsp");
		request.setAttribute("FAQList", fl);
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
