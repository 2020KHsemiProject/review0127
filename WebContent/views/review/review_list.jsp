<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rw.review.model.vo.ReviewCard"%>
<%@ page import="rw.col.model.vo.ReviewCollection" %>
<%@ page import="rw.review.model.vo.ReviewLike" %>
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
        	
        	// review-card-text 누르면 개별리뷰페이지로 이동
			$('.review-card-text').mousedown(function(){
				$(this).css('box-shadow','0px 0px 5px 5px gray').css('position','relative').css('z-index','999');
			});// 클릭 뗄 때 이동
			$('.review-card-text').mouseup(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.review-card-text').mouseout(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
			});
			
			// review-card-book-img 누르면 개별도서페이지로 이동
			$('.review-card-book-img').mousedown(function(){
				$(this).css('box-shadow','0px 0px 5px 5px gray');
			});// 클릭 뗄 때 이동
			$('.review-card-book-img').mouseup(function(){
				$(this).css('box-shadow','');
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.review-card-book-img').mouseout(function(){
				$(this).css('box-shadow','');
			});
			
			// other_
			// review-card-text 누르면 개별리뷰페이지로 이동
			$('.other_review-card-text').mousedown(function(){
				$(this).css('box-shadow','0px 0px 5px 5px gray').css('position','relative').css('z-index','999');
			});// 클릭 뗄 때 이동
			$('.other_review-card-text').mouseup(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.other_review-card-text').mouseout(function(){
				$(this).css('box-shadow','').css('position','').css('z-index','');
			});
			
			// review-card-book-img 누르면 개별도서페이지로 이동
			$('.other_review-card-book-img').mousedown(function(){
				$(this).css('box-shadow','0px 0px 5px 5px gray');
			});// 클릭 뗄 때 이동
			$('.other_review-card-book-img').mouseup(function(){
				$(this).css('box-shadow','');
				location.href="#";// 개별 도서 페이지
			});// 마우스가 요소 외부에 있을 때 그림자 삭제
			$('.other_review-card-book-img').mouseout(function(){
				$(this).css('box-shadow','');
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
			
			// 책갈피
            $('.other_reviewScrap').click(function(e){
            	
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
                			alert('컬렉션 삭제에 실패했습니다. \n지속적인 오류시 관리자에 문의하세요.');
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
           		e.stopImmediatePropagation(); // 버블링 방지
            });
			
			
        })
        
        
    </script>


