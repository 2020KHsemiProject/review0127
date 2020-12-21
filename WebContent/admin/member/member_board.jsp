<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member"%>
<%@ page import="rw.member.model.vo.MemberList"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/admin/common/common_wrapper.css" rel="stylesheet"
	type="text/css">
<link href="/admin/common/common_board.css" rel="stylesheet"
	type="text/css">
<link href="/admin/css/member_board.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		
	<script src="/admin/js/subnavbar.js"></script>
	<script src="/admin/js/member_board.js"></script>	

<%


//로그인 안한사람 url만으로 접근할 수 없게하기
Member admin = (Member)session.getAttribute("member");

if(admin==null){
	
	response.sendRedirect("/admin/common/error/error.jsp");
	
}


MemberList ml = (MemberList)request.getAttribute("memberList");
ArrayList <Member> list = ml.getList();
String pageNavi = ml.getPageNavi();

%>


	
	<div class="page-wrapper">
		<div class="admin-header">
			<%@ include file="/admin/common/elements/admin_header.jsp" %>
		</div>
		<div class="body-container">
			<div class="nav-snb">
				<%@ include file="/admin/common/elements/admin_subnavbar.jsp" %>	
			</div>
			<div class="page-container">
				<div class="page-header">
					<span class="lnb"> <a href="/main.ad"><svg
								width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-house-door-fill" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg"> <path
								d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
							<path fill-rule="evenodd"
								d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" /> </svg></a> >
						<a href="/selectAllMember.ad">회원관리</a>
					</span>
				</div>
				<div class="page-contents">
					<div id="selectAllMember" class="board-wrapper">
						<h3 id="board-title">회원 관리</h3>
						<table class="search">
							<form action="/searchMember.ad" method="get" id="search">
								<tr>
									<th>가입일자</th>
									<td><input type="date" name="enrollFrom"> ~ <input
										type="date" name="enrollTill"></td>
									<th>탈퇴일자</th>
									<td><input type="date" name="endFrom"> ~ <input
										type="date" name="endTill"></td>
								</tr>
								<tr>
									<th>조건 검색</th>
									<td colspan="3"><select name="category">
											<!-- 이대로 value 값을 db에 넣을거라서 db컬럼명과 똑같이해줘야함 -->
											<option value="member_No">회원번호</option>
											<option value="member_Id">아이디</option>
											<option value="nickname">닉네임</option>
									</select>
									<input type="text" name="keyword" />
										<button class="search-btn" type="submit">검색</button></td>
								</tr>
							</form>
						</table>
						<p></p>
						<p>전체 회원 목록</p>
						<table class="board">
							<tr class="head">
								<th id="all_select"><input type="checkbox" /></th>
								<th>번호</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>생년</th>
								<th>성별</th>
								<th>이메일</th>
								<th>인증현황</th>
								<th>가입일자</th>
								<th>탈퇴일자</th>
								<th>회원유형</th>
								<th>기능</th>
							</tr>
							<%for(int i=0;i<list.size();i++){ //list 에 객체가 있을때 
         
                            	Member m = list.get(i); %>
							<tr class="contents">
								<td class='select'><input type="checkbox" value="<%=m.getEmail()%>" name="send-select"/></td>
								<td class='member-no'><%=m.getMemberNo() %></td>
								<td class='member-id'><%=m.getMemberId() %></td>
								<td class='nickname'><%=m.getNickname() %></td>
								<td class='birth-year'><%=m.getBirthYear() %></td>
								<td class='gender'>
									<%
                                if(m.getGender()=='F'){
                                	%> 여성 <%}else{%> 남성 <%}%>
								</td>
								<td class='email'><%=m.getEmail() %></td>
								<td class='email-yn'>
									<%
                                if(m.getEmailYN()=='Y'){%> 인증완료 <%}else{ %>

									대기중 <%} %>
								</td>
								<td class='enroll-date'><%=m.getEnrollDate() %></td>
								<td class='end-date'>
									<%
                                if(m.getEndDate()==null){%>
                                	
                                	-
                                	
                             <%   }else{ %> <%= m.getEndDate() %> <%} %>
								</td>

								<td class="member-type">
									<%
                                if(m.getEndYN()=='Y'){%> 탈퇴회원 <% }else{
                               if(m.getMemberNo().equals("M0001")){
                               %> 관리자 <%}else{ %> 일반회원 <%} } %>
								</td>
								<td class="function">
									<%if(m.getEndYN()=='Y'){%>
									<form class="restoreMember" action="/restoreMember.ad"
										method="post" style="border: 0px solid white;">
										<input type="hidden" value="<%=m.getMemberNo() %>" name="memberNo" /> <input
											type="hidden" value="<%=m.getMemberId() %>" name="memberId" /> <input
											type="submit" class="restore-btn" value="복구">
									</form> <% }else{ %>
									<form class="withdrawMember" action="/withdrawMember.ad"
										method="post" style="border: 0px solid white;">
										<input type="hidden" value="<%=m.getMemberNo() %>" name="memberNo" /> <input
											type="hidden" value="<%=m.getMemberId() %>" name="memberId" /> <input
											type="submit" class="withdraw-btn" value="탈퇴">
									</form> <%}%>
								</td>
							</tr>
							<%
                            
                            } //for
                            for(int i=0;i<(10-list.size());i++){ //list가 empty 일때 	빈 공간채워줘야함%>

							<tr class="contents">
								<td class='select'><input type="checkbox" /></td>
								<td class='member-no'></td>
								<td class='member-id'></td>
								<td class='nickname'></td>
								<td class='birth-year'></td>
								<td class='gender'></td>
								<td class='email'></td>
								<td class='email-yn'></td>
								<td class='enroll-date'></td>
								<td class='end-date'></td>
								<td class="member-type"></td>
								<td class="function"></td>
							</tr>
							<% 
                            }//list에 없을때.
                            %>
						</table>
						<p></p>
						<div>
							<div>
								<form action="/authenticationMemberList.ad" method="get"
									id="emailList">
									<input type="hidden" name="emailArr" />
									<button class="btn-bottom" type="submit">인증 이메일 발송</button>
								</form>
							</div>
							<div>
								<nav aria-label="Page navigation example" class="fnb">
								<ul class="pagination">
									<%=pageNavi %>
								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>