<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="rw.col.model.vo.CollectionData" %>
<%@ page import="rw.col.model.vo.LibraryCollection" %>
<%@ page import="rw.col.model.vo.OtherBookcase" %>
<%@ page import="rw.col.model.vo.BookshelfCollection" %>
<%@ page import="rw.col.model.vo.ReviewCollection" %>
<%@ page import="rw.review.model.vo.Book" %>
<%@ page import="rw.review.model.vo.ReviewCard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 폰트 어썸 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"	crossorigin="anonymous"></script>
<!-- font noto sans kr -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<!-- 스타일 시트 -->
<!-- 서재 헤더 -->
<link rel="stylesheet" type="text/css"
	href="/views/css/library_my_contents_top.css" />
<!-- 리뷰 카드 -->
<link rel="stylesheet" type="text/css"
	href="/views/css/other_review_card.css" />

<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

.collectionIcon {
	cursor: pointer;
}

* {
	/* 전체 태그 */
	margin: 0;
	padding: 0;
	text-decoration-line: none;
	list-style: none;
	font-size: 1rem;
}

#myCollection-wrapper {
	width: 100%;
	padding: 0;
}

/************** 콘텐츠 **************/

/********** contents myCollection **********/
/* 리뷰 */
#myCollection-contents {
	/* 가로중앙 */
	margin: 0 auto;
	width: 1200px;
}

.myCollection-contents-title {
	/* 타이틀 중 '?개의 리뷰' 부분 스타일 */
	font-weight: bold;
	font-size: 1.6rem;
	height: 150px;
	padding-top: 4%;
}

/****************리뷰카드*****************/

/* 서재 */
.others-library {
	/* 각각의 다른 사람 서재*/
	display: inline-block;
	margin: 0 20px;
	position: relative;
	bottom: 20px;
}
/* SCROLL */
#others-library-wrap {
	/*  */
	white-space: nowrap;
	overflow-x: auto;
}

#others-library-wrap::-webkit-scrollbar {
	visibility: hidden;
	width: 20px;
	height: 15px;
}

#others-library-wrap:hover::-webkit-scrollbar {
	visibility: visible;
	width: 20px;
	height: 15px;
}
/* 스크롤바의 width */
#others-library-wrap:hover::-webkit-scrollbar-track {
	display: none;
}
/* 스크롤바의 전체 배경색 */
#others-library-wrap:hover::-webkit-scrollbar-thumb {
	background-color: #ffe58d;
	border-radius: 40px 40px 40px 40px;
}
/* 스크롤바 색 */
#others-library-wrap:hover::-webkit-scrollbar-button {
	display: none;
}
/* 위 아래 버튼 (버튼 없애기를 함) */
.others-user-profile {
	/* 다른사람의 프로필 이미지 div */
	width: 130px;
	height: 130px;
	border-radius: 100%;
	overflow: hidden;
	position: relative;
	z-index: 15;
}

.others-user-profile>img {
	/* 다른사람의 프로필 이미지 div> 이미지 태그 */
	width: 130px;
	height: 130px;
}

.others-library-delete {
	/* 다른 사람 서재를 삭제하는 버튼을 감싼 div를 감싼 div (동그라미) */
	width: 45px;
	height: 45px;
	border-radius: 100%;
	z-index: 25;
	position: relative;
	top: 43px;
	left: 90px;
	background-color: white;
	box-shadow: 0 0 3px 1px #D5D5D5;
	font-size: 24px;
	text-align: center;
	color: gray;
	padding-top: 7%;
}

.others-library-name {
	/* 다른사람 닉네임 text */
	text-align: center;
	padding-top: 8px;
}

/* 책장 */
#myCollection-collectionlist {
	white-space: nowrap;
	overflow-x: auto;
}
/* SCROLL */
#myCollection-collectionlist::-webkit-scrollbar {
	visibility: hidden;
	width: 20px;
	height: 15px;
}