</head>
<body>

	<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list"); %>
	
	<% if(request.getAttribute("end")!=null){ %>
	<% if((int)request.getAttribute("end")>12) { %>
		<script>
			$(function(){
				document.getElementById('card<%=(int)request.getAttribute("end")-6%>').scrollIntoView();
			})
		</script>
	<% } }%>
	<% if((Member)session.getAttribute("member")!=null) { %>
	
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
						<div class="review-card" id="card<%=morecount+1%>">
							<div class="review-card-book-img reviewListIcon">
								<a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" title="해당 도서페이지로 이동합니다." /></a>
							</div>
							<a href="/reviewRead.rw?reviewId=<%=rc.getReviewId()%>">
							<div class="review-card-text" title="해당 리뷰페이지로 이동합니다.">
								<div class="review-card-book-title">
									<span class="review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							</a>
							<div class="row review-card-bttom">
								<div class="col-3">
									<div class="review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>" class="reviewListIcon writer-profile-img" writer="<%=rc.getNickname() %>" title="내 서재로 이동합니다."/>
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
									<div class="review-heart-and-count" onclick="heartOnOff('<%=rc.getReviewId() %>')">
										<span class="review-heart heart<%=rc.getReviewId()%>">♡</span> <span class="heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
						
						<% } else { %>
						<div class="other_review-card" name="<%=rc.getReviewId()%>" id="card<%=morecount+1%>">
							<div class="other_review-card-book-img reviewListIcon">
								<span class="other_reviewScrap reviewScrap<%=rc.getReviewId() %> collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
								<a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" title="해당 도서페이지로 이동합니다."/></a>
							</div>
							<a href="/reviewRead.rw?reviewId=<%=rc.getReviewId()%>">
							<div class="other_review-card-text" title="해당 리뷰페이지로 이동합니다.">
								<div class="other_review-card-book-title">
									<span class="other_review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							</a>
							<div class="row other_review-card-bttom">
								<div class="col-3">
									<div class="other_review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>"
											class="reviewListIcon other_writer-profile-img" writer="<%=rc.getMemberId() %>" title="[<%=rc.getNickname() %>]님의 서재로 이동합니다."/>
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
									<div class="other_review-heart-and-count" onclick="heartOnOff('<%=rc.getReviewId() %>')">
										<span class="other_review-heart heart<%=rc.getReviewId()%>">♡</span> <span class="other_heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
						<% } %>
						
						<span id="moreLocal<% morecount++; %>" style="display: none;"></span>
		<script>
			
			function heartOnOff(reviewId){
				$.ajax({
					url : '/reviewLike.rw',
					data : {'reviewId':reviewId},
					type : 'post',
					success : function(data){
						if(data.yn=='Y'){
							alert('좋아요를 눌렀습니다.');
							$('.heart'+reviewId).text('♥');
							$('.heart'+reviewId).next().text(data.count);
						}else{
							alert('좋아요를 해제했습니다.');
							$('.heart'+reviewId).text('♡');
							$('.heart'+reviewId).next().text(data.count);
						}
					},
					error : function(){
						alert('좋아요에 실패했습니다.')
					}
				});
					
			}
			
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
			
			//////// 내가 스크랩한 리뷰가 빨간 책갈피로 보이게
			<% ArrayList<ReviewCollection> rColList = (ArrayList<ReviewCollection>)request.getAttribute("rColList"); %>
			<%	for(ReviewCollection rCol : rColList){ %>
					$('.reviewScrap'+'<%=rCol.getReviewId() %>').css('color','#FF6C6C');
			<%	} %>
			
			///////// 내가 좋아요 누른 리뷰의 하트가 빨간 하트로 보이게
			<% ArrayList<ReviewLike> rLikeList = (ArrayList<ReviewLike>)request.getAttribute("rLikeList"); %>
			<% for(ReviewLike rLike : rLikeList) { %>
				$('.heart'+'<%=rLike.getReviewId()%>').text('♥');
			<% } %>
			</script>		
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
					
						for(ReviewCard rc : list){ %>
						<div class="review-card" id="card<%=morecount+1%>">
							<div class="review-card-book-img collectionIcon">
								<a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" title="해당 도서페이지로 이동합니다."/></a>
							</div>
							<a href="/reviewRead.rw?reviewId=<%=rc.getReviewId()%>">
							<div class="review-card-text" title="해당 리뷰페이지로 이동합니다.">
								<div class="review-card-book-title">
									<span class="review-card-book-title-text" style="width: 290px;"><%=rc.getBookTitle() %></span>
									<span class="review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate() %>
								</div>
								<%=rc.getReviewCont() %>
							</div>
							</a>
							<div class="row review-card-bttom">
								<div class="col-3">
									<div class="review-card-writer-profile">
										<img src="/image/profile/<%=rc.getProfileImg()%>"
											class="reviewListIcon writer-profile-img" writer="<%=rc.getMemberId() %>" title="[<%=rc.getNickname() %>]님의 서재로 이동합니다."/>
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
									<div class="review-heart-and-count" onclick="heartNonMem()">
										<span class="review-heart"><a>♡</a></span> <span class="heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
						
			

			
						<span id="moreLocal<% morecount++; %>" style="visibility: hidden;"></span>
			<script>
			function heartNonMem(){
				alert('로그인 후 이용 가능합니다.');
			}
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