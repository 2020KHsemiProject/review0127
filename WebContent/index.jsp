<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>REVIEW:0127</title>
    <link href="/views/css/index.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>

<body>
    <div id="intro-wrap" class="wrapper">
        <div id="intro" class="content">
            <h1>안녕하세요 REVIEW:0127입니다.</h1>
            <h3>REVIEW:0127은 도서 리뷰와 관련된 서비스를 제공하는 곳입니다.</h3>
            <h3>REVIEW:0127에서 다양한 리뷰와 함께 더 풍부한 독서활동을 경험하세요!</h3>
        </div>
    </div>
<!--  하단부 아직 미구현  -->

    <div id="lib-wrap" class="wrapper">
        <div id="lib" class="content">
            <h5>남의 서재</h5>
            <h3>@야무지개님의 컬렉션</h3>
        </div>
    </div>
 <!--   <div id="review-wrap" class="wrapper">
        <div id="rev" class="content">
            
        </div>
    </div>
-->
<%
	//Member m = (Member)session.getAttribute("member");
	if(m!=null){
%>
	<b><a href="#">[<%=m.getNickname() %>]</a></b> 님 환영합니다. <a href="#">로그아웃</a><br>
 
	<% if(m.getMemberNo().equals("M0001")) { %>
		<a href="#">회원관리(관리자전용)</a>
	<% }%>
	<br>

	<a href="#">마이페이지</a>
	<br>
	<a href="/views/review/reviewList.jsp">리뷰</a>
	<br>
	<a href="#">내 서재</a>
	<br>
	<a href="/myRivewNote.rw?libraryOwner=<%=m.getMemberId()%>">내 서재 (Servlet)</a>

	<a href="/views/review/review_write.jsp">리뷰 작성</a><br>
	<a href="/bookInfo.rw?bookId=9788936433635">도서정보</a><br>

<% }else { %> 
	<H1>review 0127</H1>
	<form action="/memberLogin.rw" method="post">
		ID : <input type="text" name="memberId"/><br>
		PW : <input type="password" name="memberPwd"/><br>
		<input type="submit" value="로그인"/> <input type="reset" value="취소"/>
		<a href="#">회원가입</a>
	</form>

<% } %>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>
