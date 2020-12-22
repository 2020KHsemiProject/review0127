package rw.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.admin.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.member.model.vo.MemberList;

/**
 * Servlet implementation class MemberSelectAllServlet
 */
@WebServlet("/selectAllMember.ad")
public class MemberSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		int currentPage ;
		
		if(request.getParameter("currentPage")==null)
		{
			currentPage = 1;
		}else
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		MemberList ml = new MemberService().selectAll(currentPage);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/member/member_board.jsp");
		request.setAttribute("memberList",ml);
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
