package rw.admin.member.controller;

import java.io.IOException;
import java.sql.Date;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rw.admin.member.model.service.MemberSearchService;
import rw.admin.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.member.model.vo.MemberList;

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/searchMember.ad")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberSearchServlet() {
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
		
		Date enrollFrom;
		Date enrollTill;
		Date endFrom = null;
		Date endTill = null;
		
		
		

		//date 타입에 초기값 넣어주기. (사용자가 입력하지 않더라도 입력값을 디폴트로 넣어서 검색 > 쿼리의 양이 줄어들음) 
		//1. 가입일자 (항상 존재하기 때문에 default값 처리해도 됨) 
		if((request.getParameter("enrollFrom")).equals("")) {
			
			enrollFrom = Date.valueOf("1990-01-01");
			
		}else {
			
			enrollFrom = Date.valueOf(request.getParameter("enrollFrom"));
			
		}

		if((request.getParameter("enrollTill")).equals("")) {
			
			enrollTill = Date.valueOf(today);
			
		}else {
			
			enrollTill = Date.valueOf(request.getParameter("enrollTill"));
			
		}
		
		
		
		//2. 탈퇴일자
		if((request.getParameter("endFrom")).equals("")) { //검색기능때매 얘네는 좀 더 복잡하게 해야함 ㅡㅡ
			
			
			if((request.getParameter("endTill").equals(""))) {
				
				//둘 다 검색 비활성화 되어있음. 
				
				
			}else {//endTill만 넘어왔을 경우 초기(디폴트) ~ endTill까지.
				
				endFrom = Date.valueOf("1990-01-01");
				endTill = Date.valueOf(request.getParameter("endTill"));
			}
			
		}else {//endFrom 만 있을경우. 1. endFrom~지금까지 / 2.endFrom~endTill까지
			
			
			if((request.getParameter("endTill").equals(""))) { //endFrom~ 지금까지.
			
				endFrom = Date.valueOf(request.getParameter("endFrom"));
				endTill = Date.valueOf(today);
				
			
			}else { //2. endFrom~ endTill
				
			endFrom = Date.valueOf(request.getParameter("endFrom"));
			endTill = Date.valueOf(request.getParameter("endTill"));
		}
		
		
		}
		
		
		//Date enrollFrom = Date.valueOf(request.getParameter("enrollFrom"));
		//Date enrollTill = Date.valueOf(request.getParameter("enrollTill"));
		//Date endFrom = Date.valueOf(request.getParameter("endFrom"));
		//Date endTill = Date.valueOf(request.getParameter("endTill"));
		
		
		
		//System.out.println(category +"/"+keyword+"/"+enrollFrom+"/"+enrollTill+"/"+endFrom+"/"+endTill);
		
		
		//현재 페이지
		int currentPage = 0 ;
		
		if(request.getParameter("currentPage")==null) {
			
			currentPage = 1;
			
		}else {
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		MemberList ml = new MemberList();
		
		
		if(keyword.equals("")) { //키워드없음
			
			
			
			if(endTill==null) { //^^.. 가입일자만~
				
				
				ml = new MemberSearchService().searchMember(currentPage,enrollFrom,enrollTill);
				
				
				
			}else { //탈퇴 + 가입 
				
				ml = new MemberSearchService().searchMember(currentPage,enrollFrom,enrollTill,endFrom,endTill);
				
				
			}
			
			
			
		}else{
			
			
			if(endTill==null) { //가입일자+키워드
				
				ml = new MemberSearchService().searchMember(currentPage,category,keyword,enrollFrom,enrollTill);
				
				
				
			}else { //탈퇴검색 + 가입 + 키워드
				
				ml = new MemberSearchService().searchMember(currentPage,category,keyword,enrollFrom,enrollTill,endFrom,endTill);
				
				
			}
			
			
			
			
		}//else
		
		if(ml!=null) {
		
		RequestDispatcher view = request.getRequestDispatcher("/admin/member/member_search.jsp");
		request.setAttribute("memberList",ml);
		

		view.forward(request, response);
		
		}else{
			
		RequestDispatcher view = request.getRequestDispatcher("/admin/member/member_search_fail.jsp");
		view.forward(request, response);	
			
			
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
