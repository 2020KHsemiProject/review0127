<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <title>REVIEW:0127</title>
    <link rel="stylesheet" href="/views/css/customer_center.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
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
                            <ul class="customer_ul">
                                <li class="fl w10 ">1</li>
                                <li class="fl w80"><a href="/views/service_center/customer_notice.jsp">REVIEW:0127 서비스를 오픈하였습니다.</a></li>
                                <li class="fl w12">20.11.22</li>
                            </ul>
                            <ul class="customer_ul">
                                <li class="fl w10">2</li>
                                <li class="fl w80"><a href="#">도서 검색에 관한 안내</a></li>
                                <li class="fl w12">20.11.22</li>
                            </ul>
                        </div>
                    </div>
                    <div id="faq">
                        <div class="inner_article">
                            <p class="inner_contents_text">FAQ</p>
                        </div>
                        
                        <script>
                            $(function(){
                                $(".faq_list").click(function(){
                                    var subContents = $('.faq_li_contents');
                                    
                                    if(subContents.is(":visible")){
                                        subContents.slideUp();
                                    } else {
                                        subContents.slideDown();
                                    }                                    
                                });
                            });
                        </script>
                        <div id="inner_faq_contents">
                            <ul class="customer_ul faq_ul">
                                <li class="fl w10 ">
                                    <img src="/image/icon/question.png" class="question_img" />
                                </li>
                                <li class="fl w90"><a href="#" class="faq_list">로그인이 되지 않아요.</a></li>
                            </ul>
                            <div class="faq_li_contents" >
                            <ul>
                                <li class="question_list">Q. 아이디/이메일이 기억 안나요.</li>
                                <li class="answer_list">A. REVIEW:0127에 등록한 아이디/이메일 주소가 기억나지 않는 경우, 1대1 문의를 이용해주시기 바랍니다.</li>
                            </ul>
                            <ul>
                                <li class="question_list">Q. 비밀번호를 까먹었어요.</li>
                                <li class="answer_list">A. REVIEW : 0127에 로그인할 수 없는 경우 이메일 또는 문자 메시지(계정에 전화번호를 추가한 경우)로 비밀번호를 재설정할 수 있습니다.</li>
                            </ul>
                            <ul>
                                <li class="answer_list">A. 이메일을 수신하여 비밀번호 재설정하는 방법</li>
                                <li class="email_answer_order">1. ###### 페이지로 이동합니다.</li>
                                <li class="email_answer_order">2. 이메일 주소를 입력하고, 이메일 받기를 선택합니다.</li>
                                <li class="email_answer_order">3. 수신된 비밀번호 재설정 이메일에 안내된 단계를 따릅니다. 일반적으로 이메일은 몇 분 내에 도착하고, 링크에 접속하면 새 비밀번호를 생성하라는 메세지가 표시됩니다. 새 비밀번호는 이전 비밀번호와 동일하게 설정할 수 없습니다.</li>
                            </ul>
                            <br>
                            <ul>
                                <li class="answer_exception">
                                    * 링크가 만료된 경우
                                </li>
                                <li class="answer_exception_text">
                                                                         이메일에 포함된 링크는 24시간 후에 만료됩니다. ######에서 본인에게 다시 이메일을 전송할 수 있습니다.
                                </li>
                            </ul>
                            <ul>
                                <li class="answer_exception">
                                    * 이메일을 받지 못한 경우
                                </li>
                                <li class="answer_exception_text">
                                    1. 다른 폴더(스팸, 정크, 프로모션 등) 및 설정한 모든 이메일 필터를 확인해주세요.
                                </li>
                                <li class="answer_exception_text">
                                    2. 아직 비밀번호 재설정 이메일을 받지 못한 경우, 이메일 제공업체에서 지연되었을 수 있습니다. 5시간을 기다려보신 후, 다시 확인해주세요.
                                </li>
                            </ul>
                        </div>
                        <ul class="customer_ul faq_ul">
                            <li class="fl w10">
                                <img src="/image/icon/question.png" class="question_img" />
                            </li>
                            <li class="fl w90"><a href="#">리뷰 작성과 관리 방법이 궁금해요</a></li>
                        </ul>
                        <ul class="customer_ul faq_ul">
                            <li class="fl w10">
                                <img src="/image/icon/question.png" class="question_img" />
                            </li>
                            <li class="fl w90"><a href="#">회원 신고 방법이 궁금해요.</a></li>
                        </ul>
                        <ul class="customer_ul faq_ul">
                            <li class="fl w10">
                                <img src="/image/icon/question.png" class="question_img" />
                            </li>
                            <li class="fl w90"><a href="#">컬렉션은 무엇인가요?</a></li>
                        </ul>
                        <ul class="customer_ul faq_ul">
                            <li class="fl w10">
                                <img src="/image/icon/question.png" class="question_img" />
                            </li>
                            <li class="fl w90"><a href="#">책장 추가는 어떻게 하나요?</a></li>
                        </ul>
                        <ul class="customer_ul faq_ul">
                            <li class="fl w10">
                                <img src="/image/icon/question.png" class="question_img" />
                            </li>
                            <li class="fl w90"><a href="#">문의 절차가 궁금해요.</a></li>
                        </ul>
                    </div>
                </div>
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
                            <input type="email" name="emailSendEmail" id="email_send_email"  value="abc123@abc.com"/>
                            <img src="/image/icon/sendBtn.png" id="email_send_btn">
                        </div>
                    </div>
                </div>
            </div>
		</div>
		</div>
    </div>
    
                    <!-- 슬라이드업 /다운 -->
                <script>
               $(function(){
                  $(".faq_list").click(function(){
                  var index = $(".faq_list").index(this);
               
                  console.log(index);
                        
                        if($('.faq_li_contents:eq('+index+')').is(":visible")){
                           $('.faq_li_contents:eq('+index+')').focus();
                            $('.faq_li_contents:eq('+index+')').slideUp(); //다른아이로
                        } else {
                           $('.faq_li_contents:eq('+index+')').focus();
                           $('.faq_li_contents:eq('+index+')').slideDown();
                        } 
                  });
               });         
               </script>
            <script>
            $(function(){
               $('.dropdown-menu>button').click(function(){
                  var text = $(this).text();
                  $(this).parent().prev().text(text);
                  
                  var value = $(this).attr('value');
                  var input = $('#put').val(value);
                  console.log(input)
               });
               
               <%
                  
               boolean result = (boolean)request.getAttribute("add");
                
               %>
               <%
                  if(result==true){
               %>
                  $('#listmore').focus(); //이 코드가 포커스 시키는 코드
               <%}%>
               //이런식으로 만약 추가가 되었으면 더보기로 포커스를 맞추어라!
               //원래 웹은 페이지를 새롭게 불러오면 가장 상단부터 보이는건데 지금처럼 추가가 되면 더보기 버튼으로 포커스를 맞추는겁니다.
            });
            
            </script>
    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>
