package rw.library.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import rw.library.model.service.LibraryService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class LBCInsertBookCaseServlet
 */
@WebServlet("/addBookCase.rw")
public class LBCInsertBookCaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LBCInsertBookCaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LibraryService lService = new LibraryService();
		request.setCharacterEncoding("UTF-8");
		String libraryOwner = request.getParameter("libraryOwner");
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member!=null) {
			
			String[] addBookList = request.getParameterValues("addBookList");
			String bookCaseTitle = request.getParameter("bookCaseTitle");
			
			int result = lService.insertBookCase(member.getMemberNo(),addBookList,bookCaseTitle);
			
			
			JSONObject object = new JSONObject();
			if(result>0) {
				object.put("result", true);
			}else {
				object.put("result", false);
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(object);
		}else {
			// 비로그인자
			//RequestDispatcher view = request.getRequestDispatcher("/views/member/released_login.jsp");
			
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
