<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/admin/common/common_subnavbar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header> <nav id="navbar">
	<ul class="mainmenu">
		<li id="first"><a href="/selectAllMember.ad"> &nbsp; &nbsp;
				&nbsp; &nbsp;<img src="/image/admin/member.png" />&nbsp; &nbsp;
				&nbsp; &nbsp; 회원관리 &nbsp; &nbsp;
		</a></li>
		<li id="main-item">&nbsp; &nbsp; &nbsp; &nbsp;<img
			src="/image/admin/board.png" />&nbsp; &nbsp; &nbsp; &nbsp; 게시판관리
			&nbsp; &nbsp;
			<ul class="submenu">
				<li><a href="/selectAllReview.ad">리뷰게시판</a></li>
				<li><a href="/selectAllFAQ.ad">FAQ</a></li>
				<li><a href="/selectAllNotice.ad">공지사항</a></li>
			</ul>
		</li>
		<li id="main-item"><a href="/selectAllInquiry.ad">&nbsp;
				&nbsp; &nbsp; &nbsp;<img src="/image/admin/inquiry.png" />&nbsp;
				&nbsp; &nbsp; &nbsp; 1대1 문의 관리 &nbsp; &nbsp;
		</a>
			<ul class="submenu" id="third">
			</ul></li>
	</ul>
	</nav> </header>
</body>
</html>