<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.review.model.vo.ReviewCard"%>
<%@ page import="rw.col.model.vo.ReviewCollection" %>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/views/common/header.jsp"%>
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
<!-- font noto sans kr -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>
<link rel="stylesheet" type="text/css" href="/views/css/review_card.css" />
<link rel="stylesheet" type="text/css" href="/views/css/other_review_card.css" />
<style>
button:focus {
	outline: none;
}

.reviewListIcon {
	cursor: pointer;
}


 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

#reviewList-contents {
	/* 가로중앙 */
	margin: 0 auto;
	width: 1200px;
	margin-top: 70px;
	min-height: 550px;
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
	border: 1px solid lightgray;
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
	font-size: 3rem;
}

@media (max-width:1200px){
    #reviewList-wrapper{ width: 1200px;}
}
</style>

<script>
    
        $(function(){
        	var text2;
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
			
			//var cardBookId;
			// review-card-book-img 누르면 개별도서페이지로 이동
			$('.review-card-book-img').mousedown(function(){
				//cardBookId = $(this).attr('bookId');
				$(this).css('box-shadow','0px 0px 10px 5px #0080ff');
			});// 클릭 뗄 때 이동
			$('.review-card-book-img').mouseup(function(){
				//alert(cardBookId);
				$(this).css('box-shadow','');
				location.href="/bookInfo.rw";// 개별 도서 페이지
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.review-card-book-img').mouseout(function(){
				$(this).css('box-shadow','');
			});
			
			// other_
			// review-card-text 누르면 개별리뷰페이지로 이동
			$('.other_review-card-text').mousedown(function(){
				$(this).css('box-shadow','0px 0px 10px 5px #0080ff').css('position','relative').css('z-index','999');
			});// 클릭 뗄 때 이동
			$('.other_review-card-text').mouseup(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
				location.href="#";// 개별 도서 페이지
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.other_review-card-text').mouseout(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
			});
			
			// review-card-book-img 누르면 개별도서페이지로 이동
			$('.other_review-card-book-img').mousedown(function(){
				$(this).css('box-shadow','0px 0px 10px 5px #0080ff');
			});// 클릭 뗄 때 이동
			$('.other_review-card-book-img').mouseup(function(){
				$(this).css('box-shadow','');
				location.href="#";// 개별 도서 페이지
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.other_review-card-book-img').mouseout(function(){
				$(this).css('box-shadow','');
			});
        	
        	//var offset = $('#moreBtn').offset();
            //$('html, body').animate({scrollTop : offset.top}, 400);
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
			
			
			
			
			// 책갈피
            $('.other_reviewScrap').click(function(e){
            	e.stopImmediatePropagation(); // 버블링 방지
            	var color = $(this).css('color');
            	var $thisTag = $(this);
            	var reviewId = $thisTag.parents('.other_review-card').attr('name');
            	
                if(color=='rgb(255, 108, 108)') { // 빨간색일 때
                	if(confirm('해당 리뷰를 삭제하시겠습니까?')){                		
                	$.ajax({
                		url : '/reviewCollectionDel3.rw',
                		data : {'reviewId':reviewId},
                		type : 'post',
                		success : function(data){
                			if(data.result>0){
                				alert("컬렉션에서 삭제가 완료되었습니다.");
                				$thisTag.css('color','gray');
                			}else{
                				alert('컬렉션 삭제에 실패했습니다. \n지속적인 오류시 관리자에 문의하세요.');
                			}
                			
                		},
                		error : function(){
                			
                		}
                	});
                    }
                }else { // 회색일 때 
                    $.ajax({
                    	url : '/reviewCollectionAdd.rw',
                    	data : {'reviewId':reviewId},
                    	type : 'post',
                    	success : function(data){
                    		if(data.result>0){
                   				alert('컬렉션에 추가되었습니다.');
                   				$thisTag.css('color','#FF6C6C');
                   			}else{
                   				alert('컬렉션 추가에 실패했습니다. \n지속적인 오류시 관리자에 문의하세요.');
                   			}
                    		},
                   		error : function(){
                   			alert('컬렉션 추가에 실패했습니다. \n지속적인 오류시 관리자에 문의하세요.');
                    	}
                   	});
           		 } // 회색 또는 빨간색 if문
            });
			
			
        })
        
        
    </script>


