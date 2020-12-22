<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
<%@ page import="rw.member.model.vo.Member" %>
<%@ page import="rw.review.model.vo.Book" %>
<%@ page import="rw.review.model.vo.ReviewCard" %>
<%@ page import="rw.library.model.vo.BookCase2" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
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
    <!-- fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css" integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css" integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2" crossorigin="anonymous">
</head>

<body>
	<% BookCase2 bc = (BookCase2)request.getAttribute("bookCol");
		ArrayList<Book> blist = (ArrayList<Book>)request.getAttribute("bookList");
		ArrayList<ReviewCard> rlist = (ArrayList<ReviewCard>)request.getAttribute("reviewList");
		HashMap<String,Integer> likeList = (HashMap<String,Integer>)request.getAttribute("likeList");
	%>
    <div id="intro-wrap" class="wrapper">
        <div id="intro" class="content">
            <h1>안녕하세요 REVIEW:0127입니다.</h1>
            <h3>REVIEW:0127은 도서 리뷰와 관련된 서비스를 제공하는 곳입니다.</h3>
            <h3>REVIEW:0127에서 다양한 리뷰와 함께 더 풍부한 독서활동을 경험하세요!</h3>
        </div>
    </div>
    <%if (bc!=null){ %>
	<div id="lib-wrap" class="wrapper">
        <div id="lib" class="content">
            <h5>남의 서재</h5>
            <h3><%=bc.getNickname() %>님의 <%=bc.getBookshelfName() %></h3>
            <div id="goToLib"><a href="/myReviewNote.rw?libraryOwner=<%=bc.getMemberId() %>" id="goToLib-btn">서재 보러가기</a></div>
            <div id="col-list">
            	<%for(Book b : blist){ %>
                <a href="/bookInfo.rw?bookId=<%=b.getBookId() %>"><img src="<%=b.getBookImage() %>" alt=""/></a>
                <%} %>
            </div>
        </div>
    </div>
    <%} %>
            <%if(rlist!=null){ %>
    <div id="review-wrap" class="wrapper">
        <div id="rev" class="content">
            <h3>베스트 리뷰</h3>
            <hr>
            <div id="review-card-wrap">
            <% for(ReviewCard rc : rlist) { %>
				<div class="reviewNote-book-card">
                       <div class="reviewNote-book-img"><img src="/image/book/<%=rc.getBookImage() %>"/></div>
                       <div class="reviewNote-book-text">
                         <div class="book-text-title">
                            <span class="book-text-title-name" style="width: 290px;"><%=rc.getBookTitle() %></span>
                            <span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate()%>
                          </div>
                          <%=rc.getReviewCont() %>
                       </div>
                       <div class="row reviewNote-card-text-bottom">
                          <div class="col-3">
                           <div class="reviewNote-userProfile">
                           	<%if(rc.getProfileImg()!=null) {%>
                               <img src="/image/profile/<%=rc.getProfileImg() %>"/>
                               <%}else{ %>
                               <img src="/image/profile/default_user_dark.png"/>
                               <%} %>
                           </div>
                           </div>
                           <div class="col-6">
								<div class="row other_review-card-infor">
									<div class="col-12"><%=rc.getNickname()	%></div>
									<div class="col-12">
										<div class="row">
											<div class="col-7">	<%=rc.getReviewDate()%>	</div>
											<div class="col-5 other_review-card-count">	조회	<%=rc.getReviewCount()%></div>
										</div>
									</div>
								</div>
								</div>
                           <div class="col-3 rvheart reviewNoteIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count"><%=likeList.get(rc.getReviewId()) %></span></div></div>
                       </div>
                   </div>
                    <%} %>
            </div>
            <div id="review-wrap-footer">
                <a href="/reviewPage.rw" id="more-review-btn">더보기</a>
            </div>
        </div>
    </div>
	<%} %>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>

