<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.notice.model.vo.Notice"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <title>REVIEW:0127</title>
    <link rel="stylesheet" href="/views/css/wrapper.css" type="text/css">
	<link rel="stylesheet" href="/views/css/customer_center.css" type="text/css">
</head>
<body>
<% 
	Notice notice = (Notice)request.getAttribute("Notice");
%>
    <div id="wrapper">
        <div id="content">
            <div id="content_title">
                <h1>고객센터</h1>
            </div>
            <div id="content_main">
                <div class="inner_wrapper">
                    <div id="notice">
                        <div class="inner_article">
                            <ul class="customer_ul">
                                <li class="fl w15 ">
                                    <a href="/customer_center.rw"><img src="/image/icon/backBtn.png" class="back_img" /></a>
                                </li>
                                <li class="fl w_title">공지사항</li>
                                <li class="fl w75"><%=notice.getNoticeTitle() %></li>
                                <li class="fr w_date"><%=notice.getNoticeDate() %></li>
                            </ul>
                        </div>
                        <textarea id="customer_notice_contents"><%=notice.getNoticeCont() %></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>