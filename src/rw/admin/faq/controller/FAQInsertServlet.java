package rw.admin.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.faq.model.service.FAQService;

/**
 * Servlet implementation class InsertFaqServlet
 */
@WebServlet("/insertFAQ.ad")
public class FAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 자바코드로 저장
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		// 3. 비지니스 로직 처리
		int result = new FAQService().insertFAQ(title, content);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result > 0) {
			out.println("<script>alert('작성이 완료되었습니다.');</script>");
			out.println("<script>location.replace('/admin/faq/faq_board.jsp');</script>");

		} else {
			out.println("<script>alert('작성을 실패하였습니다. \\n지속적인 문제 발생시 개발자에게 문의해주세요.');</script>");
			out.println("<script>history.back(-1);</script>");
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
