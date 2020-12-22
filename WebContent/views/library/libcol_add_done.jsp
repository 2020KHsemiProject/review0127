<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String ownerId = (String)request.getAttribute("ownerId"); 
		boolean result = (boolean)request.getAttribute("result");
	%>
	<%if(result){ %>
		<script>
			alert('내 컬렉션에 추가되었습니다');
		</script>
	<%}else{ %>
		<script>
			alert('내 컬렉션에 추가하지 못했습니다.<br>(지속적인 실패서 관리자에게 문의하세요)');
		</script>
	<%} %>
		<script>location.replace('/myCollection.rw?libraryOwner=<%=ownerId%>');</script>
</body>
</html>