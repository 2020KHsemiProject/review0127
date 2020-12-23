package rw.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.member.model.service.MemberService;

/**
 * Servlet implementation class EmailUpdateServlet
 */
@WebServlet("/emailUpdate.rw")
public class EmailUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		
		int result = new MemberService().updateEmail(email);
	
		response.setCharacterEncoding("UTF-8"); 		
		response.setContentType("text/html; charset=UTF-8"); 	
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			new MemberService().updateEmail(email);
			out.print("<script>alert('이메일 인증이 완료되었습니다.');</script>");
			out.print("<script>location.replace('/main');</script>");
		} else {
			out.print("<script>alert('이메일 인증이 정상적으로 처리되지 않았습니다.(지속적인 문제 발생 시 관리자에게 문의해주세요.)');</script>");
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
