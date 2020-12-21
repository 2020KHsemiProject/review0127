<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="rw.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link href="/views/css/review_write.css" rel="stylesheet" type="text/css" />
<!--웹폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
	crossorigin="anonymous"></script>
<!--부트스트랩-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<!--별점주기-->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/fontawesome-stars.css">
<script type="text/javascript" src="../js/jquery.barrating.js"></script>
<!-- fontawesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/solid.css"
	integrity="sha384-yo370P8tRI3EbMVcDU+ziwsS/s62yNv3tgdMqDSsRSILohhnOrDNl142Df8wuHA+"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/fontawesome.css"
	integrity="sha384-ijEtygNrZDKunAWYDdV3wAZWvTHSrGhdUfImfngIba35nhQ03lSNgfTJAKaGFjk2"
	crossorigin="anonymous">
</head>
<body>
	<%
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
			<p id="write-head-top">@<%=m.getNickname()%>님의 My Review
			</p>
		</div>
		<form action="/reviewWrite.rw" method="post">
			<input type="text" name="bookName" placeholder="책 제목을 검색하세요."
				id="bookName"> <input type="button" value="도서 검색"
				id="searchBtn"> <input type="hidden" name="isbn"
				id="isbn-input" value=""> <input type="hidden" name="author"
				id="author-input" value=""> <input type="hidden"
				name="imageUrl" id="thumbnail-input">
			<div id="rate-wrap">
				<span>이 책의 별점은 몇개인가요?</span> <select id="example" name="reviewRate">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3" selected>3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<textarea id="reivew-con" name="reviewCont"
				placeholder="리뷰를 작성해 주세요(2000자 이내)"></textarea>
			<p id="txt-len-wrap">
				<span id="textLength"></span>/2000자
			</p>
			<input type="reset" value="등록 취소" id="reset-btn"> <input
				type="submit" value="등록하기" id="submit-btn">
			<div id="search-book-list"></div>
		</form>
	</div>
	<script>
        $(function() {
            //별점 처리 함수
            $('#example').barrating({
                theme: 'fontawesome-stars'
            });
            //도서 검색 api - 검색버튼
            $('#searchBtn').click(function() {
                $('#search-book-list').empty();
                $('#search-book-list').css('display', 'block').css('position', 'relative');
                var query = $('#bookName').val();
                $.ajax({
                        method: "GET",
                        url: "https://dapi.kakao.com/v3/search/book?target=title",
                        data: {
                            query: query
                        },
                        headers: {
                            Authorization: "KakaoAK ec3d74416465dd038d237fac4f57f5f7"
                        }
                    })
                    .done(function(msg) {
                        for (var i = 0; i < msg.documents.length; i++) {
                            $('#search-book-list').append('<div class="book-wrap"><div class="book-thumbnail"><img src="' + msg.documents[i].thumbnail + '" title="'+msg.documents[i].title+'"></div><div class="book-title" author="' + msg.documents[i].authors + '" isbn="' + msg.documents[i].isbn + '">' + msg.documents[i].title + '</div></div>');
                        }
                    });
            });
            //도서 id를 받아서 넘어온 경우 미리 셋팅
            <%if (bookId != null) {%>
            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book?target=title",
                data: {
                    query: "<%=bookId%>"
				},
				headers : {
					Authorization : "KakaoAK ec3d74416465dd038d237fac4f57f5f7"
				}
			}).done(function(msg) {
				$('#thumbnail-input').val(msg.documents[0].thumbnail);
				$('#bookName').val(msg.documents[0].title);
				$('#isbn-input').val(msg.documents[0].isbn);
				$('#author-input').val(msg.documents[0].authors);
			});
		<%}%>
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
				if ($('#isbn-input').val() == "") {
					alert('도서 검색버튼을 눌러서 도서를 입력해주세요');
					return false;
				} else if ($('#reivew-con').val() == "") {
					alert('리뷰를 작성해주세요');
					return false;
				} else {
					return true;
				}
			});

		});
		$(document).on('click', '.book-wrap', function() {
			var $this = $(this);
			var url = $this.children(0).children(0).attr('src');
			var title = $this.children(0).eq(1).html();
			var isbn = $this.children(0).eq(1).attr('isbn');
			var author = $this.children(0).eq(1).attr('author')
			$('#thumbnail-input').val(url);
			$('#bookName').val(title);
			$('#isbn-input').val(isbn);
			$('#author-input').val(author);
			$('#search-book-list').css('display', 'none');
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