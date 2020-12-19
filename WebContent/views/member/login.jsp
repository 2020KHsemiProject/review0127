<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/views/common/elemnts/common-wrapper.css" rel="stylesheet" type="text/css">
<link href="/views/css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script>
		$(function(){
			$('#logo').click(function(){
				location.href='/index.jsp';
			});
		});
	</script>
	<div class="container-fluid">
		<form class="form-signin" action="/memberLogin.rw" method="post">
			<center>
				<img src="/image/login/logo_dark.png" id="logo" />
			</center>
			<center>
				<a href="/index.jsp"><img src="/image/login/login_logo.png" id="client" /></a>
			</center>
			<p class="form-signin-heading">로그인</p>
			<label for="inputId" class="sr-only">아이디</label> <input type="text"
				id="inputId" name="memberId" class="form-control" placeholder="아이디" required
				autofocus> <label for="inputPassword" class="sr-only">비밀번호</label>
			<input type="password" id="inputPassword" name="memberPwd" class="form-control"
				placeholder="비밀번호" required>
			<div class="checkbox">
				<label id="autocheck"> 
				<input type="checkbox" value="remember-me"> &nbsp; 자동로그인
				</label> &nbsp;&nbsp;
			    <a href="#" id="id_pwd_missing">아이디 / 비밀번호 찾기</a>
			</div>
			<button class="btn btn-lg btn-block" type="submit" value="로그인">로그인</button>
			<a href="/views/member/memberJoin.jsp">회원가입</a>
		</form>
		<div>
			<p class="text1">
				"남의 책을 읽는 데 시간을 보내라. <br> 
				  남이 고생한 것에 의해 쉽게 자기를 개선할 수 있다."
			</p>
			<p class="text2">
				고대 그리스 철학자<br>소크라테스 ( BC 470 ~ BC 399 )
			</p>
		</div>
	</div>
</body>
</html>