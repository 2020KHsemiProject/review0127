<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% boolean result = (boolean)request.getAttribute("result"); %>
	<%if(result) {%>
		<script>
			alert('리뷰 작성 완료');
			location.replace('/views/review/review_list.jsp');
		</script>
	<%}else{ %>
		<script>
			alert('리뷰 작성 실패');
			history.back(-1);
		</script>
	<%} %>
</body>
</html>