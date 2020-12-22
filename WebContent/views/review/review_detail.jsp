<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
    <%@ page import="rw.review.model.vo.ReviewCard" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
    <link href="/views/css/review_detail.css" rel="stylesheet" type="text/css" />
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
	<% 	
		ReviewCard rc = (ReviewCard)request.getAttribute("reviewCard"); 
		int likeCount = (int)request.getAttribute("likeCount");
		String userProfileImg;
		
		if (rc.getProfileImg() != null) {
			userProfileImg = rc.getProfileImg();
		} else {
			userProfileImg = "default_user_dark.png";
		}
	%>
    <div id="contents">
        <div id="review-header" class="r-wrap">
           <div id="back-btn"><i class="fas fa-chevron-left"></i></div>
            <img src="/image/profile/<%=userProfileImg %>" id="profile">
            <h3><%=rc.getNickname() %>님의 리뷰</h3>
        </div>
        <hr>
        <div id="review-book" class="r-wrap">
            <div><a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>"><img src="<%=rc.getBookImage() %>" alt=""></a></div>
            <h5><%=rc.getBookTitle() %> - <%=rc.getBookAuthor() %></h5>
        </div>
        <hr>
        <div id="review-info" class="r-wrap">
            <span>작성일 : <%=rc.getReviewDate() %></span>
            <span>조회수 : <%=rc.getReviewCount() %></span>
            <span>평점 : <i class="fas fa-star"></i><%=rc.getReviewRate() %></span>
            <span id="review-heart-and-count"><span class="review-heart"><i class="fas fa-heart review-heart"></i></span> <span class="heart-count"><%=rc.getReviewRate() %></span></span>
        </div>
        <div id="review-text" class="r-wrap"><%=rc.getReviewCont() %></div>
        <%if(m!=null) {%>
        <hr>
        <div id="review-footer" class="r-wrap">
            <form id="modifyForm" action="/reviewModify.rw" method="get">
            <input type="hidden" name="reviewId" value="<%=rc.getReviewId()%>">
            <input type="hidden" name="memberNo" value="<%=m.getMemberNo()%>">
            <div id="modify-btn">수정</div>
            </form>
            <form id="deleteForm" action="reviewDelete.rw" method="get">
            <input type="hidden" name="reviewId" value="<%=rc.getReviewId()%>">
            <input type="hidden" name="memberNo" value="<%=m.getMemberNo()%>">
            <div id="delete-btn">삭제</div>
            </form>
        </div>
        <%} %>
    </div>
    <%@ include file="/views/common/footer.jsp" %>
    <script>
    	$(function(){
    		//뒤로가기
    		$('#back-btn').click(function(){
    			location.href="/reviewPage.rw";
    		});
    		//수정
    		$('#modify-btn').click(function(){
    			$('#modifyForm').submit();
    		});
    		//삭제
			$('#delete-btn').click(function(){
    			var result = window.confirm('정말로 리뷰를 삭제하시겠습니까?');
    			if(result){
    				$('#deleteForm').submit();
    			}
    		});
    	});
    </script>
</body>
</html>