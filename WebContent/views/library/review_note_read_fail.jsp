<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(confirm('내 서재는 로그인한 회원만 가능합니다.\n로그인하시겠습니까?')){
			location.href="/views/member/login.jsp";
		}else{
			history.back();	
		}
	</script>
</body>
</html>