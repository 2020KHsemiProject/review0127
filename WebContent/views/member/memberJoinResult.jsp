<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
	<% Member m = (Member)request.getAttribute("member"); %>
	
	<script>
	<% if(m != null) { %>	
	
		$(function(){
			alert("회원가입을 축하드립니다.");
			alert("인증 메일이 발송되었습니다. 이메일을 인증해주세요!");
			
			var userEmail = '<%=m.getEmail()%>';
			$.ajax({
				url:"/memberEmailCertify.rw",
				data : {"userEmail":userEmail},
				type:"get",
				success : function(){
					console.log("이메일 인증 요청 발송 완료");
					location.replace("/index.jsp");
				},
				error : function(){
					console.log("이메일 인증 요청 발송 실패");
				}
			});
		});
	<% } else { %>
		alert("회원가입에 실패하였습니다.(지속적인 문제 발생 시 관리자에게 문의하세요.)");
		history.back(-1);
	<% }%>
	</script>
	
	
	
</body>
</html>