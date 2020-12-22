<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="rw.notice.model.vo.Notice"%>
<%@ page import="rw.faq.model.vo.FAQ"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <title>REVIEW:0127</title>
    <link rel="stylesheet" href="/views/css/customer_center.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

<%
ArrayList<FAQ> fl = (ArrayList<FAQ>) request.getAttribute("faqList");
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
                                <li class="fl w10 "><%=i+1%></li>
                                <li class="fl w80"><a href="/customer_notice.rw?NoticeNo=<%=n.getNoticeNo()%>" ><%=n.getNoticeTitle()%></a></li>
                                <li class="fl w12"><%=n.getNoticeDate()%></li>
                            </ul>
                            <%
                            	}
                            %>
                        </div>
                    </div>
                    <div id="faq">
                        <div class="inner_article">
                            <p class="inner_contents_text">FAQ</p>
                        </div>
                     <% int more = 0 ; 
                     for (int i = 0; i < fl.size(); i++) {
                           FAQ f = fl.get(i); %>          
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
            <% more++; } %>
            <form action="/custmoer_center.rw" method="post">
            <input type="hidden" name="more" value="<%=more %>"/>
				<button id="listmore">더보기</button>
				</form>
                </div>
                
               
				<%if(m!=null){ %>
				 <form action="/sendInquiry.rw" method="post">
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
                            <input type="hidden" name="category" id="put"/>
                                <button class="dropdown-item" type="button" class="category" value="회원문의">회원문의</button>
                                <button class="dropdown-item" type="button" class="category" value="오류문의">오류문의</button>
                                <button class="dropdown-item" type="button" class="category" value="리뷰문의">리뷰문의</button>
                            </div>
                            <input type="text" name="inquiryTitle" placeholder="제목을 입력해주세요." id="inquiry_title" />
                            <textarea id="one_to_one_textarea" name="inquiryContent"></textarea>
                        </div>
                        <div id="one_to_one_submit">
                            <input type="checkbox" name="emailSendCheck" id="email_send_check"/>
                            <input type="email" name="emailSendEmail" id="email_send_email" value="<%=m.getEmail()%>"/>
                            <button type="hidden"><img src="/image/icon/sendBtn.png" id="email_send_btn"></button>                         
                        </div>
                    </div>
                </div>
                 </form>
				<%} %>
            </div>
		</div>
		</div>
    </div>
    
    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>
