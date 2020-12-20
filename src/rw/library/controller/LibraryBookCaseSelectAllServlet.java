package rw.library.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.library.model.service.LibraryService;
import rw.library.model.vo.LibraryPageData;
import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.vo.Book;

/**
 * Servlet implementation class myBookCaseSelectAllServlet
 */
@WebServlet("/myBookCase.rw")
public class LibraryBookCaseSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibraryBookCaseSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member!=null) {
		LibraryService lService = new LibraryService();
		String libraryOwner = request.getParameter("libraryOwner");
		
		Member m = new MemberService().selectOneMemberId(libraryOwner);
		int count = 0; // 책장 개수
		
		
		if(m!=null) {
			count = lService.countAllBookCase(m.getMemberNo()); // 책장 개수
			
			// 페이징 처리
			int currentPage; // 현재 페이지값을 가지고 있는 변수
			if(request.getParameter("currentPage")==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			LibraryPageData list = lService.selectAllBookCase(m.getMemberNo(),libraryOwner,currentPage);
			// 최종적으로 list 안에 담긴 데이터 = (책장 + 해당 책장에 담긴 책들) 객체를 담은 BookCase 객체// 배열
			
			ArrayList<Book> listLB = lService.selectLikeBook(m.getMemberNo()); // 좋아요 한 책 리스트
			
			
			RequestDispatcher view = request.getRequestDispatcher("/views/library/book_case.jsp?libraryOwner="+libraryOwner);
			request.setAttribute("member", m);
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("listLB", listLB);
			view.forward(request, response);
		}else {///////////////////////// 서재주인 m 객체가 없으면
			//실패 페이지
			RequestDispatcher view = request.getRequestDispatcher("/views/library/member_load_fail.jsp");
			view.forward(request, response);
		}
		}else { /////////////// 로그인을 하지 않았다면
			RequestDispatcher view = request.getRequestDispatcher("/views/library/library_read_fail.jsp");
			view.forward(request, response);
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
