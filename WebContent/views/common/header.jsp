<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
    <link href="/views/css/header.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
</head>
<body>
	<div id="header">
    <div id="gnb-wrap">
        <div id="logo"><a href="/index.jsp"><img src="../../image/logo.png" alt=""></a></div>
        <ul id="gnb">
            <li><a href="/views/review/review_list.jsp">리뷰</a></li>
            <li><a href="/views/library/review_note.jsp">서재</a></li>
            <li><img id="user-menu-btn" src="../../image/profile/default_user.png" alt=""></li>
        </ul>
    </div>
    <% Member m = (Member)request.getAttribute("member"); %>
    	  
    <ul id="menu-bar">
    <% if(m!=null) { %>
    	<li><a href="/memberLogout.rw">로그아웃</a></li>
       	<li><a href="/views/member/modify_info.jsp">회원정보수정</a></li>
    <% } else { %>
    	<li><a href="/views/member/login.jsp">로그인</a></li>
        <li><a href="/views/member/memberJoin.jsp">회원가입</a></li>
    <% } %>
    	<li><a href="/views/service_center/customer_center.jsp">고객센터</a></li>          	
    </ul> 
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
        });
    </script>
</body>
</html>