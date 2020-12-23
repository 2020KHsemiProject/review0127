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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/modifyInfo.rw")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberPwd = request.getParameter("memberPwd");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		if(memberPwd.equals(m.getMemberPwd())) {
			String memberId = request.getParameter("memberId");
			String nickName = request.getParameter("nickName");
			int birthYear = Integer.parseInt(request.getParameter("birthYear"));
			char gender = request.getParameter("gender").charAt(0);
			
			System.out.println(memberId+"/"+nickName+"/"+birthYear+"/"+gender);
			
			m.setMemberId(memberId);
			m.setNickname(nickName);
			m.setBirthYear(birthYear);
			m.setGender(gender);
			
			int result = new MemberService().updateMember(m);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/member/memberUpdateResult.jsp");
			if(result > 0) {
				request.setAttribute("result", true);
			} else {
				request.setAttribute("result", false);
			}
			view.forward(request, response);
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			
			out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.print("<script>location.replace('/views/member/modify_info.jsp');<script>");
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
