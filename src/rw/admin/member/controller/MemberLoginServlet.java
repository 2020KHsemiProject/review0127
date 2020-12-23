package rw.admin.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.admin.member.model.service.MemberService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet1
 */
@WebServlet("/loginMember.ad")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이전 페이지에서 보내준 값 servlet에서 받기
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");

		// 비지니스 로직 처리
		Member m = new MemberService().memberLogin(adminId, adminPwd);

		// 3. 결과 출력
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (m != null) {
			
			//12월 20일 보경 수정 
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			RequestDispatcher view = request.getRequestDispatcher("/main.ad");
			view.forward(request, response);

		} else {
			out.println("<script>alert('로그인 실패 \\nID 또는 PW를 확인해주세요');</script>");
			out.println("<script>location.replace('/admin/login.jsp');</script>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
