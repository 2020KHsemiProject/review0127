
package rw.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class MemberLogrinServlet
 */
@WebServlet("/memberLogin.rw")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		System.out.println("request : "+memberId+"/"+memberPwd);
		
		Member m = new MemberService().loginMember(memberId,memberPwd);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		PrintWriter out = response.getWriter();
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			
			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
			request.setAttribute("member", m);
			view.forward(request, response);
		}else {
			out.println("<script>alert('로그인에 실패하였습니다.');</script>");
			out.println("<script>location.repalce('/views/member/login.jsp');</script>");
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
