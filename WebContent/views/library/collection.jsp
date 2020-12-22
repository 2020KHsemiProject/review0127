<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="rw.col.model.vo.CollectionPageData" %>
<%@ page import="rw.col.model.vo.OtherBookcase" %>
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
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"	crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!-- font noto sans kr -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<!-- 스타일 시트 -->
<!-- 서재 헤더 -->
<link rel="stylesheet" type="text/css"	href="/views/css/library_my_contents_top.css" />
<!-- 리뷰 카드 -->
<link rel="stylesheet" type="text/css"	href="/views/css/other_review_card.css" />

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
	/*position: relative;
	bottom: 20px;*/
}
/* SCROLL */
#others-library-wrap {
	text-align:center;
	height:200px;
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
	
	left: 90px;
	background-color: white;
	box-shadow: 0 0 3px 1px #D5D5D5;
	font-size: 24px;
	text-align: center;
	color: gray;
	padding:7%;
}

.others-library-name {
	/* 다른사람 닉네임 text */
	text-align: center;
	padding-top: 8px;
}

/* 책장 */
#myCollection-collectionlist {
	width: 1200px;
	height:950px;
	text-align:center;
}
/* 위 아래 버튼 (버튼 없애기를 함) */
.collectionBox {
	/* 다른 사람 책장 */
	width: 800px;
	height: 432px;
	border-radius: 30px;
	display: inline-block;
	margin: 0 auto 50px;
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
	margin: 10px;
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
/* 페이지 네비게이션*/
nav{
margin:0 auto;
}

#library-add-btn{
	display:inline-block;
	width:160px;
	background-color:rgb(255,255,255,0.5);
	color:#7895B5;
	border-radius : 10px;
	margin-left:5px;
	text-align:center;
}

#myLibrary-contents-header{
	background-color:#7895B5;
	color:white;
}

#deleteLibForm{
	height:10px;
}

