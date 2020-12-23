<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
</head>
<body>
	<% 
		boolean result = (boolean)request.getAttribute("result"); 
	%>
	<script>
		<% if(result == true) { %>
			alert("수정이 완료되었습니다.");
			location.replace("/pageLoad.rw");
		<% } else { %>
			alert("수정이 정상적으로 처리되지 못했습니다.(지속적인 문제 발생 시 관리자에게 문의하세요.)");
			location.replace("/pageLoad.rw");
		<% } %>
	</script>
	
</body>
</html>