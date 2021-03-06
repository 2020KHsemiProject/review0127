package rw.admin.inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.inquiry.model.service.InquiryService;
import rw.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquirySelectOneServlet
 */
@WebServlet("/selectOneInquiry.ad")
public class InquirySelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InquirySelectOneServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 파라미터값 가져오기
		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));

		// 2. 비지니스 로직
		Inquiry inquiry = new InquiryService().selectOne(inquiryNo);

		// Controller에서 service를 호출 하는데 하나의 서비스에서 글의 내용 + 댓글을 가져오도록 구현 할 것인지 아니면,
		// Controller에서 2개의 service 메소드를 호출해서 각각의 글의 내용 / 댓글을 따로 가져오도록 구현할 것인지 선택

		// 3.결과처리
		if (inquiry != null) {
			// 정상적으로 게시물을 읽어왔다면
			RequestDispatcher view = request.getRequestDispatcher("/admin/inquiry/inquiry_write.jsp");
			request.setAttribute("inquiry", inquiry);
			view.forward(request, response);

		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/thml); charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 게시물은 삭제되었거나 없는 게시물입니다.');</script>");
			out.println("<script>history.back(-1);</script>");
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
