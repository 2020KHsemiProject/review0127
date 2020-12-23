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
                       <div class="reviewNote-book-img">
                       <%if(m!=null){ %>
							<form action="/reviewCollectionRemove.rw" method="get" id="deleteRcForm">
								<input type="hidden" name="reviewId" value="<%=rc.getReviewId()%>">
								<span class="other_reviewScrap collectionIcon"> <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="#FF6C6C" xmlns="http://www.w3.org/2000/svg">
								 <path fill-rule="evenodd"	d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z" />
									</svg>
								</span></form><%} %>
                       <a href="/bookInfo.rw?bookId=<%=rc.getBookId()%>" class="bookLink"><img src="<%=rc.getBookImage()%>" title="해당 도서페이지로 이동합니다." /></a>
                       </div>
                       <a href="/reviewRead.rw?reviewId=<%=rc.getReviewId()%>" >
                       <div class="reviewNote-book-text">
                         <div class="book-text-title">
                            <span class="book-text-title-name" style="width: 290px;"><%=rc.getBookTitle() %></span>
                            <span class="other_review-card-star"><i class="fas fa-star"></i></span><%=rc.getReviewRate()%>
                          </div>
                          <%=rc.getReviewCont() %>
                       </div></a>
                       <div class="row reviewNote-card-text-bottom">
                          <div class="col-3">
                           <div class="reviewNote-userProfile" goto="/myReviewNote.rw?libraryOwner=<%=rc.getMemberId()%>" nick="<%=rc.getNickname()%>">
                           	<%if(rc.getProfileImg()!=null) {%>
                               <img src="/image/profile/<%=rc.getProfileImg()%>" class="writer-profile-img"/>
                               <%}else{ %>
                               <img src="/image/profile/default_user_dark.png" class="writer-profile-img" />
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
                           <div class="col-3 rvheart reviewNoteIcon"><div class="review-heart-and-count"><span class="review-heart"><% if(rc.getLikeYN()=='Y'){%>♥<%}else {%>♡<% }%></span> 
                           <span class="heart-count"><%=likeList.get(rc.getReviewId()) %></span></div></div>
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
            	
          //남의 서재 이동
        	$(document).on('click', '.reviewNote-userProfile', function(){
        		var goPage = $(this).attr('goto');
        		var nickname = $(this).attr('nick');
        		if (confirm(nickname + '님의 서재로 이동하시겠습니까?')) {
        			location.href = goPage;
        		}
        	});
          
        	// 리뷰 좋아요 클릭 시
        	$(document).on('click', '.review-heart-and-count', function(){
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
        })
    </script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>

