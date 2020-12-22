package rw.col.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.col.model.service.CollectionService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class BookshelfCollectionDeleteServlet
 */
@WebServlet("/boolshelfCollectionRemove2.rw")
public class BookshelfCollectionDeleteServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshelfCollectionDeleteServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookshelfId = request.getParameter("bookshelfId");
		String ownerId = request.getParameter("ownerId"); //책장에서 작업 필요
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		int result = new CollectionService().deleteBookshelfCollection(m.getMemberNo(),bookshelfId);
		RequestDispatcher view = request.getRequestDispatcher("/views/library/bscol_remove_done2.jsp");
		if(result>0) {
			request.setAttribute("result", true);
		}else {
			request.setAttribute("result", false);
		}
		request.setAttribute("ownerId",ownerId);
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
