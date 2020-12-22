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
 * Servlet implementation class LibraryBookCaseUpdateTitleServlet
 */
@WebServlet("/bookCaseModifyTitle.rw")
public class LBCUpdateTitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LBCUpdateTitleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bookShelfId = request.getParameter("bookShelfId");
		String titleName = request.getParameter("titleName");
		//System.out.println("1. "+bookShelfId+" / "+titleName);
		HttpSession session = request.getSession();
		String memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		//System.out.println("2. "+memberNo);
		int result = new LibraryService().updateTitle(memberNo,bookShelfId,titleName);
		
		JSONObject object = new JSONObject();
		
		if(result>0) {
			object.put("updateTitle", titleName);
		}else {
			
		}
		response.setContentType("application/json");
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(object);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}