<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
    <%@ page import="rw.review.model.vo.BookReview" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
    <link href="/views/css/book_detail.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css" integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css" integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2" crossorigin="anonymous">
</head>
<body>
<div id="contents">
		<% String bookId = (String)request.getAttribute("bookId"); //url로 파라미터입력.
			double avg = (double)request.getAttribute("avg");
			ArrayList<BookReview> list = (ArrayList<BookReview>)request.getAttribute("reviewList");
		%>
        <div class="v-wrap">
            <div id="image-wrap"></div>
            <div id="info-wrap">
                <h2 id="book-title"></h2>
                <p id="sub-info"><span></span><span> | </span><span></span></p>
                <div id="star-wrap">
                    <p>리뷰어 평점 : <i class="fas fa-star"></i>&nbsp;<%=avg %></p>
                </div>
                <div id="shelf-btn-wrap">
                    <span id="shelf-add-btn">내 서재에 담기</span>
                </div>
                <div id="review-new-wrap">
                    <a href="/views/review/review_write.jsp?bookId=<%=bookId%>"><img src="/image/icon/pencil.png" alt="" width="50">리뷰 작성하기</a>
                </div>
            </div>
        </div>
        <div class="v-wrap" id="intro-wrap">
            <hr>
            <h3>책 소개</h3>
            <p></p>
        </div>
        <div class="v-wrap" id="review-list-wrap">
            <hr>
            <h3>리뷰</h3>
            <div class="review-list">
            <%if(!list.isEmpty()) {
            	String memberProfile; %>
            <%for(BookReview br :list ){ 
            	if(br.getProfileImg()==null){
            		memberProfile = "default_user_dark.png";
            	}else{
            		memberProfile = br.getProfileImg();
            	}
            %>
                <div class="review-card">
                    <div class="review-card-head">
                        <div class="review-profile"><a href="#"><img src="/image/profile/<%=memberProfile%>" alt="" width="45"></a></div>
                        <div class="reviewer-nick"><%=br.getNickname() %></div>
                        <div class="star-score"><i class="fas fa-star"></i><%=br.getReviewRate() %></div>
                    </div>
                    <div class="review-card-con">
                        <p><%=br.getReviewCont() %></p>
                    </div>
                    <div class="more-view" data-toggle="modal" data-target="#exampleModal">
                       	 더보기
                    </div>
                </div>
                <%} //for 
                }else {%><p id="none-msg">현재 작성된 리뷰가 없습니다.<br>이 도서의 리뷰를 작성해보세요<p> <%} %>
            </div>
            <div></div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" ria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered mw-100">
                <div class="modal-content">
                    <span id="prev-review-btn"><i class="fas fa-chevron-left"></i></span>
                    <span id="next-review-btn"><i class="fas fa-chevron-right"></i></span>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       <div class="modal-review-header">
                        <div class="modal-review-profile"><img src="../../image/profile/profile1.png" alt="" width="45"></div>
                        <div class="modal-reviewer-nick">은먀</div>
                        <div class="modal-star-score">★5.0</div>
                        
                    </div>
                    <div class="modal-review-body">
                        <p>학교는 삶에서 처음 만나는 잔인한 공간이다. 학창시절은 모두에게 처음 만나는 잔인한 시간이다. 매해 처음 앉는 자리에서, 낯선 사람들을 스승으로 대하며, 모르던 것들을 공부하며 매일 같이 막연한 미래에 대해 압박을 받는 것이 대한민국 학생의 삶이다. 알고보면 선생님들도 고작해야 좋은 사람이거나 나쁜 사람일 뿐이고, 날 위해 노동하고 봉사하던 다른 급식실 노동자, 미화 노동자, 보안 노동자 모든 이들이 누구의 위도 아래도 아닌 사람이었는데. 그걸 몰랐고 인위적인 위계와 시스템에 주억거렸다. 매일 또래와 치이고 치면서 공부만 했다.
                            건너들은 또래들의 자살과 강간, 폭력과 따돌림과 전학 소식이 많았다. 외로운 아이들의 이야기가 많았다. 그 중 몇몇은 내가 알거나 겪거나 외면했던 것들이었기에 아직도 난 학교를 싫어한다. 학교가 싫은게, 돌아가기 싫은게 그게 당연한 것처럼 살았다. 이 소설이 그 잔인한 시절에 너무 큰 위로가 됐다. 우리가 무엇에 홀린듯이 아팠던건 어쩌면 그 저주와 마법의 탓일거야. 아니면 혹은, 어쩌면 우리에게 능청스럽게 퇴마를 해주는 보건선생님이 있었더라면 우린 다른 삶을 살 수도 있었어. 무지개 장난감 칼과 비비탄 총을 가방 안에 넣고 다닐걸. 매일 속수무책으로 당하는 것처럼 살바엔, 차라리 막 무찌르는 것처럼 살 걸 그랬어. 이 책을 읽으면서 괜히 울었다. 정세랑 작가는 참 대단찮은 스케일로도 사람을 깊게 울게 한다.
                            이런 시선으로 살고 싶었다. 이런 시선으로 살고 싶다. 건강하게. 상처 많아도 튼튼하게 강하게.</p>
                    </div>
                    
                </div>

            </div>
        </div>
    </div>
    <script>
        $(function() {
            //도서API
            $.ajax({
                            method: "GET",
                            url: "https://dapi.kakao.com/v3/search/book?target=title",
                            data: {
                                query: "<%=bookId %>"
                            },
                            headers: {
                                Authorization: "KakaoAK ec3d74416465dd038d237fac4f57f5f7"
                            }
                        })
                        .done(function(msg) {
                         $("#book-title").append(msg.documents[0].title);
                		$("#sub-info>span:first-child").append(msg.documents[0].authors);
                        $("#sub-info>span:last-child").append(msg.documents[0].publisher );
                         $("#intro-wrap>p:last-child").append(msg.documents[0].contents +"...<a href='#'>더보기</a><br>");
                        $("#image-wrap").append("<img src=' " + msg.documents[0].thumbnail +"'/>'");

                        });
            //내서재 담기
            $('#shelf-add-btn').click(function() {

            });
            // 리뷰작성하기
            $('').click(function() {

            });
        });
    </script>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>