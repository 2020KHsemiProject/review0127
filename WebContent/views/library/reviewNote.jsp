<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Member m = (Member)session.getAttribute("member");
	if(m!=null){ // 여기에 내 서내 남의 서재 서로 다르게 보여야 함
%>
	<H1>내 서재</H1>
	닉네임 : <%=m.getNickname() %>
	
<% }else { %>
	<script>
		alert('회원이 아닙니다.<br>여기에는 나중에 음...회원가입 링크를 주자...');
		location.replace('/index.jsp');
	</script>
<% } %>
</body>
</html>