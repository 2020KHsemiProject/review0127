package rw.admin.inquiry.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.inquiry.model.service.InquirySearchService;
import rw.inquiry.model.vo.InquiryList;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/searchInquiry.ad")
public class InquirySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquirySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		/* $=till 이 null 일때 date 에 데이트를 넣을 방법 ~지금시간까지*/
		
		
		Calendar cal = Calendar.getInstance();
		
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String today = (year+"-"+(month+1)+"-"+day);
		
		
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		Date dateFrom;
		Date dateTill;
		
		
		//date 타입에 초기값 넣어주기. (사용자가 입력하지 않더라도 입력값을 디폴트로 넣어서 검색 > 쿼리의 양이 줄어들음) 
		//1. 가입일자 (항상 존재하기 때문에 default값 처리해도 됨) 
		
		if((request.getParameter("dateFrom")).equals("")) {
			
			dateFrom = Date.valueOf("1990-01-01");
			
		}else {
			
			dateFrom = Date.valueOf(request.getParameter("dateFrom"));
			
		}

		if((request.getParameter("dateTill")).equals("")) {
			
			dateTill = Date.valueOf(today);
			
		}else {
			
			dateTill = Date.valueOf(request.getParameter("dateTill"));
			
		}
		
		
		//현재 페이지
		int currentPage = 0 ;
		
		if(request.getParameter("currentPage")==null) {
			
			currentPage = 1;
			
		}else {
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		InquiryList il = new InquiryList();
		
		
		if(keyword.equals("")) { //키워드없음
			
			
				il = new InquirySearchService().searchInquiry(currentPage,dateFrom,dateTill);
				
			
			
		}else{
			
				
				il = new InquirySearchService().searchInquiry(currentPage,category,keyword,dateFrom,dateTill);
				
				
				
		}
			
			
		
		if(il!=null) {
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/inquiry/inquiry_search.jsp");
		request.setAttribute("inquiryList",il);
		

		view.forward(request, response);
		
		}else{
			
		RequestDispatcher view = request.getRequestDispatcher("/admin/inquiry/inquiry_search_fail.jsp");
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