#myLibrary-lnb *{
	color:white;
}
/* 컬렉션 id랑 세션 id랑 같으면 내서재. 다르면 남의 서재 */
<% Member owner = (Member)request.getAttribute("owner"); //서재 주인%>
<%if(m!=null && m.getMemberNo().equals(owner.getMemberNo())){ %>
#myLibrary-contents-header{
	background-color:#ffe58d;
	color:black;
}
#myLibrary-lnb *{
	color:black;
}
<%}%>
</style>
</head>
<body> 
	<% 
	   
	  	//Review 데이터
	  	CollectionPageData<ReviewCard> cpdRC = (CollectionPageData<ReviewCard>)request.getAttribute("review");
	  	ArrayList<ReviewCard> rcList = cpdRC.getList();
	  	String rcPageNavi = cpdRC.getPageNavi();
	  	HashMap<String,Integer> reviewLikeList = (HashMap<String,Integer>)request.getAttribute("reviewLikeList");
		int rcTotalCount = cpdRC.getTotalCount();
	  	
		//library 데이터
		CollectionPageData<Member> cpdML = (CollectionPageData<Member>)request.getAttribute("library"); 
		ArrayList<Member> libMList = cpdML.getList();
		String lcPageNavi = cpdML.getPageNavi();
		int lcTotalCount = cpdML.getTotalCount();
		
		//bookshelf 데이터
		CollectionPageData<OtherBookcase> cpdBB = (CollectionPageData<OtherBookcase>)request.getAttribute("bookshelf");
		ArrayList<OtherBookcase> obList = cpdBB.getList();
		String bsPageNavi = cpdBB.getPageNavi();
		int bsTotalCount = cpdBB.getTotalCount();
		
		//내 서재에 있는지 확인
		boolean inMyLibCol = (boolean)request.getAttribute("inMyLibCol");
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
							<div id="myLibrary-title" class="col-12"><%=owner.getNickname() %> 님의 서재 
							<%if(m!=null && !(m.getMemberNo().equals(owner.getMemberNo()))){ %>
								<%if(inMyLibCol) {%>
								<a id="library-add-btn" href="/libraryCollectionRemove2.rw?memberId=<%=owner.getMemberId()%>">내 컬렉션에서 빼기</a>
								<%}else{ %>
								<a id="library-add-btn" href="/libraryCollectionAdd.rw?memberId=<%=owner.getMemberId()%>">내 컬렉션에 추가</a>
								<%} %>
							<%} %>
							</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a href="/myReviewNote.rw?libraryOwner=<%=owner.getMemberId()%>">리뷰노트</a></li>
									<li class="col-2"><a href="/myBookCase.rw?libraryOwner=<%=owner.getMemberId()%>">책장</a></li>
									<li class="col-2"><a href="/myCollection.rw?libraryOwner=<%=owner.getMemberId()%>" style="font-weight:700;">컬렉션</a></li>
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
					<div class="col-12" id="other-review-card-wrap">
						<% for(ReviewCard rc : rcList){ %>
						<div class="other_review-card">
							<div class="other_review-card-book-img">
							<%if(m!=null && m.getMemberNo().equals(owner.getMemberNo())){ %>
							<form action="/reviewCollectionRemove.rw" method="get" id="deleteRcForm">
								<input type="hidden" name="reviewId" value="<%=rc.getReviewId()%>">
								<span class="other_reviewScrap collectionIcon"> <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="#FF6C6C" xmlns="http://www.w3.org/2000/svg">
								 <path fill-rule="evenodd"	d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z" />
									</svg>
								</span></form><%} %> <img src="<%=rc.getBookImage()%>" title="누르면 해당 도서페이지로 이동합니다." />
							</div>
							<div class="other_review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
								<div class="other_review-card-book-title">
									<span class="other_review-card-book-title-text"	style="width: 290px;"><%=rc.getBookTitle()%></span>
									 <span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate()%>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row other_review-card-bottom">
								<div class="col-3">
									<div class="other_review-card-writer-profile">
									<%if(rc.getProfileImg() != null) {%>
										<img src="/image/profile/<%=rc.getProfileImg()%>" class="other_writer-profile-img" writer="<%=rc.getMemberId()%>" title="[<%=rc.getNickname()%>]님의 서재로 이동합니다." />
										<%}else{ %>
										<img src="/image/profile/default_user_dark.png" class="other_writer-profile-img" writer="<%=rc.getMemberId()%>" title="[<%=rc.getNickname()%>]님의 서재로 이동합니다." />
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
								<div class="col-3 other_rvheart other_reviewNoteIcon">
									<div class="other_review-heart-and-count">
										<span class="other_review-heart"><% if(rc.getLikeYN()=='Y'){%>♥<%}else {%>♡<% }%></span> 
										<span class="other_heart-count" review="<%=rc.getReviewId() %>"><%=reviewLikeList.get(rc.getReviewId()) %></span>
									</div>
								</div>
							</div>
						</div>
						<% } // foreach문 %>
					</div>
				<!-- 카드 리스트 -->
				<nav aria-label="Page navigation example">
				<ul class="pagination" id="rcPageNavi">
					<%=rcPageNavi %>
				</ul>
				</nav>
				</div>
			</div>
			
			<div class="col-12">
				<div class="row">
					<div id="myCollection-library-count"	class="col-12 myCollection-contents-title">서재(<%=lcTotalCount %>)</div>
					<div id="others-library-wrap" class="col-12">
						<% for(Member m2 : libMList) {%>
						<div class="others-library">
							<%if(m!=null && m.getMemberNo().equals(owner.getMemberNo())){ %>
							<form action="/libraryCollectionRemove.rw" method="get" id="deleteLibForm">
							<input type="hidden" name="memberId" value="<%=m2.getMemberId()%>">
							<div class="others-library-delete collectionIcon">
								<i class="fas fa-trash-alt"></i>
							</div>
							</form>
							<%} %>
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
					<ul class="pagination" id="lcPageNavi">
						<%=lcPageNavi %>
					</ul>
					</nav>
				</div>
			</div>

			<div class="col-12">
				<div class="row">
					<div id="myCollection-collection-count"	class="col-12 myCollection-contents-title">책장(<%=bsTotalCount %>)</div>
					<div id="myCollection-collectionlist" class="col-12">
					<%for(OtherBookcase ob : obList) {%>
						<div class="collectionBox">
							<div class="row collectionBox-title">
								<div class="col-11"><%=ob.getM().getNickname() %>님의 <%=ob.getLib().getBookShelfName() %></div>
								<%if(m!=null && m.getMemberNo().equals(owner.getMemberNo())){ %>
								<form action="/boolshelfCollectionRemove.rw" method="get" id="deleteBscForm">
								<input type="hidden" name="bookshelfId" value="<%=ob.getLib().getBookShelfId()%>">
								<div class="col-3 collectionBox-delete">
									<i class="fas fa-trash-alt collectionIcon"></i>
								</div>
								</form>
								<%} %>
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
					<ul class="pagination" id="bsPageNavi">
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
		$('.other_review-card-text').mousedown(	function() {
					$(this).css('box-shadow', '0px 0px 10px 5px #0080ff').css('position', 'relative').css('z-index', '999');
				});// 클릭 뗄 때 이동
		$('.other_review-card-text').mouseup(function() {
					$(this).css('box-shadow', '').css('position', '').css('z-index', '');
					location.href = "#";// 개별 도서 페이지
				});// 마우스가 요소 외부에 있을 때 그림자 삭제
		$('.other_review-card-text').mouseout(function() {
					$(this).css('box-shadow', '').css('position', '').css('z-index', '');
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

		// lnb hover 시 
		$('#myCollection-lnb>li>a').hover(function() {
			$(this).css('font-weight', 'bold');
		}, function() {
			$(this).css('font-weight', '');
		});

	})
	<%if(m!=null && m.getMemberNo().equals(owner.getMemberNo())){ %>
	// 책갈피 삭제
	$(document).on('click', '.other_reviewScrap', function(){
		if (window.confirm('해당 리뷰를 내 컬렉션에서 제거하시겠습니까?')) {
			$('#deleteRcForm').submit();
		}
	});
	$(document).on('click', '.others-library-delete', function(){
	// 다른 사람 서재 삭제 버튼 클릭 시 
		if (window.confirm("해당 서재를 내 컬렉션에서 제거하시겠습니까?")) {
			$('#deleteLibForm').submit();
		}
	});
	//책장 컬렉션
	$(document).on('click', '.collectionBox-delete>.fa-trash-alt', function(){
		if(window.confirm('해당 책장을 내 컬렉션에서 제거하시겠습니까?')){
			$('#deleteBscForm').submit();
		};
	});
	<%}%>
	// 리뷰 좋아요 클릭 시
	$(document).on('click', '.other_review-heart-and-count', function(){
		<%if(m!=null){ %>
		var $this = $(this);
		// 현재 하트 상태 데이터 가져오기
		var heart = $(this).children().eq(0).html();
		// 현재 좋아요 수 데이터 가져오기
		var count = $(this).children().eq(1).html();
		var reviewId = $(this).children().eq(1).attr('review');
		$.ajax({
			url : '/reviewLike.rw',
			data : {"reviewId" : reviewId,},
			type : 'get',
			success : function(data){
				$this.children().eq(1).html(data.count);
				if(data.yn=="Y"){
					$this.children().eq(0).html("♥");
					alert('좋아요를 눌렀습니다.');
				}else if(data.yn=="N"){
					$this.children().eq(0).html("♡");
					alert('좋아요를 해제했습니다.');
				}
				
			},
			error : function(){
				alert('좋아요를 실패했습니다.');
			}
		});
		<%} else {%>
			alert('로그인시 이용할 수 있습니다.');
		<%}%>
	});
	
	
	//남의 서재 이동
	$(document).on('click', '.other_writer-profile-img', function(){
		var $writer = $(this).attr('writer');
		if (confirm($writer	+ '님의 서재로 이동하시겠습니까?')) {
			location.href = '/myReviewNote.rw?libraryOwner='+ $writer;
		}
	});
	
	//리뷰컬렉션 페이지 전환
	$(document).on('click', '#rcPageNavi .page-link', function(){
		var thisLoca = $(this).html();
		var currentPage;
		if(!isNaN(thisLoca)){
			currentPage = thisLoca;
		}else{
			var label = $(this).attr('aria-label');
			if(label=="Next"){
				currentPage = $(this).parent().prev().children().eq(0).html+1;
			}else if(label=="Previous"){
				currentPage = $(this).parent().next().children().eq(0).html-1;
			}
		}
		$.ajax({
			url : "/rwcolSelect.rw",  
			data : {"reviewCurrentPage" : currentPage,
				"libraryOwner" : "<%=owner.getMemberId()%>"
			},
			type : "post",
			success : function(data){
				console.log(data);
				$('#other-review-card-wrap').empty();
				var input = "";
				for(var i=0;i<data.dataList.length;i++){
					input += '<div class="other_review-card"><div class="other_review-card-book-img">';
					if(data.inMyLibCol =="true"){
						 input += '<form action="/reviewCollectionRemove.rw" method="get" id="deleteRcForm"><input type="hidden" name="reviewId" value="' +data.dataList[i].reviewId
						+'"><span class="other_reviewScrap collectionIcon"> <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="#FF6C6C" xmlns="http://www.w3.org/2000/svg">'
						 + '<path fill-rule="evenodd"	d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z" /></svg></span></form>';
					}
					 input += ' <img src="'	+data.dataList[i].bookImage+ '" title="누르면 해당 도서페이지로 이동합니다." /></div><div class="other_review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">'
					 +'<div class="other_review-card-book-title"><span class="other_review-card-book-title-text" style="width: 290px;">' +data.dataList[i].bookTitle
					 +'</span><span class="other_review-card-star"><i class="fas fa-star"></i></span>' + data.dataList[i].reviewRate + '</div>' + data.dataList[i].reviewCont +
					 '</div><div class="row other_review-card-bottom"><div class="col-3"><div class="other_review-card-writer-profile"><img src="/image/profile/';
					if(data.dataList[i].profileImage!=null){
						input += data.dataList[i].profileImg+'" title="['+data.dataList[i].nickname+']님의 서재로 이동합니다."';
					}else{ input += 'default_user_dark.png" title="['+data.dataList[i].nickname+']님의 서재로 이동합니다."';}
					input += 'class="other_writer-profile-img" writer="'+ data.dataList[i].memberId + '"/></div></div><div class="col-6">'
					+ '<div class="row other_review-card-infor"><div class="col-12">' + data.dataList[i].nickname +	'</div><div class="col-12"><div class="row"><div class="col-7">' + data.dataList[i].reviewDate 
					+ '</div><div class="col-5 other_review-card-count"> 조회 '+ data.dataList[i].reviewCount +
					'</div></div></div></div></div><div class="col-3 other_rvheart other_reviewNoteIcon"><div class="other_review-heart-and-count"><span class="other_review-heart">';
					if(data.dataList[i].likeYN=='Y'){ input += '♥';	}else {	input += '♡';}
					input += '</span><span class="other_heart-count" review="'+data.dataList[i].reviewId+'">'+ data.likeList[data.dataList[i].reviewId]+'</span></div></div></div></div>';
				}
				$('#other-review-card-wrap').html(input);
				$('#rcPageNavi').empty().html(data.pageNavi);
			},
			error : function(){
				alert('페이지 로드에 실패했습니다.');
			}
		});
		
	});
	//서재컬랙션 페이지 전환
	$(document).on('click', '#lcPageNavi .page-link', function(){
		var thisLoca = $(this).html();
		var currentPage;
		if(!isNaN(thisLoca)){
			currentPage = thisLoca;
		}else{
			var label = $(this).attr('aria-label');
			if(label=="Next"){
				currentPage = $(this).parent().prev().children().eq(0).html+1;
			}else if(label=="Previous"){
				currentPage = $(this).parent().next().children().eq(0).html-1;
			}
		}
		$.ajax({
			url : "/libcolSelect.rw",
			data : {"libraryCurrentPage" : currentPage,
				"libraryOwner" : "<%=owner.getMemberId()%>"
			},
			type : "post",
			success : function(data){
				$('#others-library-wrap').empty();
				var input = "";
				for(var i=0;i<data.dataList.length;i++){
					input +='<div class="others-library">';
					if(data.inMyLibCol =="true"){
						 input += '<form action="/libraryCollectionRemove.rw" method="get" id="deleteLibForm"><input type="hidden" name="memberId" value="'
						+data.dataList[i].memberId+'"><div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div></form>';
					}
					input += '<div class="others-user-profile">';
					if(data.dataList[i].profileImg!=null) {
					  input += '<img src="/image/profile/'+data.dataList[i].profileImg+'" title="'+data.dataList[i].nickname+'"/>';
					}else{ input += '<img src="/image/profile/default_user_dark.png" />';}
					input += '</div><div class="others-library-name">'+data.dataList[i].nickname+'의 서재</div></div>';
				}
				$('#others-library-wrap').html(input);
				$('#lcPageNavi').empty().html(data.pageNavi);
			},
			error : function(){
				alert('페이지 로드에 실패했습니다.');
			}
		});
	});
	//책장컬렉션 페이지 전환
	$(document).on('click', '#bsPageNavi .page-link', function(){
		var thisLoca = $(this).html();
		var currentPage;
		if(!isNaN(thisLoca)){
			currentPage = thisLoca;
		}else{
			var label = $(this).attr('aria-label');
			if(label=="Next"){
				currentPage = $(this).parent().prev().children().eq(0).html+1;
			}else if(label=="Previous"){
				currentPage = $(this).parent().next().children().eq(0).html-1;
			}
		}
		$.ajax({
			url : "/bscolSelect.rw",
			data : {"bookshelfCurrentPage" : currentPage,
				"libraryOwner" : "<%=owner.getMemberId()%>"
			},
			type : "post",
			success : function(data){
				$('#myCollection-collectionlist').empty();
				var input = "";
				for(var i=0;i<data.dataList.length;i++){ // 근데 출력이 이상함
					input += '<div class="collectionBox"><div class="row collectionBox-title"><div class="col-11">'
						+ data.dataList[i].nickname + '님의 ' + data.dataList[i].bookshelfName +'</div>';
						if(data.inMyLibCol =="true"){
							input += '<form action="/boolshelfCollectionRemove.rw" method="get" id="deleteBscForm">'
							+'<input type="hidden" name="bookshelfId" value="'+data.dataList[i].bookshelfId+'"><div class="col-3 collectionBox-delete">'
							+ '<i class="fas fa-trash-alt collectionIcon"></i></div></form>';
						}
						'</div><hr><div class="collectionBox-wrap">';
						for(var j=0;j<data.dataList[i].bookList.length;j++){ 
						 	input += '<div class="collectionBox-book"><img src="/image/book/'+data.dataList[i].bookList[j].bookImage+'"></div>';
						}
					input += '</div></div>';
				}
				$('#myCollection-collectionlist').html(input);
				$('#bsPageNavi').empty().html(data.pageNavi);
			},
			error : function(){
				alert('페이지 로드에 실패했습니다.');	
			}
			});
	});
</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>