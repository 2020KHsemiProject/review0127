<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="rw.inquiry.model.vo.Inquiry" %>
	<%@ page import ="rw.inquiry.model.vo.InquiryList" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/admin/common/common_wrapper.css" rel="stylesheet" type="text/css">
<link href="/admin/common/common_board.css" rel="stylesheet" type="text/css">
<link href="/admin/css/inquiry_board.css" rel="stylesheet" type="text/css">
<link href="/admin/css/inquiry_viewer.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script src="/admin/js/subnavbar.js"></script>
<script src="/admin/js/inquiry_board.js"></script>


<%

Member admin = (Member)session.getAttribute("member");

if(admin==null){
	
	response.sendRedirect("/admin/common/error/error.jsp");
	
}



InquiryList il = (InquiryList)request.getAttribute("inquiryList");
ArrayList <Inquiry> list = il.getList();
String pageNavi = il.getPageNavi();

%>
	<div class="page-wrapper">
		<div class="admin-header">
			<%@include file="/admin/common/elements/admin_header.jsp" %>
		</div>
		<div class="body-container">
			<div class="nav-snb">
				<%@ include file="/admin/common/elements/admin_subnavbar.jsp" %>	
			</div>
			<div class="page-container">
				<div class="page-header">
					<span class="lnb"> <a href="/admin/main_page.jsp"><svg
								width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-house-door-fill" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg"> <path
								d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
							<path fill-rule="evenodd"
								d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" /> </svg> >
							<a href="/selectAllInquiry.ad">1대1 문의 관리</a></span>
				</div>
				<div class="page-contents">
					<div id="admin_member_board" class="board-wrapper">
						<h3 id="board-title">1대1 문의 관리</h3>
						<table class="search">
							<form action="/searchInquiry.ad" method="get" id="search">
								<tr>
									<th>작성일</th>
									<td><input type="date" name="dateFrom"> ~ <input
										type="date" name="dateTill"></td>
								</tr>
								<tr>
									<th>키워드 검색</th>
									<td colspan="3"><select name="category">
											<option value="inquiry_title">제목</option>
                                    		<option value="inquiry_cont">글 내용</option>
                                    		<option value="member_id">작성자</option>
                                    		<option value="reply_email">이메일</option>
									</select> <input type="text" name="keyword" />
										<button class="search-btn" type="submit">검색</button></td>
								</tr>
							</form>
						</table>
						<p></p>			

						<p>전체 게시글 목록</p>
						<table class="board">
							<tr class="head">
								<th id="all_select"><input type="checkbox" /></th>
								<th>번호</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변완료</th>
								<th>삭제</th>
							</tr>
							<%for(int i=0;i<list.size();i++){
								Inquiry in = list.get(i);
								%>
							<tr class="contents">
								<td class='select'><input type="checkbox" name="delete-select" value="<%=in.getInquiryNo() %>" /></td>
								<td class='inquiry-no'><%=in.getInquiryNo() %></td>
								<td class='member-id'><%=in.getMemberId() %></td>
								<td class='reply-email'><%=in.getReplyEmail() %></td>
								<td class='inquiry-title'><a data-toggle="modal" data-target="#myLargeModal<%=in.getInquiryNo() %>"><%=in.getInquiryTitle() %></a></td>
								<td class='inquiry-date'><%=in.getInquiryDate() %></td>
								<td class='reply-yn'>
										<%if(in.getReplyYN()=='N'){	%>
										<a href="/selectOneInquiry.ad?inquiryNo=<%=in.getInquiryNo() %>" class="state-n">답변대기</a>
										<%}else{ %>
										<p class="state-y">답변완료</p>
										<%} %> 
									</td>
								<td class='delete'>
								<%if(in.getDelYN()=='N'){%>
									<form action="/deleteInquiry.ad" method="post"
										class="deleteInquiry" style="border: 0px solid white">
										<input type="hidden" value="<%=in.getInquiryNo() %>"
											name="inquiryNo">
										<button type="submit" class="delete-btn">삭제</button>
									</form> <%}else{%>
									<form action="/restoreInquiry.ad" method="post"
										class="restoreInquiry" style="border: 0px solid white">
										<input type="hidden" value="<%=in.getInquiryNo() %>"
											name="inquiryNo">
										<button type="submit" class="restore-btn">복구</button>
									</form> <%} %></td>
							</tr>
	<!-- 모달 -->				
			
	<div class="modal fade" id="myLargeModal<%=in.getInquiryNo() %>" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <p class="w-100 modal-title text-center" id="modalLabel"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-book-half" fill="#4D5AC8" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M8.5 2.687v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
          </svg>&nbsp;&nbsp;문의 내역</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class='row' id="viewer-id">
            <div class='viewer-column col-3'>아이디</div>
            <div class='viewer-info col-9'><input type="text" value="<%=in.getMemberId() %>"/></div>
        </div>
        <div class='row' id="viewer-email">
            <div class='viewer-column col-3'>이메일</div>
            <div class='viewer-info col-9'><input type="text" value="<%=in.getReplyEmail() %>"/></div>
        </div>
        <div class='row' id="viewer-category">
            <div class='viewer-column col-3'>문의유형</div>
            <div class='viewer-info col-9'><input type="text" value="<%=in.getCategory() %>"/></div>
        </div>
        <div class='row' id="viewer-title">
            <div class='viewer-column col-3'>문의제목</div>
            <div class='viewer-info col-9'><input type="text" value="<%=in.getInquiryTitle() %>"/></div>
        </div>
        <div class='row' id='viewer-contents'>
            <div class='viewer-column col-3'>문의내용</div>
            <div class='viewer-info col-9'><textarea><%=in.getInquiryCont() %></textarea></div>
        </div>
      </div>
      <div class="modal-footer">
	<form action="/selectOneInquiry.ad" method="get">
	<input type="hidden" value="<%=in.getInquiryNo() %>" name="inquiryNo" />
	<input type="hidden" value="<%=in.getReplyEmail() %>" name="replyEmail" />
	<% if(in.getReplyYN()=='Y'){%>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">답변완료</button>
	<%}else{%>
	<button type="submit" class="btn btn-primary update-btn">답변하기</button>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	<%} %>
	</form>
	</div>
    </div>
  </div>
</div>
		<% } //for%>
							
							<%
								for (int i = 0; i < (10 - list.size()); i++) { //list가 empty 일때 	빈 공간채워줘야함
							%>
							<tr class="contents">
								<td class='select' style="height: 40px;"></td>
								<td class='inquiry-no'></td>
								<td class='member-id'></td>
								<td class='reply-email'></td>
								<td class='inquiry-title'></td>
								<td class='inquiry-date'></td>
								<td class='reply-yn'></td>
								<td class='delete'></td>
							</tr>
							<%}//for문 %>
						</table>
						<p></p>
						<div>
							<div>
								<form action="/deleteInquiryList.ad" method="get"
									id="deleteInquiryList">
									<input type="hidden" name="inquiryNoArr" />
									<button class="btn-bottom" type="submit">선택삭제</button>
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