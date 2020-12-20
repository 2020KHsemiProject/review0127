package rw.admin.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.notice.model.service.NoticeService;
import rw.notice.model.vo.Notice;
import rw.notice.model.vo.NoticeList;

/**
 * Servlet implementation class NoticeSelectAllServlet
 */
@WebServlet("/selectAllNotice.ad")
public class NoticeSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectAllServlet() {
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
		
		
		NoticeList nl = new NoticeService().selectAll(currentPage);
		RequestDispatcher view = request.getRequestDispatcher("/admin/notice/notice_board.jsp");
		request.setAttribute("noticeList", nl);
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
