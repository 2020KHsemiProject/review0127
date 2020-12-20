<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.faq.model.vo.FAQ"%>
<%@ page import="rw.inquiry.model.vo.Inquiry"%>
<%@ page import="rw.notice.model.vo.Notice"%>
<%@ page import="rw.review.model.vo.ReviewAdmin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<link href="/admin/common/common_wrapper.css" rel="stylesheet"
	type="text/css">
<link href="/admin/css/main_board.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous"	>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	
	<%
			Member admin = (Member)request.getAttribute("member");
			session.setAttribute("member", admin);

			if(admin==null){
				
				response.sendRedirect("/admin/common/error/error.jsp");
				
			}
			

			ArrayList<ReviewAdmin> rl = (ArrayList<ReviewAdmin>) request.getAttribute("reviewList");
			ArrayList<Inquiry> il = (ArrayList<Inquiry>) request.getAttribute("inquiryList");
			ArrayList<FAQ> fl = (ArrayList<FAQ>) request.getAttribute("faqList");
			ArrayList<Notice> nl = (ArrayList<Notice>) request.getAttribute("noticeList");
		%>

	<!-- 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="/admin/js/subnavbar.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		
		
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
				<div class="page-header"></div>
				<div class="page-contents">
					<div class="main-wrapper">
						<div class="review-board">
							<table class="board">
								<tr>
									<th class="board-column"><a href="/selectAllReview.ad">리뷰게시판</a></th>
									<th class="board-link"><a class="link-btn" href="/selectAllReview.ad">더보기</a></th>
								</tr>
								<tr>
									<%
										for (int i = 0; i < rl.size(); i++) {
																								ReviewAdmin ra = rl.get(i);
									%>
									<td class="content-title">
									<a href="/selectAllReview.ad"><%=ra.getBookTitle()%></a></td>
									<td class="content-date"><%=ra.getReviewDate()%></td>
								</tr>
								<%
									}
																				for (int i = 0; i < (7 - rl.size()); i++) {
								%>
								<tr>
									<td class="content-title"></td>
									<td class="content-date"></td>
								</tr>
								<%
									}
								%>
							</table>
						</div>
						<div class="inquiry-board">
							<table class="board">
								<tr>

									<th class="board-column"><a href="/selectAllInquiry.ad">1:1 문의</a></th>
									<th class="board-link"><a class="link-btn" href="/selectAllInquiry.ad">더보기</a></th>
								</tr>
								<tr>
									<%
										for (int i = 0; i < il.size(); i++) {
																								Inquiry iq = il.get(i);
									%>
									<td class="content-title"><p class="title">
									<a href="/selectAllInquiry.ad"><%=iq.getInquiryTitle()%></a></p>
										<%
											if (iq.getReplyYN() == 'Y') {
										%>
										<p class="state-y">답변완료</p> 
										<%
 											} else {
 										%>
										<p class="state-n">대기중</p> <%
 	}
 %></td>
									<td class="content-date"><%=iq.getInquiryDate()%></td>
								</tr>
								<%
									}
																				for (int i = 0; i < (7 - il.size()); i++) {
								%>
								<tr>
									<td class="content-title"><p class="title"></p>
										<p class="state-y"></p></td>
									<td class="content-date"></td>
								</tr>
								<%
									}
								%>
							</table>
						</div>
						<div class="one-to-one-board">
							<table class="board">
								<tr>
									<th class="board-column"><a href="/selectAllNotice.ad">공지사항</a></th>
									<th class="board-link"><a class="link-btn" href="/selectAllNotice.ad">더보기</a></th>
								</tr>
								<%
									for (int i = 0; i < nl.size(); i++) {
																					Notice n = nl.get(i);
								%>
								<tr>
									<td class="content-title"><a href="selectAllNotice.ad"><%=n.getNoticeTitle()%></a></td>
									<td class="content-date"><%=n.getNoticeDate()%></td>
								</tr>
								<%
									}
																				for (int i = 0; i < (7 - nl.size()); i++) {
								%>

								<tr>
									<td class="content-title"></td>
									<td class="content-date"></td>
								</tr>
								<%
									}
								%>
							</table>
						</div>
						<div class="qna-notice-wrapper">
							<div class="qna-board">
								<table class="board">
									<tr>
										<th class="board-column"><a href="/selectAllFAQ.ad">FAQ</a></th>
										<th class="board-link"><a class="link-btn" href="selectAllFAQ.ad">더보기</a></th>
									</tr>
									<%
										for (int i = 0; i < fl.size(); i++) {
																							FAQ faq = fl.get(i);
									%>
									
									<tr>
										<td class="content-title"><a href="/selectAllFAQ.ad"><%=faq.getFaqTitle() %></a></td>
										<td class="content-date"><%=faq.getFaqDate() %></td>
									</tr>
									<%
									}
								for (int i = 0; i < (7 - fl.size()); i++) {
								%>
									
									<tr>
										<td class="content-title"></td>
										<td class="content-date"></td>
									</tr>
									
									<%} %>
							</div>
						</div>
					</div>
			</div>
</body>
</html>