#myCollection-collectionlist:hover::-webkit-scrollbar {
	visibility: visible;
	width: 20px;
	height: 15px;
}
/* 스크롤바의 width */
#myCollection-collectionlist:hover::-webkit-scrollbar-track {
	display: none;
}
/* 스크롤바의 전체 배경색 */
#myCollection-collectionlist:hover::-webkit-scrollbar-thumb {
	background: #ffe58d;
	opacity: 0.5;
	border-radius: 40px 40px 40px 40px;
}
/* 스크롤바 색 */
#myCollection-collectionlist:hover::-webkit-scrollbar-button {
	display: none;
}
/* 위 아래 버튼 (버튼 없애기를 함) */
.collectionBox {
	/* 다른 사람 책장 */
	width: 700px;
	height: 432px;
	border-radius: 30px;
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 50px;
	padding: 20px;
	background-color: #FFFFF6;
	box-shadow: 0 2px 5px #D5D5D5;
}

.collectionBox-top {
	/* 다른 사람 책장 이름 및 삭제버튼 div */
	padding: 0px 30px 0 20px;
	font-size: 22px;
}

.collectionBox-title {
	/* 다른 사람의 책장 이름 */
	padding-left: 2%;
}

.collectionBox-delete {
	/* 다른 사람 책장 삭제 버튼 */
	padding-right: 5%;
	font-size: 22px;
	text-align: right;
	color: gray;
}

.collectionBox-wrap {
	/* 책장의 책 리스트 */
	padding-left: 10px;
}

.collectionBox-book {
	/* 책장의 책 */
	width: 120px;
	height: 160px;
	margin: 4px;
	box-shadow: 1px 1px 3px #D5D5D5;
	float: left;
	overflow: hidden;
	padding: 0;
}

