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
                    <a id="shelf-add-btn" href="/bookLike.rw?bookId=<%=bookId%>">내 서재에 담기</a>
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
                        <div class="review-profile"><a href="/myReviewNote.rw?libraryOwner=<%=br.getMemberId()%>"><img src="/image/profile/<%=memberProfile%>" alt="" width="45"></a></div>
                        <div class="reviewer-nick"><%=br.getNickname() %></div>
                        <div class="star-score"><i class="fas fa-star"></i><%=br.getReviewRate() %></div>
                    </div>
                    <div class="review-card-con">
                        <p><%=br.getReviewCont() %></p>
                    </div>
                    <div class="more-view">
                       	 <a href="/reviewRead.rw?reviewId=<%=br.getReviewId()%>">더보기</a>
                    </div>
                </div>
                <%} //for 
                }else {%><p id="none-msg">현재 작성된 리뷰가 없습니다.<br>이 도서의 리뷰를 작성해보세요<p> <%} %>
            </div>
            <div></div>
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
        });
    </script>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>