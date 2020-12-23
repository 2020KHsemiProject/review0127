<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member"%>
<%@ page import="rw.review.model.vo.ReviewCard"%>
<%@ page import="rw.col.model.vo.ReviewCollection" %>
<%@ page import="rw.review.model.vo.ReviewLike" %>
<%@ page import="java.util.ArrayList"%>
<jsp:include page="/views/common/header.jsp" flush="false" />
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
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>-->
<!-- font noto sans kr -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<!-- 스타일 시트 -->
<!-- 서재 헤더 -->
<link rel="stylesheet" type="text/css" href="/views/css/library_my_contents_top.css" />
<!-- 리뷰 카드 -->
<link rel="stylesheet" type="text/css" href="/views/css/review_card.css" />
<link rel="stylesheet" type="text/css" href="/views/css/other_review_card.css" />
<style>
/* body { margin: 0; font-family: 'Noto Sans KR', sans-serif; }*/
.reviewNoteIcon {
	cursor: pointer;
}
/* {
            margin: 0; padding: 0;
            text-decoration-line: none;
            list-style: none;
            font-size: 1rem;
        }*/
#reviewNote-wrapper {
	width: 100%;
	padding: 0;
}
button:focus {
	outline: none;
}

/************** 콘텐츠 **************/

/********** contents myReviewNote **********/
#reviewNote-contents {
	/* 가로중앙 */
	margin: 0 auto;
	width: 1200px;
	min-height: 550px;
}

.reviewNote-contents-top {
	/* 타이틀 중 '?개의 리뷰' 부분 스타일 */
	font-weight: bold;
	height: 150px;
	padding-top: 4%;
}

#reviewNote-review-count {
	font-size: 1.6rem;
}

#alignButton {
	/* 정렬 버튼 2개 감싼 div */
	width: 100px;
	float: right;
}

.reviewNote-Align {
	/* 각각 정렬 버튼 스타일 */
	width: 120px;
	height: 60px;
	background-color: white;
	border-radius: 50px 50px 50px 50px;
	text-align: center;
	font-size: 1.3rem;
	margin: 5px;
	box-shadow: 2px 2px 5px #BDBDBD;
	border: 1px solid #eeeeee;
}

#alignButton>div:first-child>button {
	/* 제목순 위치 */
	position: relative;
	right: 215px;
}

#alignButton>div:last-child>button {
	/* 최신순 위치 */
	position: relative;
	right: 130px;
}

/********** 페이지 **********/
#bookcase-page {
	height: 150px;
	padding: 50px;
}

#bookcase-page li {
	height: 70px;
}

#bookcase-page a {
	width: 40px;
	height: 40px;
	text-align: center;
	font-size: 1rem;
}
.not-yet {
	margin: 0 auto;
	text-align: center;
	font-size: 2rem;
}

