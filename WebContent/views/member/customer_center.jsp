<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="rw.member.model.vo.Member"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.notice.model.vo.Notice"%>
<%@ page import="rw.faq.model.vo.Faq"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <title>REVIEW:0127</title>
    <link rel="stylesheet" href="/views/css/customer_center.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

<%

//Member m = (Member)request.getAttribute("member");
//session.setAttribute("member", m);
Faq faq = new Faq();
ArrayList<Faq> fl = (ArrayList<Faq>) request.getAttribute("faqList");
ArrayList<Notice> nl = (ArrayList<Notice>) request.getAttribute("noticeList");
%>

    <div id="customer_wrapper">
        <div id="content">
            <div id="content_title">
                <h1>고객센터</h1>
            </div>

            <div id="content_main">
                <div class="inner_wrapper">
                    <div id="notice">
                        <div class="inner_article">
                            <p class="inner_contents_text">공지사항</p>
                        </div>
                        <div id="inner_notice_contents">
                       <%
							for (int i = 0; i < nl.size(); i++) {
							Notice n = nl.get(i);
					   %>
                            <ul class="customer_ul">
                                <li class="fl w10 "><%=i+1 %></li>
                                <li class="fl w80"><a href="/customer_notice.rw?NoticeNo=<%=n.getNoticeNo() %>" ><%=n.getNoticeTitle() %></a></li>
                                <li class="fl w12"><%=n.getNoticeDate() %></li>
                            </ul>
                            <%} %>
                        </div>
                    </div>
                    <div id="faq">
                        <div class="inner_article">
                            <p class="inner_contents_text">FAQ</p>
                        </div>
                        <%
							for (int i = 0; i < fl.size(); i++) {
								Faq f = fl.get(i); %>			   
                        <div id="inner_faq_contents">
                            <ul class="customer_ul faq_ul">
                                <li class="fl w10 ">
                                    <img src="/image/icon/question.png" class="question_img" />
                                </li>
                                <li class="fl w90"><a href="#" class="faq_list"><%=f.getFaqTitle() %></a></li>
                            </ul>
                            <div class="faq_li_contents" >
                            <ul>
                                <li class="question_list"><%=f.getFaqCont() %></li>                 
                            </ul>
                        </div>
                    </div>
				<%} %>
				<div class="more">더보기</div>
                </div>
                
                <!-- 슬라이드업 /다운 -->
                <script>
					$(function(){
						$(".faq_list").click(function(){
						var index = $(".faq_list").index(this);
						var subContents = $('.faq_li_contents');
						console.log(index);
                        
                        if($('.faq_li_contents:eq('+index+')').is(":visible")){
                            $('.faq_li_contents:eq('+index+')').slideUp();
                        } else {
                        	$('.faq_li_contents:eq('+index+')').slideDown();
                        }  
						});
										
					</script>

					<%if(m!=null){ %>
                <div id="one_to_one">
                    <div class="inner_article">
                        <p class="inner_contents_text">1:1 문의</p>
                    </div>
                    <div id="one_to_one_contents">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               	문의 유형 선택
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <button class="dropdown-item" type="button">회원문의</button>
                                <button class="dropdown-item" type="button">오류문의</button>
                                <button class="dropdown-item" type="button">리뷰문의</button>
                            </div>
                            <input type="text" name="inquiryTitle" placeholder="제목을 입력해주세요." id="inquiry_title" />
                            <textarea id="one_to_one_textarea"></textarea>
                        </div>
                        <div id="one_to_one_submit">
                            
                            <input type="checkbox" name="emailSendCheck" id="email_send_check" />
                            <input type="email" name="emailSendEmail" id="email_send_email"  value="<%=m.getEmail() %>"/>
                            <img src="/image/icon/sendBtn.png" id="email_send_btn">
                            <%}else{ %>
                            <input type="hidden" name="emailSendEmail" id="email_send_email"  placeholder="이메일을 입력하세요."/>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		</div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>
