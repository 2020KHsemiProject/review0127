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
	boolean result = (boolean) request.getAttribute("result");
	

%>
<script>
if(<%=result %>){

	alert("메일 전송이 완료되었습니다.");


}else{

	alert("메일 전송에 실패하였습니다. \n 지속적인 문제 발생시 서버관리자에게 연락주세요.");

}

location.replace("/selectAllMember.ad");

</script>

</body>
</html>