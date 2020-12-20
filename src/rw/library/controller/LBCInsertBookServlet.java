package rw.library.controller;

import java.io.IOException;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.library.model.service.LibraryService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class LBCInsertBookServlet
 */
@WebServlet("/addBookInCase.rw")
public class LBCInsertBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LBCInsertBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((Member)session.getAttribute("member")!=null) {
			String bookShelfId = request.getParameter("bookShelfId");
			String bookId = request.getParameter("bookId");
			new LibraryService().insertBookInCase(bookShelfId,bookId);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
