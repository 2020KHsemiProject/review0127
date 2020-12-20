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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <title>REVIEW:0127</title>
    <link rel="stylesheet" href="/views/css/wrapper.css" type="text/css">
    <link rel="stylesheet" href="/views/css/customer_center.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<% 
	Notice notice = (Notice)request.getAttribute("notice");
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
                                    <a href="/custmoer_center.rw"><img src="/image/icon/backBtn.png" class="back_img" /></a>
                                </li>
                                <li class="fl w_title">공지사항</li>
                                <li class="fl w75"><%=notice.getNoticeTitle() %></li>
                                <li class="fr w_date"><%=notice.getNoticeDate() %></li>
                            </ul>
                        </div>
                        <div id="customer_notice_contents"><%=notice.getNoticeCont() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
</body></html>