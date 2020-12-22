<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="rw.member.model.vo.Member"%>
<%@ page import="rw.review.model.vo.BookReview"%>
<%@ page import="rw.review.model.vo.Book"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/views/css/review_modify.css" rel="stylesheet" type="text/css" />
<!--웹폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
<!--부트스트랩-->
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"	crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"	crossorigin="anonymous"></script>
<!--별점주기-->
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/views/css/fontawesome-stars.css">
<script type="text/javascript" src="/views/js/jquery.barrating.js"></script>
<!-- fontawesome-->
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css" integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css" integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2" crossorigin="anonymous">
</head>
<body>
	<%
		BookReview br = (BookReview)request.getAttribute("bookReview");
		Book b = (Book)request.getAttribute("book");
		if (m != null) {
	%>
	<div id="contents">
		<%
			//String profileImg; // 프로필 이미지 처리. 없으면 기본 이미지
				if (m.getProfileImg() != null) {
					profileImg = m.getProfileImg();
				} else {
					profileImg = "default_user_dark.png";
				}
				String bookId = request.getParameter("bookId");
		%>
		<div id="write-head">
			<img src="/image/profile/<%=profileImg%>" alt="" id="profile">
			<p id="write-head-top">@<%=m.getNickname()%>님의 My Review</p>
		</div>
		<div id="book-wrap">
			<div id="book-image"><img src="<%=b.getBookImage()%>"></div>
			<div id="book-info"><%=b.getBookTitle() %><br><%=b.getBookAuthor() %></div>
			
		</div>
		<form action="/reviewUpdate.rw" method="post">
			<input type="hidden" name="reviewId" value="<%=br.getReviewId()%>">
			<div id="rate-wrap">
				<span>이 책의 별점은 몇개인가요?</span> <select id="example" name="reviewRate">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<textarea id="reivew-con" name="reviewCont"
				placeholder="리뷰를 작성해 주세요(2000자 이내)"><%=br.getReviewCont() %></textarea>
			<p id="txt-len-wrap">
				<span id="textLength"></span>/2000자
			</p>
			<input type="reset" value="수정 취소" id="reset-btn">
			 <input	type="submit" value="수정하기" id="submit-btn">
		</form>
	</div>
	<script>
        $(function() {
        	//처음셋팅
        	var selector = "#example>option[value="+<%=br.getReviewRate() %>+"]";
        	$(selector).prop('selected',true);
        	var firstInputLen = $('#reivew-con').val().length;
        	$('#textLength').text(firstInputLen);
            //별점 처리 함수
            $('#example').barrating({
                theme: 'fontawesome-stars'
            });
            
			//글자수 제한
			$('#reivew-con').keyup(function() {
				var inputStr = $('#reivew-con').val().length;
				if (inputStr >= 2000) {
					$('#reivew-con').val($('#reivew-con').val().substring(0, 2000));
					$('#textLength').text(2000);
				} else {
					$('#textLength').text(inputStr);
				}
			});
			//제출 전 검증
			$('#submit-btn').click(function() {
				if ($('#reivew-con').val() == "") {
					alert('리뷰를 작성해주세요');
					return false;
				} else {
					return true;
				}
			});

		});
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%} else {%>
	<script>
		alert('잘못된 접근입니다.');
	</script>
	<%}%>
</body>
</html>