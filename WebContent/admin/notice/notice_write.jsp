<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>REVIEW:0127</title>
<link href="/admin/common/common_wrapper.css" rel="stylesheet" type="text/css">
<link href="/admin/css/notice_write.css" rel="stylesheet" type="text/css">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script src="/admin/js/subnavbar.js"></script>
<script src="/admin/js/notice.js"></script>

<%

Member admin = (Member)session.getAttribute("member");

if(admin==null){
	
	response.sendRedirect("/admin/common/error/error.jsp");
	
}


%>



	<div class="page-wrapper">
		<div class="admin-header">
			<%@include file="/admin/common/elements/admin_header.jsp"%>
		</div>
		<div class="body-container">
			<div class="nav-snb">
				<%@include file="/admin/common/elements/admin_subnavbar.jsp"%>
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
						> 게시판관리 <a href="/selectAllNotice.ad"
						style="font-decoration: none; color: black;"> > 공지사항 > </a><a
						href="/admin/notice/notice_write.jsp" style="color: blue;">공지사항
							작성</a></span>
				</div>
				<div class="page-contents">
					<h3>공지글 작성</h3>
					<!-- table -->
					<form method="post" action="/insertNotice.ad">
						<table>
							<tr>
								<th style="background-color: #FAFAFC" class="first">글 제목</th>
								<td class="first"><input type="text" name="title"></td>
							</tr>
							<tr id="write">
								<th style="background-color: #FAFAFC" class="second">글 내용</th>
								<td class="second"><textarea name="content"></textarea></td>
							</tr>
						</table>
						<br>
						<button type="submit" value="확인">확인</button>
						<button type="reset" value="취소" id="back">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>