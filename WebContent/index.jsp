<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review 0127</title>
</head>
<body>
<%
	Member m = (Member)session.getAttribute("member");

	if(m!=null){
%>
	<b><a href="#">[<%=m.getNickname() %>]</a></b> 님 환영합니다. <a href="/memberLogout.rw">로그아웃</a><br>
	<% if(m.getMemberNo().equals("M0001")) { %>
		<a href="#">회원관리(관리자전용)</a>
	<% }%>
	<br>
	<a href="#">마이페이지</a>
	<br>
	<a href="/views/review/reviewList.jsp">리뷰</a>
	<br>
	<a href="#">내 서재</a>
	<br>
	<a href="/myLibraryReviewNote.rw">내 서재 (Servlet)</a>
<% }else { %> 
	<H1>review 0127</H1>
	<a href="/views/member/login.jsp">로그인</a>
<% } %>
</body>
</html>