<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.review.model.vo.ReviewAdmin"%>
<%@ page import="rw.review.model.vo.ReviewList"%>
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
<link href="/admin/css/review_board.css" rel="stylesheet"
	type="text/css">
<link href="/admin/css/review_viewer.css" rel="stylesheet"
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css" integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css" integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2" crossorigin="anonymous">

	
	<script src="/admin/js/subnavbar.js"></script>
	<script src="/admin/js/review_board.js"></script>

<%

	Member admin = (Member)session.getAttribute("member");

	if(admin==null){
	
	response.sendRedirect("/admin/common/error/error.jsp");
	
	}

	ReviewList rl = (ReviewList) request.getAttribute("reviewList");
	ArrayList<ReviewAdmin> list = rl.getList();
	String pageNavi = rl.getPageNavi();
	%>



	<div class="page-wrapper">
		<div class="admin-header">
			<%@ include file="/admin/common/elements/admin_header.jsp" %>
		</div>
		<div class="body-container">
			<div class="nav-snb">
				<%@include file="/admin/common/elements/admin_subnavbar.jsp" %>	
			</div>
			<div class="page-container">
				<div class="page-header">
					<span class="lnb"> <a href="/main.ad"><svg
								width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-house-door-fill" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg"> <path
								d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
							<path fill-rule="evenodd"
								d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" /> </svg>
					</a> > 게시판 관리 > <a href="/selectAllReview.ad">리뷰게시판</a>
					</span>
				</div>
				<div class="page-contents">
					<div id="admin_member_board" class="board-wrapper">
						<h3 id="board-title">리뷰 게시판</h3>
						<table class="search">
							<form action="/searchReview.ad" method="get" id="search">
							<tr>
								<th>작성일</th>
								<td><input type="date" name="dateFrom"> ~ 
								<input type="date" name="dateTill"></td>
							</tr>
							<tr>
								<th>키워드 검색</th>
								<td colspan="3"><select name="category">
										<option value="review_id">리뷰번호</option>
										<option value="book_title">제목</option>
										<option value="review_cont">리뷰내용</option>
										<option value="nickname">닉네임</option>
										<option value="member_id">아이디</option>
								</select> <input type="text" name="keyword"/>
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
								<th>도서이미지</th>
								<th>제목</th>
								<th>작성자</th>
								<th>별점</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) { //list 에 객체가 있을때 

								ReviewAdmin ra = list.get(i);
							%>
							<tr class="contents">
								<td class='select'><input type="checkbox"
									value="<%=ra.getReviewId()%>" name="delete-select" /></td>
								<td class='review-id'><%=ra.getReviewId()%></td>
								<%
									String bookImage = ra.getBookImage();
								if ((bookImage.substring(0, 1)).equals("b_")) {
								%>
								<td class='book-image'><img src="/image/book/<%=ra.getBookImage() %>" style="width: 80px; border:0px solid white; cursor:pointer;" 
									data-toggle="modal" data-target="#myLargeModal<%=ra.getReviewId() %>">
									</td>
								<%
									} else {
								%>
								<td class='book-image'><img src="<%=ra.getBookImage()%>"
									style="width: 80px; border:0px solid white; cursor:pointer;" data-toggle="modal"
									data-target="#myLargeModal<%=ra.getReviewId() %>" ></td>
								<%
									}
								%>
								<td class='book-title'>
								<span class="modal-tag"
									data-toggle="modal"
									data-target="#myLargeModal<%=ra.getReviewId() %>" style="border:0px solid white; cursor:pointer;"><%=ra.getBookTitle()%></span></td>
								<td class='member-no'><%=ra.getNickName()%><br>(<%=ra.getMemberId()%>)</td>
								<td class='review-rate'><%=ra.getReviewRate()%>/5</td>
								<td class='review-count'><%=ra.getReviewCount()%></td>
								<td class='review-date'><%=ra.getReviewDate()%></td>
								<td class='delete'>
									<%
										if (ra.getDelYN() == 'N') {
									%>
									<form action="/deleteReview.ad" method="get"
										class="deleteReview" style="border: 0px solid white">
										<input type="hidden" value="<%=ra.getReviewId()%>"
											name="reviewId">
										<button type="submit" class="delete-btn">삭제</button>
									</form> <%
 									} else {
 										%>
									<form action="/restoreReview.ad" method="get"
										class="restoreReview" style="border: 0px solid white">
										<input type="hidden" value="<%=ra.getReviewId()%>"
											name="reviewId">
										<button type="submit" class="restore-btn">복구</button>
									</form> <%
 										}
 									%>
								
							</tr>

							<div class="modal fade" id="myLargeModal<%=ra.getReviewId() %>" tabindex="-1"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
												&nbsp;&nbsp;리뷰
											</p>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class='row' id="viewer-title">
												<div class='viewer-column col-3'>도서 제목</div>
												<div class='viewer-info col-9'>
													<input type="text" value="<%=ra.getBookTitle() %>"
													disabled/>
												</div>
											</div>
											<div class='row' id="viewer-writer">
												<div class='viewer-column col-3'>작성자</div>
												<div class='viewer-info col-9'>
													<input type="text" value="<%=ra.getNickName() %>(<%=ra.getMemberId() %>)"
													disabled/>
												</div>
											</div>
											<div class='row' id="viewer-rating">
												<div class='viewer-column col-3'>리뷰 평점</div>
												<div class='viewer-info col-9'>
												<div id="star<%=ra.getReviewId() %>" class="input-rating"></div>
												</div>
											</div>
											<div class='row' id='viewer-contents'>
												<div class='viewer-column col-3'>리뷰 내용</div>
												<div class='viewer-info col-9'>
													<textarea name="reviewCont" disabled><%=ra.getReviewCont() %></textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer">
									</div>
									<script>
												
									$(function(){
													
													
									var reviewRate = <%=ra.getReviewRate() %>;
												
												
									for(var i = 0; i<reviewRate; i++){
													
										$('#star<%=ra.getReviewId() %>').append('<i class="fas fa-star" size="3x" style="color:#FFE687"></i>');
								
													
										}
									for(var i = 0; i<(5-reviewRate); i++){
													
										
									}
												
										});
									</script>
									</div>
								</div>
							</div>

							<%
								} //for
							for (int i = 0; i < (5 - list.size()); i++) { //list가 empty 일때 	빈 공간채워줘야함
							%>
							<tr class="contents">
								<td class='select'><input type="checkbox" /></td>
								<td class='review-id'></td>
								<td class='book-image'></td>
								<td class='book-title'></td>
								<td class='member-no'></td>
								<td class='review-rate'></td>
								<td class='review-count'></td>
								<td class='review-date'></td>
								<td class='delete'></td>
							</tr>
							<%
								}
							%>
						</table>
						<p></p>
						<div>
							<div>
								<form action="/deleteReviewList.ad" method="get"
									id="deleteReviewList">
									<input type="hidden" name="reviewIdArr" />
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