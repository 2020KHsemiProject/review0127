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
<%	boolean result = (boolean)request.getAttribute("result");
		Member m = (Member)session.getAttribute("member");
	%>
	<%if(result){ %>
		<script>
			alert('내 컬렉션에서 제거되었습니다');
		</script>
	<%}else{ %>
		<script>
			alert('내 컬렉션에서 제거하지 못했습니다.<br>(지속적인 실패서 관리자에게 문의하세요)');
		</script>
	<%} %>
		<script>location.replace('/myReviewNote.rw?libraryOwner=<%=m.getMemberId()%>');</script>
</body>
</html>