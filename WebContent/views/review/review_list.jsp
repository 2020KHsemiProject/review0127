<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.review.model.vo.ReviewCard"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 폰트 어썸 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<!-- font noto sans kr -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link rel="stylesheet" type="text/css" href="/views/css/review_card.css" />
<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

button:focus {
	outline: none;
}

.reviewListIcon {
	cursor: pointer;
}

* {
	margin: 0;
	padding: 0;
	text-decoration-line: none;
	list-style: none;
	font-size: 1rem;
}

#reviewList-contents {
	/* 가로중앙 */
	margin: 0 auto;
	width: 1200px;
	margin-top: 70px;
}

#reviewList-top {
	width: 100%;
	height: 150px;
	text-align: center;
	padding: 30px 35px 0 0;
}

#reviewList-top>div {
	line-height: 150px;
	font-size: 2rem;
	position: relative;
	z-index: 1;
}

#reviewList-writeBar {
	width: 100%;
	height: 55px;
	padding-left: 10px;
}

#reviewList-contents>div:nth-child(2) {
	padding: 58px 30px 0 0;
	margin-bottom: 30px;
}

hr {
	margin: 1px;
}

.barLine {
	padding-top: 10px;
}

.reviewAlignBtn {
	width: 100px;
	height: 100%;
	line-height: 50px;
	float: left;
}

.reviewWriteBtn {
	height: 100%;
	line-height: 50px;
	text-align: center;
	float: right;
}

.writerBtn {
	width: 200px;
}

#moreReview {
	height: 150px;
	padding-top: 25px;
}

#moreDiv {
	text-align: center;
}

#moreBtn {
	width: 300px;
	height: 50px;
	background-color: white;
	border-radius: 50px 50px;
	border: 1px solid gray;
	margin: 0 auto;
	line-height: 50px;
}

#toTheTop {
	font-size: 50px;
	color: lightgray;
	text-align: right;
	position: fixed;
	top: 800px;
	left: 1600px;
	display: none;
}

.not-yet {
	margin: 0 auto;
	text-align: center;
	height: 450px;
	font-size: 3rem;
}
</style>

<script>
    
        $(function(){
        	
        	// 리뷰 좋아요 클릭 시
            $('.rvheart').click(function(){
            	// 현재 하트 상태 데이터 가져오기
                let heart = $(this).find('.review-heart').text();
            	// 현재 좋아요 수 데이터 가져오기
                let count = parseInt($(this).find('.heart-count').text());
                if(heart.indexOf('♡')>-1){
                	// 1. 여기에 좋아요 누른 데이터 보내고
                	// 2. 다시 받아와서 뿌려주는 로직..?
                    $(this).find('.review-heart').text('♥');
                    $(this).find('.heart-count').text(count+1);
                }else{
                    $(this).find('.review-heart').text('♡');
                    $(this).find('.heart-count').text(count-1);
                }
            });
        	
        	// #toTheTop 스크롤 시 나타났다 사라짐
        	$( window ).scroll( function() {
        		if ( $( this ).scrollTop() > 200 ) {
        			$( '#toTheTop' ).fadeIn();
        		} else {
        			$( '#toTheTop' ).fadeOut();
        		}
        	});
        	// #toTheTop 클릭 시 맨 위로
        	$( '#toTheTop' ).click( function() {
        		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        		return false;
        	} );
        	
        	// 추천순 최신순 정렬 버튼
			$('.reviewAlignBtn>span').click(function(){
				var listAlign = $(this).text();
				console.log(listAlign);
				if(listAlign=='추천순'){
					alert('준비중입니다!');
				}else if(listAlign=='최신순'){
					location.href="/reviewPage.rw";
				}
			});
			// 리뷰등록 링크
			$('.writerBtn').click(function(){
				location.href="/reviewWrite.rw";
			});
        })
    </script>


