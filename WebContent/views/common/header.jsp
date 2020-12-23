<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REVIEW:0127</title>
    <link href="/views/css/header.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <!-- fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css" integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css" integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2" crossorigin="anonymous">
</head>
<body>
	<% Member m = (Member)session.getAttribute("member"); 
		String profileImg; // 프로필 이미지 처리. 없으면 기본 이미지
		String libraryOwner=null;
	if (m!=null){
        if(m.getProfileImg()!=null) {
        	profileImg = m.getProfileImg();
        }else{
        	profileImg = "default_user.png";
        }
	}else{
		profileImg = "default_user.png";
	}
	%>
	<div id="header">
    <div id="gnb-wrap">
        <div id="logo"><a href="/main"><img src="/image/logo.png" alt=""></a></div>
        <ul id="gnb">
            <li><a href="/reviewPage.rw">리뷰</a></li>
            <li><a href="/views/common/tmp.jsp">추천</a></li>
            <% if(m!=null) {%>
            <li><a href="/myReviewNote.rw?libraryOwner=<%=m.getMemberId()%>">서재</a></li>
            <%}else { %>
            <li><a href="#" id="lib-enter">서재</a></li>
            <%} %>
            <li><img id="user-menu-btn" src="/image/profile/<%=profileImg %>" alt=""></li>
        </ul>
		 <form action="/views/common/tmp.jsp" id="head-searchForm">
            <input type="text" name="searchBox" id="head-searchBox" value="">
            <span id="head-searchBtn"><i class="fas fa-search"></i></span>
        </form>
        <ul id="menu-bar">
    	<%if(m!=null) { %>
    	<li><a href="/memberLogout.rw">로그아웃</a></li>
        <li><a href="/views/member/modify_info.jsp">회원정보수정</a></li>
    	<%}else {%>
        <li><a href="/views/member/login.jsp">로그인</a></li>
        <li><a href="/views/member/memberJoin.jsp">회원가입</a></li>
    	<%} %>
        <li><a href="/customer_center.rw">고객센터</a></li>
    	</ul>

    </div>
    </div>
    <script>
        $(function(){
            $('#user-menu-btn').click(function(){
                if($('#menu-bar').css('display')=='none'){
                    $('#menu-bar').css('display','block');
                }else{
                    $('#menu-bar').css('display','none');
                }
            });
            $('#lib-enter').click(function(){
            		alert('로그인을 해야 합니다.');
            });
            $('#head-searchBtn').click(function(){
                var keyword = $('#head-searchBox').val();
                if(keyword!=''){
                    $('#head-searchForm').submit();
                }else{
                    alert('검색어를 입력해주세요');
                    return false;
                }
            });
        });
    </script>
</body>
</html>