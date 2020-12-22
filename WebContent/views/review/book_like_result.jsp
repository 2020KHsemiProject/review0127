<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int result = (int)request.getAttribute("result"); 
		String bookId = (String)request.getAttribute("bookId");
	%>
	
	<% if(result==1) {%>
		<script>alert('내 서재에 담기가 완료되었습니다.');</script>
	<%}else if(result==0){ %>
		<script>alert('이미 서재에 담겨 있습니다.');</script>
	<%}else { %>
		<script>alert('서재 담기에 실패했습니다.<br>(지속적인 문제 발생시 관리자에게 문의하세요)');</script>
	<%} %>
	<script>location.replace('/bookInfo.rw?bookId=<%=bookId%>');</script>
</body>
</html>