</head>
<body>
	<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list"); %>
	<div id="reviewList-wrapper">
		<%@ include file="/views/common/header.jsp"%>
		<div id="reviewList-contents">
			<div id="reviewList-top">
				<div>review</div>
			</div>
			<div>
				<hr style="border: 1px solid gray;">
				<div id="reviewList-writeBar">
					<div class="reviewAlignBtn">
						<span class="reviewListIcon">추천순</span>
					</div>
					<div class="reviewAlignBtn">
						<span class="reviewListIcon">최신순</span>
					</div>
					<div class="writerBtn reviewWriteBtn">
						<span class="reviewListIcon">리뷰등록</span>
					</div>
					<div class="barLine reviewWriteBtn"
						style="border: 1px solid lightgray; height: 85%; margin-top: 3.5px;"></div>
				</div>
				<hr>
			</div>



			<div id="reviewList-content">
				<div id="toTheTop">
					<i class="fas fa-chevron-circle-up reviewListIcon"></i>
				</div>
				<div class="row">
					<% if(!list.isEmpty()){ %>
					<div id="review-card-list" class="col-12">

						<% int morecount = 0;
					int i = 0; // 별점 스팬 id
				for(ReviewCard rc : list){ %>
						<div class="review-card">
							<div class="review-card-book-img">
								<img src="<%=rc.getBookImage()%>" />
							</div>
							<div class="review-card-text">
								<div class="review-card-book-title">
									<span class="review-card-book-title-text"><%=rc.getBookTitle() %></span><span
										id="review-rate<%=i%>" class="review-card-star"> <i
										class="far fa-star"></i><i class="far fa-star"></i><i
										class="far fa-star"></i><i class="far fa-star"></i><i
										class="far fa-star"></i>
									</span>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row review-card-bttom">
								<div class="col-3">
									<div class="review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>"
											class="writer-profile-img" writer="<%=rc.getMemberId() %>" />
									</div>
								</div>
								<div class="col-6">
									<div class="row review-card-infor">
										<div class="col-12"><%=rc.getNickname() %></div>
										<div class="col-12">
											<div class="row">
												<div class="col-7"><%=rc.getReviewDate() %></div>
												<div class="col-5 review-card-count">
													조회
													<%=rc.getReviewCount() %></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-3 rvheart reviewNoteIcon">
									<div class="review-heart-and-count">
										<span class="review-heart"><a>
												<% if(rc.getLikeYN()=='Y'){ %>♥<%}else { %>♡<% } %>
										</a></span> <span class="heart-count"><%=rc.getReviewRate() %></span>
									</div>
								</div>
							</div>
						</div>
						<span id="moreLocal<% morecount++; %>" style="display: none;"></span>
						<script>
			$(function(){
				// review-card-text 누르면 개별리뷰페이지로 이동
				$('.review-card-text').mousedown(function(){
					$(this).css('box-shadow','0px 0px 10px 5px #0080ff').css('position','relative').css('z-index','999');
				});// 클릭 뗄 때 이동
				$('.review-card-text').mouseup(function(){
					$(this).css('box-shadow','').css('position','').css('z-index','');
					location.href="#";// 개별 도서 페이지
				});// 마우스가 요소 외부에 있을 때 그림자 삭제
				$('.review-card-text').mouseout(function(){
					$(this).css('box-shadow','').css('position','').css('z-index','');
				});
				
				// review-card-book-img 누르면 개별도서페이지로 이동
				$('.review-card-book-img').mousedown(function(){
					$(this).css('box-shadow','0px 0px 10px 5px #0080ff');
				});// 클릭 뗄 때 이동
				$('.review-card-book-img').mouseup(function(){
					$(this).css('box-shadow','');
					location.href="#";// 개별 도서 페이지
				});// 마우스가 요소 외부에 있을 때 그림자 삭제
				$('.review-card-book-img').mouseout(function(){
					$(this).css('box-shadow','');
				});
				
				//// 별점 데이터 설정하기
				// <i class="fas fa-star">꽉찬</i><i class="fas fa-star-half-alt">반찬</i><i class="far fa-star">빈</i>
			<% if(rc.getReviewRate()>0) { %>
				var star = '<i class="fas fa-star"></i>';
				<% for(int k=1; k<rc.getReviewRate(); k++){ %>
					star += '<i class="fas fa-star"></i>';
				<% } // for문  
					for(int j=rc.getReviewRate(); j<5; j++) { %> 
					star += '<i class="far fa-star"></i>';
				<% } // for문 %>
				$('#review-rate<%=i%>').html(star);
			<% } // if문%>
			
			
			//// 카드 프로필 이미지 클릭 시 해당 멤버의 서재로 이동
			$('.writer-profile-img').click(function(e){
				var $writer = $(this).attr('writer');
				if(confirm($writer+'님의 서재로 이동하시겠습니까?')) {
					location.href='/myReviewNote.rw?libraryOwner='+$writer;
				}
				e.stopImmediatePropagation(); // 버블링 방지
			});
			})
		</script>
						<% i++; // 별점 id %>
						<% } // foreach문 %>

					</div>

					<div id="moreReview" class="col-12">
						<form action="/reviewPage.rw" method="post">
							<div id="moreDiv">
								<button id="moreBtn" class="reviewListIcon">더 보기</button>
							</div>
							<input type="hidden" name="end"
								value="<%=(int)request.getAttribute("end")%>" /> <input
								type="hidden" name="moreLocal" value="moreLocal<%= morecount %>" />
						</form>
					</div>
					<% if(list.size()<(int)request.getAttribute("end")) { // 더이상 더보기할 리뷰가 없으면 %>
					<script>
            		$('#moreReview').css('visibility', 'hidden');
            	</script>
					<% } %>

					<% } else {// if문(list가 null이 아니라면) %>
					<div class="not-yet">
						아직 리뷰가 없습니다.<br>
						<div>당신이 우리 REVIEW:0127의 첫번째 리뷰 작성자가 되어 주시겠습니까?</div>
						<a href="/reviewWrite.rw">리뷰 쓰기</a>
					</div>

					<% } %>

				</div>
			</div>





		</div>

		<%@ include file="/views/common/footer.jsp"%>
	</div>



</body>
</html>