<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

boolean result = (boolean)request.getAttribute("result");
int currentPage = (int)request.getAttribute("currentPage");


%>

<script>
if(<%=result %>){
	

	alert("복구가 완료되었습니다.");
	
	
}else{
	
	alert("복구에 실패하였습니다. \n 지속적인 문제 발생시 서버관리자에게 연락주세요.");
	
}
 
 location.replace("/selectAllReview.ad?currentPage=<%=currentPage%>");


</script>

</body>
</html>