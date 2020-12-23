<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% boolean result = (boolean)request.getAttribute("result");%>
	<%if(result){ %>
		<script>alert('리뷰를 삭제했습니다.');
			location.replace("/reviewPage.rw");		
		</script>
	<%}else{ %>
		<script>alert('리뷰 삭제를 실패했습니다.<br>(지속적인 문의 발생시 관리자에게 문의주세요)');
		history.back(-1);</script>
	<%} %>
</body>
</html>