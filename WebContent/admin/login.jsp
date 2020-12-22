<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/admin/common/elemnts/common-wrapper.css" rel="stylesheet" type="text/css">
<link href="/admin/css/login.css" rel="stylesheet" type="text/css">
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
	<div class="container-fluid">
		<form class="form-signin" action="/loginMember.ad" method="post">
			<center>
				<img src="/image/admin/logo1.png" id="logo" />
			</center>
			<center>
				<img src="/image/admin/login.png" id="admin" />
			</center>
			<p class="form-signin-heading">관리자 로그인</p>
			<label for="inputId" class="sr-only">아이디</label> <input type="text"
				id="inputId" name="adminId" class="form-control" placeholder="아이디" required
				autofocus> <label for="inputPassword" class="sr-only">비밀번호</label>
			<input type="password" id="inputPassword" name="adminPwd" class="form-control"
				placeholder="비밀번호" required>
			<button class="btn btn-lg btn-block" type="submit" value="로그인">로그인</button>
		</form>
		<div>
			<p class="text1">
				"가장 발전한 문명사회에서도 책은 최고의 기쁨을 준다.<br> 독서의 기쁨을 아는 자는 재난에 맞설 방편을 얻은
				것이다."
			</p>
			<p class="text2">
				미국 사상가 겸 시인<br>랄프 왈도 에머슨 ( 1803 ~ 1882 )
			</p>
		</div>
	</div>
</body>
</html>