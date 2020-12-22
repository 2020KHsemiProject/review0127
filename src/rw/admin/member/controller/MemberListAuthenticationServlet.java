package rw.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.common.MailAuthentication;




/**
 * Servlet implementation class MailListVerificationServlet
 */
@WebServlet("/authenticationMemberList.ad")
public class MemberListAuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListAuthenticationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mailList = request.getParameter("emailArr");
		StringTokenizer st = new StringTokenizer(mailList,",");
		ArrayList <String> memberList = new ArrayList();
		
		int result = 0;
		
		for(int i=0;st.hasMoreTokens();i++) {
			
			memberList.add(st.nextToken());
			
		}
		
		
		for(String email : memberList) {
			
			
			result = result + new MailAuthentication().sendMail(email); 
			
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/member/member_authentication_result.jsp");
		
		if(result==memberList.size()) {
			
			request.setAttribute("result", true);
			
			
			
		}else {
			
			request.setAttribute("result", false);
			
		}
		
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
