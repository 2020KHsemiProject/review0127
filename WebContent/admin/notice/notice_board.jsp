<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.notice.model.vo.NoticeList"%>
<%@ page import="rw.notice.model.vo.Notice"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<link href="/admin/common/common_wrapper.css" rel="stylesheet"
	type="text/css">
<link href="/admin/common/common_board.css" rel="stylesheet"
	type="text/css">
<link href="/admin/css/notice_board.css" rel="stylesheet"
	type="text/css">
<link href="/admin/css/notice_viewer.css" rel="stylesheet"
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

	<!-- js 외부파일 -->
	
	<script src="/admin/js/subnavbar.js"></script>
	<script src="/admin/js/notice_board.js"></script>
	
	<%
	
	Member admin = (Member)session.getAttribute("member");

	if(admin==null){
		
		response.sendRedirect("/admin/common/error/error.jsp");
		
	}

	
	NoticeList nl = (NoticeList)request.getAttribute("noticeList");
	ArrayList<Notice> list = nl.getList();
	String pageNavi = nl.getPageNavi();

%>
	
	

	<!-- 페이지 시작 -->
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
								d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" /> </svg></a>
						> 게시판 관리 > <a href="/selectAllNotice.ad">공지사항</a>
					</span>
				</div>
				<div class="page-contents">
					<div id="selectAllNotice" class="board-wrapper">
						<h3 id="board-title">공지사항</h3>
						<table class="search">
							<form action="/searchNotice.ad" method="get" id="search">
								<tr>
									<th>작성일</th>
									<td><input type="date" name="dateFrom"> ~ <input
										type="date" name="dateTill"></td>
								</tr>
								<tr>
									<th>키워드 검색</th>
									<td colspan="3"><select name="category">
											<option value="notice_title">제목</option>
                                    		<option value="notice_cont">글 내용</option>
									</select> <input type="text" name="keyword" />
										<button class="search-btn" type="submit">검색</button></td>
								</tr>
							</form>
						</table>
						<p></p>
						<p class="subtitle">전체 게시글 목록</p>
						<a href="/admin/notice/notice_write.jsp" class="insert-btn">글
							작성</a>

						<table class="board">
							<tr class="head">
								<th id="all_select"><input type="checkbox" /></th>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<%for(int i=0;i<list.size();i++){ //list 에 객체가 있을때 
         
                            	Notice n = list.get(i); %>
							<tr class="contents">
								<td class='select'><input type="checkbox"
									name="delete-select" value="<%=n.getNoticeNo() %>" /></td>
								<td class='notice-no'><%=n.getNoticeNo() %></td>
								<td class='notice-title'><span class="modal-tag" data-toggle="modal"
									data-target="#myLargeModal<%=n.getNoticeNo() %>"><%=n.getNoticeTitle() %></span></td>
								<td class='notice-date'><%=n.getNoticeDate() %></td>
								<td class='update'><button class="update-btn"
										data-toggle="modal"
										data-target="#myLargeModal<%=n.getNoticeNo() %>">수정</button></td>
								<td class='delete'>
									<%if(n.getDelYN()=='N'){%>
									<form action="/deleteNotice.ad" method="post"
										class="deleteNotice" style="border: 0px solid white">
										<input type="hidden" value="<%=n.getNoticeNo() %>"
											name="noticeNo">
										<button type="submit" class="delete-btn">삭제</button>
									</form> <%}else{%>
									<form action="/restoreNotice.ad" method="post"
										class="restoreNotice" style="border: 0px solid white">
										<input type="hidden" value="<%=n.getNoticeNo() %>"
											name="noticeNo">
										<button type="submit" class="restore-btn">복구</button>
									</form> <%} %>
								</td>
							</tr>

							<div class="modal fade" id="myLargeModal<%=n.getNoticeNo() %>"
								tabindex="-1" aria-labelledby="myLargeModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<p class="w-100 modal-title text-center" id="modalLabel">
												<svg width="1em" height="1em" viewBox="0 0 16 16"
													class="bi bi-book-half" fill="#4D5AC8"
													xmlns="http://www.w3.org/2000/svg"> <path
													fill-rule="evenodd"
													d="M8.5 2.687v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
												</svg>
												&nbsp;&nbsp;공지사항
											</p>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form action ="/updateNotice.ad" method="post">
										<div class="modal-body">
											<div class='row' id="viewer-title">
												<div class='viewer-column col-3'>글 제목</div>
												<div class='viewer-info col-9'>
													<input type="text" value="<%=n.getNoticeTitle() %>" name="noticeTitle"/>
												</div>
											</div>
											<div class='row' id='viewer-contents'>
												<div class='viewer-column col-3'>글 내용</div>
												<div class='viewer-info col-9'>
													<textarea name="noticeCont"><%=n.getNoticeCont() %></textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<center>
											<input type="hidden" value="<%=n.getNoticeNo() %>" name="noticeNo"/>
											<button type="submit" class="btn btn-primary update-btn">수정</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											</center>
										</div>
										</form>
									</div>
								</div>
							</div>
							<%
                            
                            } //for
                            for(int i=0;i<(10-list.size());i++){ //list가 empty 일때 	빈 공간채워줘야함%>
							<tr class="contents">
								<td class='select' style="height: 40px;"></td>
								<td class='notice-no'></td>
								<td class='notice-title'></td>
								<td class='notice-date'></td>
								<td class='update'></td>
								<td class='delete'></td>
							</tr>
							<% 
                            }//list에 없을때.
                            %>

						</table>
						<p></p>
						<div>
							<div>
								<form action="/deleteNoticeList.ad" method="get"
									id="deleteNoticeList">
									<input type="hidden" name="noticeNoArr" />
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