<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
</head>
<body>
	<% Member m = (Member)request.getAttribute("member"); %>
	<script>
	<% if(m != null) { %>
		alert("회원가입을 축하드립니다.");
		location.replace("/index.jsp");
	<% } else { %>
		alert("회원가입에 실패하였습니다.(지속적인 문제 발생 시 관리자에게 문의하세요.)");
		history.back(-1);
	<% }%>
	</script>
</body>
</html>