</head>
<body>

	<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list");
	
	if((Member)session.getAttribute("member")!=null) { %>
	
	<div id="reviewList-wrapper">
		
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
						<span class="reviewListIcon"><a href="/views/review/review_write.jsp">리뷰등록</a></span>
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
					
				for(ReviewCard rc : list){ 
				
					if(((Member)session.getAttribute("member")).getMemberNo().equals(rc.getMemberNo())) { 
				%>
						<div class="review-card" reviewId="<%=rc.getReviewId()%>">
							<div class="review-card-book-img">
								<img src="<%=rc.getBookImage()%>" bookId="<%=rc.getBookId() %>" title="누르면 해당 도서페이지로 이동합니다." />
							</div>
							<div class="review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
								<div class="review-card-book-title">
									<span class="review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row review-card-bttom">
								<div class="col-3">
									<div class="review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>" class="writer-profile-img" writer="<%=rc.getMemberId() %>" title="내 서재로 이동합니다."/>
									</div>
								</div>
								<div class="col-6">
									<div class="row review-card-infor">
										<div class="col-12"><%=rc.getNickname() %></div>
										<div class="col-12">
											<div class="row">
												<div class="col-7"><%=rc.getReviewDate() %></div>
												<div class="col-5 review-card-count">조회 <%=rc.getReviewCount() %></div>
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
						
						<% } else { %>
						<div class="other_review-card" name="<%=rc.getReviewId()%>">
							<div class="other_review-card-book-img" title="누르면 해당 도서페이지로 이동합니다.">
								<span class="other_reviewScrap reviewScrap<%=rc.getReviewId() %> collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
								<img src="<%=rc.getBookImage()%>" />
							</div>
							<div class="other_review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
								<div class="other_review-card-book-title">
									<span class="other_review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row other_review-card-bttom">
								<div class="col-3">
									<div class="other_review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>"
											class="other_writer-profile-img" writer="<%=rc.getMemberId() %>" title="[<%=rc.getMemberId() %>]님의 서재로 이동합니다."/>
									</div>
								</div>
								<div class="col-6">
									<div class="row other_review-card-infor">
										<div class="col-12"><%=rc.getNickname() %></div>
										<div class="col-12">
											<div class="row">
												<div class="col-7"><%=rc.getReviewDate() %></div>
												<div class="col-5 other_review-card-count">
													조회
													<%=rc.getReviewCount() %></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-3 other_rvheart reviewNoteIcon">
									<div class="other_review-heart-and-count">
										<span class="other_review-heart"><a>
												<% if(rc.getLikeYN()=='Y'){ %>♥<%}else { %>♡<% } %>
										</a></span> <span class="other_heart-count"><%=rc.getReviewRate() %></span>
									</div>
								</div>
							</div>
						</div>
						<% } %>
						
						<span id="moreLocal<% morecount++; %>" style="display: none;"></span>
		<script>
			$(function(){
				
			
			
			//// 카드 프로필 이미지 클릭 시 해당 멤버의 서재로 이동
			$('.writer-profile-img').click(function(e){
				var $writer = $(this).attr('writer');
				if(confirm($writer+'님의 서재로 이동하시겠습니까?')) {
					location.href='/myReviewNote.rw?libraryOwner='+$writer;
				}
				e.stopImmediatePropagation(); // 버블링 방지
			});
			///// 다른 사람 서재로 이동
			$('.other_writer-profile-img').click(function(e){
				var $writer = $(this).attr('writer');
				if(confirm($writer+'님의 서재로 이동하시겠습니까?')) {
					location.href='/myReviewNote.rw?libraryOwner='+$writer;
				}
				e.stopImmediatePropagation(); // 버블링 방지
			});
			})
		</script>
			<% ArrayList<ReviewCollection> rColList = (ArrayList<ReviewCollection>)request.getAttribute("rColList"); 
				for(ReviewCollection rCol : rColList){
					if(rc.getReviewId().equals(rCol.getReviewId())){ %>
				<script>
					$('.reviewScrap'+'<%=rc.getReviewId() %>').css('color','#FF6C6C');
				</script>
			<%		}
				}
			%>
						
						<% } // foreach문 %>
					</div>
					<div id="moreReview" class="col-12">
						<form action="/reviewPage.rw" method="post">
							<div id="moreDiv">
								<button id="moreBtn" class="reviewListIcon">더 보기</button>
							</div>
							<input type="hidden" name="end"
								value="<%=(int)request.getAttribute("end")%>" /> <input type="hidden" name="moreLocal" value="moreLocal<%= morecount %>" />
						</form>
					</div>
					<% if(list.size()<(int)request.getAttribute("end")) { // 더이상 더보기할 리뷰가 없으면 %>
					<script>
            		$('#moreReview').css('visibility', 'hidden');
            	</script>
					<% } %>
					<% } else {// if문(list가 null이 아니라면) %>
					<div class="not-yet">아직 리뷰가 없습니다.<br>
						<div>당신이 우리 REVIEW:0127의 첫번째 리뷰 작성자가 되어 주시겠습니까?</div>
						<a href="/reviewWrite.rw">리뷰 쓰기</a>
					</div>
					<% } %>
				</div>
			</div>
		</div>
		
	</div>
	<% } else { ////////////////////////////// 비로그인 %> 
	<div id="reviewList-wrapper">
		
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
					
						for(ReviewCard rc : list){ %>
						<div class="review-card">
							<div class="review-card-book-img" title="누르면 해당 도서페이지로 이동합니다.">
								<img src="<%=rc.getBookImage()%>" />
							</div>
							<div class="review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
								<div class="review-card-book-title">
									<span class="review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							<div class="row review-card-bttom">
								<div class="col-3">
									<div class="review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>"
											class="writer-profile-img" writer="<%=rc.getMemberId() %>" title="[<%=rc.getMemberId() %>]님의 서재로 이동합니다."/>
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
										<span class="review-heart"><a>♡</a></span> <span class="heart-count"><%=rc.getReviewRate() %></span>
									</div>
								</div>
							</div>
						</div>
						
			

			
						<span id="moreLocal<% morecount++; %>" style="display: none;"></span>
						<script>
			$(function(){
				
			
			
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
						<a href="/login.jsp">로그인</a>
					</div>
					<% } %>
				</div>
			</div>
		</div>
		
	</div>
	<% } %>

<%@ include file="/views/common/footer.jsp"%>
</body>
</html>