.collectionBox-book>img {
	/* 책 속의 이미지 태그 */
	height: 100%;
	width: 100%;
}
</style>
</head>
<body> <!-- 컬렉션 id랑 세션 id랑 같으면 내서재. 다르면 남의 서재 -->
	<% 
	   Member owner = (Member)request.getAttribute("owner"); //서재 주인
	  	//Review 데이터
	  	CollectionData<ReviewCard,ReviewCollection> cdRR = (CollectionData<ReviewCard,ReviewCollection>)request.getAttribute("review");
	  	ArrayList<ReviewCard> rcList = cdRR.getList();
	  	ArrayList<ReviewCollection> rcColList = cdRR.getColList();
	  	String rcPageNavi = cdRR.getPageNavi();
	  	HashMap<String,Integer> reviewLikeList = (HashMap<String,Integer>)request.getAttribute("reviewLikeList");
		int rcTotalCount = (int)request.getAttribute("rcTotalCount");
	  	
		//library 데이터
		CollectionData<Member,LibraryCollection> cdML = (CollectionData<Member,LibraryCollection>)request.getAttribute("library"); 
		ArrayList<Member> libMList = cdML.getList();
		ArrayList<LibraryCollection> lcList = cdML.getColList();
		String lcPageNavi = cdML.getPageNavi();
		int lcTotalCount = (int)request.getAttribute("lcTotalCount");
		
		//bookshelf 데이터
		CollectionData<OtherBookcase,BookshelfCollection> cdBB = (CollectionData<OtherBookcase,BookshelfCollection>)request.getAttribute("bookshelf");
		ArrayList<OtherBookcase> obList = cdBB.getList();
		ArrayList<BookshelfCollection> bcList = cdBB.getColList();
		String bsPageNavi = cdBB.getPageNavi();
		int bsTotalCount = (int)request.getAttribute("bsTotalCount");
	%>
	<div id="myCollection-wrapper" class="container-fluid">
		<div id="myLibrary-contents-header" class="row">
			<!-- contents-header -->
			<div class="col-12">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<%if(owner.getProfileImg()!=null) {%>
								<img src="/image/profile/<%=owner.getProfileImg() %>" title="<%=owner.getNickname()%>"/>
								<% }else{ %>
								<img src="/image/profile/default_user_dark.png" />
							<%} %>
						</div>
					</div>
					<div class="col-10">
						<div class="row">
							<div id="myLibrary-title" class="col-12"><%=owner.getNickname() %> 님의 서재</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a href="/myReviewNote.rw?libraryOwner=<%=owner.getMemberId()%>">리뷰노트</a></li>
									<li class="col-2"><a href="/myBookCase.rw?libraryOwner=<%=owner.getMemberId()%>">책장</a></li>
									<li class="col-2"><a href="/myCollection.rw?libraryOwner=<%=owner.getMemberId()%>">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="myCollection-contents" class="row">
			<div class="col-12">
				<div id="myCollection-cardList" class="row">
					<div id="myCollection-review-count"	class="col-12 myCollection-contents-title">리뷰(<%=rcTotalCount %>)</div>
					<div class="col-12">

						<% for(ReviewCard rc : rcList){ %>
						<div class="other_review-card">
							<div class="other_review-card-book-img">
								<span class="other_reviweScrap collectionIcon"> <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								 <path fill-rule="evenodd"	d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z" />
									</svg>
								</span> <img src="<%=rc.getBookImage()%>" title="누르면 해당 도서페이지로 이동합니다." />
							</div>
							<div class="other_review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
								<div class="other_review-card-book-title">
									<span class="other_review-card-book-title-text"	style="width: 290px;"><%=rc.getBookTitle()%></span>
									 <span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate()%>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row other_review-card-bttom">
								<div class="col-3">
									<div class="other_review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>" class="other_writer-profile-img" writer="<%=rc.getMemberId()%>" title="누르면 해당 회원의 서재로 이동합니다." />
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
								<div class="col-3 other_rvheart other_reviewNoteIcon">
									<div class="other_review-heart-and-count">
										<span class="other_review-heart"><a> <%// if(rc.getLikeYN()=='Y'){%>♥<%//}else {%>♡<%// }%></a></span> 
										<span class="other_heart-count"><%=reviewLikeList.get(rc.getReviewId()) %></span>
									</div>
								</div>
							</div>
						</div>
						<% } // foreach문 %>
						<script>
							$(function() {
								//// 카드 프로필 이미지 클릭 시 해당 멤버의 서재로 이동
								$('.other_writer-profile-img').click(function(e) {
									var $writer = $(this).attr('writer');
									if (confirm($writer	+ '님의 서재로 이동하시겠습니까?')) {
										location.href = '/myReviewNote.rw?libraryOwner='+ $writer;
									}
										e.stopImmediatePropagation(); // 버블링 방지
								});
							})
						</script>
					</div>

				</div>
				<!-- 카드 리스트 -->
				<nav aria-label="Page navigation example">
				<ul class="pagination">
					<%=rcPageNavi %>
				</ul>
				</nav>
			</div>

			<div class="col-12">
				<div class="row">
					<div id="myCollection-review-count"	class="col-12 myCollection-contents-title">서재(<%=lcTotalCount %>)</div>
					<div id="others-library-wrap" class="col-12">
						<% for(Member m2 : libMList) {%>
						<div class="others-library">
							<div class="others-library-delete collectionIcon">
								<i class="fas fa-trash-alt"></i>
							</div>
							<div class="others-user-profile">
								<%if(m2.getProfileImg()!=null) {%>
								<img src="/image/profile/<%=m2.getProfileImg() %>" title="<%=m2.getNickname()%>"/>
								<% }else{ %>
								<img src="/image/profile/default_user_dark.png" />
								<%} %>
							</div>
							<div class="others-library-name"><%=m2.getNickname() %>의 서재</div>
						</div>
						<%} %>
					</div>
					<nav aria-label="Page navigation example">
					<ul class="pagination">
						<%=lcPageNavi %>
					</ul>
					</nav>
				</div>
			</div>

			<div class="col-12">
				<div class="row">
					<div id="myCollection-collection-count"
						class="col-12 myCollection-contents-title">책장(<%=bsTotalCount %>)</div>
					<div id="myCollection-collectionlist" class="col-12">
					<%for(OtherBookcase ob : obList) {%>
						<div class="collectionBox">
							<div class="row collectionBox-title">
								<div class="col-9"><%=ob.getM().getNickname() %>님의 <%=ob.getLib().getBookShelfName() %></div>
								<div class="col-3 collectionBox-delete">
									<i class="fas fa-trash-alt collectionIcon"></i>
								</div>
							</div>
							<hr>
							<div class="collectionBox-wrap">
								<%for(Book b : ob.getBookList()){ %>
								<div class="collectionBox-book">
									<img src="/image/book/<%=b.getBookImage()%>">
								</div>
								<%} %>
							</div>
						</div>
						<%} %>

					</div>
					<nav aria-label="Page navigation example">
					<ul class="pagination">
						<%=bsPageNavi %>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
		// other_
		// review-card-text 누르면 개별리뷰페이지로 이동
		$('.other_review-card-text').mousedown(
				function() {
					$(this).css('box-shadow', '0px 0px 10px 5px #0080ff').css(
							'position', 'relative').css('z-index', '999');
				});// 클릭 뗄 때 이동
		$('.other_review-card-text').mouseup(
				function() {
					$(this).css('box-shadow', '').css('position', '').css(
							'z-index', '');
					location.href = "#";// 개별 도서 페이지
				});// 마우스가 요소 외부에 있을 때 그림자 삭제
		$('.other_review-card-text').mouseout(
				function() {
					$(this).css('box-shadow', '').css('position', '').css(
							'z-index', '');
				});

		// review-card-book-img 누르면 개별도서페이지로 이동
		$('.other_review-card-book-img').mousedown(function() {
			$(this).css('box-shadow', '0px 0px 10px 5px #0080ff');
		});// 클릭 뗄 때 이동
		$('.other_review-card-book-img').mouseup(function() {
			$(this).css('box-shadow', '');
			location.href = "#";// 개별 도서 페이지
		});// 마우스가 요소 외부에 있을 때 그림자 삭제
		$('.other_review-card-book-img').mouseout(function() {
			$(this).css('box-shadow', '');
		});

		// 리뷰 좋아요 클릭 시
		$('.rvheart').click(function() {
			// 현재 하트 상태 데이터 가져오기
			let heart = $(this).find('.review-heart').text();
			// 현재 좋아요 수 데이터 가져오기
			let count = parseInt($(this).find('.heart-count').text());
			if (heart.indexOf('♡') > -1) {
				// 1. 여기에 좋아요 누른 데이터 보내고
				// 2. 다시 받아와서 뿌려주는 로직..?
				$(this).find('.review-heart').text('♥');
				$(this).find('.heart-count').text(count + 1);
			} else {
				$(this).find('.review-heart').text('♡');
				$(this).find('.heart-count').text(count - 1);
			}
		});

		// 책갈피
		$('.other_reviweScrap').click(function(e) {
			var color = $(this).css('color');
			console.log(color);
			if (color == 'rgb(255, 108, 108)') {
				if (confirm('해당 리뷰를 삭제하시겠습니까?')) {
					$(this).css('color', 'gray');
				}
			} else {
				$(this).css('color', '#FF6C6C');
			}
			e.stopImmediatePropagation(); // 버블링 방지
		});

		// 다른 사람 서재 삭제 버튼 클릭 시 
		$('.others-library-delete').click(function() {
			if (confirm("해당 서재를 삭제하실건가요?")) {
				//삭제 로직
			}
		});

		//
		$('.collectionBox-delete>.fa-trash-alt').click(function() {
			confirm('해당 책장을 삭제하실건가요?');
		});

		// lnb hover 시 
		$('#myCollection-lnb>li>a').hover(function() {
			$(this).css('font-weight', 'bold');
		}, function() {
			$(this).css('font-weight', '');
		});

		// lnb bold 처리
		var lnbText = $('#pagename').text();
		console.log(lnbText);
		if (lnbText == '리뷰노트') {
			$('#myLibrary-lnb>li:nth-child(1)').css('font-weight', 'bold');
		} else if (lnbText == '책장') {
			$('#myLibrary-lnb>li:nth-child(2)').css('font-weight', 'bold');
		} else if (lnbText == '컬렉션') {
			$('#myLibrary-lnb>li:nth-child(3)').css('font-weight', 'bold');
		}

	})
</script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>