#library-add-btn{ /*서재 컬렉션 추가 버튼*/
   display:inline-block;
   width:160px;
   background-color:rgb(255,255,255,0.5);
   color:#7895B5;
   border-radius : 10px;
   margin-left:5px;
   text-align:center;
}
@media (max-width:1200px){
    #reviewNote-wrapper{ width: 1200px;}
}
</style>


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
            
            // lnb hover 시 
            $('#reviewNote-lnb>li>a').hover(function(){
                $(this).css('font-weight','bold');
            },function(){
                $(this).css('font-weight','');
            });
            
            var lnbText = $('#pagename').text();
            console.log(lnbText);
            if(lnbText=='리뷰노트'){
            	$('#myLibrary-lnb>li:nth-child(1)').css('font-weight','bold');	
            }else if(lnbText=='책장'){
            	$('#myLibrary-lnb>li:nth-child(2)').css('font-weight','bold');
            }else if(lnbText=='컬렉션'){
            	$('#myLibrary-lnb>li:nth-child(3)').css('font-weight','bold');
            }
            
         	// 책갈피
            $('.other_reviewScrap').click(function(e){
            	e.stopImmediatePropagation(); // 버블링 방지
            	var color = $(this).css('color');
            	var $thisTag = $(this);
            	
            	
            	var reviewId = $thisTag.parents('.other_review-card').attr('name');
            	
                if(color=='rgb(255, 108, 108)') { // 빨간색일 때
                	if(confirm('해당 리뷰를 삭제하시겠습니까?')){                		
                	$.ajax({
                		url : '/reviewCollectionDel.rw',
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
            });
            	
            
            	
        })
    </script>
</head>
<body>
	<div id="pagename" style="display: none;">리뷰노트</div>
	<%
	Member m = (Member)session.getAttribute("member");
	String libraryOwner = request.getParameter("libraryOwner");

	Member mem = (Member)request.getAttribute("member"); 
	if(mem.getProfileImg()==null){
		mem.setProfileImg("default_user_dark.png");
	}
	
	//내 서재에 있는지 확인
	//////////////////////////////////// 여기에 내 서내 남의 서재 서로 다르게 보여야 함
	Member mm = (Member)session.getAttribute("member"); //헷갈리지 않게
if(mm!=null && mm.getMemberId().equals(libraryOwner)){
		// 내 서재
%>

	<div id="reviewNote-wrapper" class="container-fluid">


		<div id="myLibrary-contents-header" class="row">
			<!-- contents-header -->
			<div class="col-12">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<img src="/image/profile/<%=mem.getProfileImg() %>" />
						</div>
					</div>
					<div class="col-10">
						<div class="row">

							<div id="myLibrary-title" class="col-12"><%=mem.getNickname() %>님의 서재
							</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a
										href="/myReviewNote.rw?libraryOwner=<%=mem.getMemberId()%>">리뷰노트</a></li>
									<li class="col-2"><a href="/myBookCase.rw?libraryOwner=<%=mem.getMemberId()%>">책장</a></li>
									<li class="col-2"><a href="/myCollection.rw?libraryOwner=<%=mem.getMemberId()%>">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<div id="reviewNote-contents" class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 reviewNote-contents-top">
						<div class="row">
							<% int count = (int)request.getAttribute("count"); %>
							<div id="reviewNote-review-count" class="col-8"><%=count %>개의 리뷰
							</div>
							<div class="col-4">
								<form action="#" method="post" id="alignForm">
									<div id="alignButton" class="row">
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">제목순</button>
										</div>
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">최신순</button>
										</div>
									</div>
									<input type="hidden" name="libraryOwner"
										value="<%=libraryOwner %>" />
								</form>
							</div>
						</div>
					</div>
					<script>
                    	$(function(){
                    		$('.reviewNote-Align').click(function(){
                    			if($(this).text()=='제목순'){
                    				$('#alignForm').attr('action','/rnAlignTitle.rw');
                    			}else if($(this).text()=='최신순'){
                    				$('#alignForm').attr('action','/myReviewNote.rw');
                    			}
                    			$(this).removeAttr('type');
                    			$('#alignForm').submit();
                    		});
                    	})
                    </script>




					<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list"); 
		String pageNavi = (String)request.getAttribute("pageNavi");
		if(!list.isEmpty()){
	%>

					<div id="review-card-list" class="col-12">

				<% for(ReviewCard rc : list){ %>
						<div class="review-card">
							<div class="review-card-book-img">
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
										<img src="/image/profile/<%=rc.getProfileImg()%>" class="writer-profile-img" writer="<%=rc.getMemberId() %>"/>
									</div>
								</div>
								<div class="col-6">
									<div class="row review-card-infor">
										<div class="col-12"><%=rc.getNickname() %></div>
										<div class="col-12">
											<div class="row">
												<div class="col-7"><%=rc.getReviewDate() %></div>
												<div class="col-5 review-card-count">
													조회	<%=rc.getReviewCount() %></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-3 rvheart reviewNoteIcon">
									<div class="review-heart-and-count" onclick="heartOnOff('<%=rc.getReviewId()%>');">
										<span class="review-heart heart<%=rc.getReviewId()%>"><a>♡</a></span> <span class="heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
		
						<% } // foreach문 %>
		<script>
				//// 별점 데이터 설정하기
				// <i class="fas fa-star">꽉찬</i><i class="fas fa-star-half-alt">반찬</i><i class="far fa-star">빈</i>
			<%--<% if(rc.getReviewRate()>0) { %>
				var star = '<i class="fas fa-star"></i>';
				<% for(int k=1; k<rc.getReviewRate(); k++){ %>
					star += '<i class="fas fa-star"></i>';
				<% } // for문  
					for(int j=rc.getReviewRate(); j<5; j++) { %> 
					star += '<i class="far fa-star"></i>';
				<% } // for문 %>
				$('#review-rate<%=i%>').html(star);
			<% } // if문%>--%>
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
				///////// 내가 좋아요 누른 리뷰의 하트가 빨간 하트로 보이게
				<% ArrayList<ReviewLike> rLikeList = (ArrayList<ReviewLike>)request.getAttribute("rLikeList"); %>
				<% for(ReviewLike rLike : rLikeList) { %>
					$('.heart'+'<%=rLike.getReviewId()%>').text('♥');
				<% } %>
			})
		</script>



					</div>
					<!-- #reviewNote-cardList col -->

					<div id="bookcase-page" class="col-12">
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%=pageNavi %>
						</ul>
						</nav>

					</div>
					<% }else { %>
					<div class="reviewNote-contents">
					<div class="not-yet">
						아직 리뷰를 안 쓰셨군요?<br>
						<a href="/reviewPage.rw">리뷰 쓰러 가기</a>
					</div>
					</div>
					<% } %>
				</div>
				<!-- row -->
			</div>
			<!-- col -->
		</div>
		<!-- #reviewNote-contents row  -->
	</div>
	<!-- wrapper -->


	<%
	////////////////////////////////////여기에 내 서내 남의 서재 서로 다르게 보여야 함
	}else if((Member)session.getAttribute("member")!=null){ 
		// 남의 서재 
		
	%>
	<div id="reviewNote-wrapper" class="container-fluid">


		<div id="myLibrary-contents-header" class="row" style="background-color: #7895B5;">
			<!-- contents-header -->
			<div class="col-12" style="color: white;">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<img src="/image/profile/<%=mem.getProfileImg() %>" />
						</div>
					</div>
					<div class="col-10">
						<div class="row">

							<div id="myLibrary-title" class="col-12" style="color: white;"><%=mem.getNickname() %>님의 서재
							<%if(m!=null && !(m.getMemberNo().equals(mem.getMemberNo()))){ 
								boolean inMyLibCol = (boolean)request.getAttribute("inMyLibCol");
								%>
								<%if(inMyLibCol) {%>
								<a id="library-add-btn" href="/libraryCollectionRemove2.rw?memberId=<%=mem.getMemberId()%>">내 컬렉션에서 빼기</a>
								<%}else{ %>
								<a id="library-add-btn" href="/libraryCollectionAdd.rw?memberId=<%=mem.getMemberId()%>">내 컬렉션에 추가</a>
								<%} %>
							<%} %>
							</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a
										href="/myReviewNote.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">리뷰노트</a></li>
									<li class="col-2"><a href="/myBookCase.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">책장</a></li>
									<li class="col-2"><a href="/myCollection.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<div id="reviewNote-contents" class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 reviewNote-contents-top">
						<div class="row">
							<% int count = (int)request.getAttribute("count"); %>
							<div id="reviewNote-review-count" class="col-8"><%=count %>개의
								리뷰
							</div>
							<div class="col-4">
								<form action="#" method="post" id="alignForm">
									<div id="alignButton" class="row">
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">제목순</button>
										</div>
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">최신순</button>
										</div>
									</div>
									<input type="hidden" name="libraryOwner"
										value="<%=libraryOwner %>" />
								</form>
							</div>
						</div>
					</div>
					<script>
                    	$(function(){
                    		$('.reviewNote-Align').click(function(){
                    			if($(this).text()=='제목순'){
                    				$('#alignForm').attr('action','/rnAlignTitle.rw');
                    			}else if($(this).text()=='최신순'){
                    				$('#alignForm').attr('action','/myReviewNote.rw');
                    			}
                    			$(this).removeAttr('type');
                    			$('#alignForm').submit();
                    		});
                    	})
                    </script>




					<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list"); 
		String pageNavi = (String)request.getAttribute("pageNavi");
		if(!list.isEmpty()){
	%>

			<div id="review-card-list" class="col-12">

						<% for(ReviewCard rc : list){ %>
						<div class="other_review-card" name="<%=rc.getReviewId()%>">
							<div class="other_review-card-book-img" title="해당 도서페이지로 이동합니다.">
								<span class="other_reviewScrap reviewScrap<%=rc.getReviewId() %> collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
								<a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" /></a>
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
											class="other_writer-profile-img" writer="<%=rc.getMemberId() %>"/>
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
									<div class="other_review-heart-and-count" onclick="heartOnOff('<%=rc.getReviewId()%>')">
										<span class="other_review-heart heart<%=rc.getReviewId()%>">♡</span> <span class="other_heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
						
			<% } // foreach문 %>


		</div><!-- #reviewNote-cardList col -->

					<div id="bookcase-page" class="col-12">
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%=pageNavi %>
						</ul>
						</nav>
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
			//////// 내가 스크랩한 리뷰가 빨간색으로 보이게
			<% ArrayList<ReviewCollection> rColList = (ArrayList<ReviewCollection>)request.getAttribute("rColList"); %> 
			<%	for(ReviewCollection rCol : rColList){ %>
				$('.reviewScrap'+'<%=rCol.getReviewId() %>').css('color','#FF6C6C');
			<%	} %>
			
			///////// 내가 좋아요 누른 리뷰의 하트가 빨간 하트로 보이게
			<% ArrayList<ReviewLike> rLikeList = (ArrayList<ReviewLike>)request.getAttribute("rLikeList"); %>
			<% for(ReviewLike rLike : rLikeList) { %>
				$('.heart'+'<%=rLike.getReviewId()%>').text('♥');
			<% } %>
		})
		</script>
					</div>
			<% }else { ///////////////////////// 리스트가 비어있다면%>
					<div class="reviewNote-contents">
					<div class="not-yet">
					<%=mem.getNickname() %>님의 리뷰가 아직 없습니다.
					</div>
					</div>
			<% } %>
				</div>
				<!-- row -->
			</div>
			<!-- col -->
		</div>
		<!-- #reviewNote-contents row  -->
	</div>
	<!-- wrapper -->




	<% }else { %>
	<div id="reviewNote-wrapper" class="container-fluid">


		<div id="myLibrary-contents-header" class="row" style="background-color: #7895B5;">
			<!-- contents-header -->
			<div class="col-12" style="color: white;">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<img src="/image/profile/<%=mem.getProfileImg() %>" />
						</div>
					</div>
					<div class="col-10">
						<div class="row">

							<div id="myLibrary-title" class="col-12" style="color: white;"><%=mem.getNickname() %>
								님의 서재
							</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a
										href="/myReviewNote.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">리뷰노트</a></li>
									<li class="col-2"><a href="/myBookCase.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">책장</a></li>
									<li class="col-2"><a href="/myCollection.rw?libraryOwner=<%=mem.getMemberId()%>" style="color: white;">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<div id="reviewNote-contents" class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 reviewNote-contents-top">
						<div class="row">
							<% int count = (int)request.getAttribute("count"); %>
							<div id="reviewNote-review-count" class="col-8"><%=count %>개의
								리뷰
							</div>
							<div class="col-4">
								<form action="#" method="post" id="alignForm">
									<div id="alignButton" class="row">
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">제목순</button>
										</div>
										<div class="col-6">
											<button type="button" class="reviewNote-Align reviewNoteIcon">최신순</button>
										</div>
									</div>
									<input type="hidden" name="libraryOwner"
										value="<%=libraryOwner %>" />
								</form>
							</div>
						</div>
					</div>
					<script>
                    	$(function(){
                    		$('.reviewNote-Align').click(function(){
                    			if($(this).text()=='제목순'){
                    				$('#alignForm').attr('action','/rnAlignTitle.rw');
                    			}else if($(this).text()=='최신순'){
                    				$('#alignForm').attr('action','/myReviewNote.rw');
                    			}
                    			$(this).removeAttr('type');
                    			$('#alignForm').submit();
                    		});
                    	})
                    </script>




					<% ArrayList<ReviewCard> list = (ArrayList<ReviewCard>)request.getAttribute("list"); 
		String pageNavi = (String)request.getAttribute("pageNavi");
		if(!list.isEmpty()){
	%>

			<div id="review-card-list" class="col-12">

						<% for(ReviewCard rc : list){ %>
						<div class="review-card">
							<div class="review-card-book-img" title="누르면 해당 도서페이지로 이동합니다.">
								<a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" /></a>
							</div>
							<a href="/reviewRead.rw?reviewId=<%=rc.getReviewId()%>">
							<div class="review-card-text" title="누르면 해당 리뷰페이지로 이동합니다.">
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
										<span class="review-heart"><a>♡</a></span> <span class="heart-count"><%=rc.getReviewLikeCount() %></span>
									</div>
								</div>
							</div>
						</div>
						
			

			<% } // foreach문 %>


		</div><!-- #reviewNote-cardList col -->

					<div id="bookcase-page" class="col-12">
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%=pageNavi %>
						</ul>
						</nav>

					</div>
			<% }else { ///////////////////////// 리스트가 비어있다면%>
					<div class="reviewNote-contents">
					<div class="not-yet">
					<%=mem.getNickname() %>님의 리뷰가 아직 없습니다.
					</div>
					</div>
			<% } %>
				</div>
				<!-- row -->
			</div>
			<!-- col -->
		</div>
		<!-- #reviewNote-contents row  -->
	</div>
	<!-- wrapper -->
	<% } %>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>