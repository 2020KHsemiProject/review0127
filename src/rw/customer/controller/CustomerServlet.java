package rw.customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.faq.model.vo.FAQ;
import rw.customer.model.service.CustomerService;
import rw.notice.model.vo.Notice;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/customer_center.rw")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Notice> nl = new CustomerService().selectNotice();
		
		int end;
		if(request.getParameter("more")==null) {
			end=5;
			request.setAttribute("add", false);
		}else {
			end=Integer.parseInt(request.getParameter("more"))+5;
			request.setAttribute("add", true);
		}
		ArrayList<FAQ> fl = new CustomerService().selectFAQ(end);

		RequestDispatcher view = request.getRequestDispatcher("/views/service_center/customer_center.jsp");		
		
		//이미 있는 vo와 혼동하지 않아야함 .. 임의적으로 명칭 지은 것. 
		//기존 List VO 는 네비 + list 
		request.setAttribute("noticeList", nl);
		request.setAttribute("faqList", fl);
		
		//여기가 더보기 버튼을 눌렀을때 호출되는 서블릿이죠? 네 저 위에 end값으로 해줫어요
		//그러면 만약 버튼을 클릭해서 추가가 되는 경우에는 별도의 추가되었을때 값을 보내주는거에요
		
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