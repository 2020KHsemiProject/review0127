<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<%@ page import="rw.review.model.vo.ReviewCard" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="/views/common/header.jsp" flush="false" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 폰트 어썸 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- font noto sans kr -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<!-- 스타일 시트 -->
<link rel= "stylesheet" type="text/css" href="/views/css/library_my_contents_top.css"/>
<link rel="stylesheet" type="text/css" href="/views/css/review_card.css"/>
<style>
        body { margin: 0; font-family: 'Noto Sans KR', sans-serif; }
        .reviewNoteIcon {cursor: pointer;}
        * {
            margin: 0; padding: 0;
            text-decoration-line: none;
            list-style: none;
            font-size: 1rem;
        }
        #reviewNote-wrapper {
            width: 100%;
            padding: 0;
        }
        #reviewNote-wrapper>.row {
            /*padding: 0 13.03%;*/
        }
        button:focus{outline: none;}
        
/************** 콘텐츠 **************/
        
		/********** contents myReviewNote **********/
        #reviewNote-contents {
        	/* 가로중앙 */
            margin: 0 auto;
            width: 1200px;
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
        .reviewNote-Align{
            /* 각각 정렬 버튼 스타일 */
            width: 120px; height: 60px;
            background-color: white;
            border-radius: 50px 50px 50px 50px;
            text-align: center;
            font-size: 1.3rem;
            margin: 5px;
            box-shadow: 2px 2px 5px #BDBDBD;
            border: 1px solid gray;
            
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
            width: 40px; height: 40px;
            text-align: center;
            font-size: 1rem;
            color: black;
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
            
            
            
        })
    </script>
</head>
<body>
<div id="pagename" style="display:none;">리뷰노트</div>
<%
	Member m = (Member)session.getAttribute("member");
	String libraryOwner = request.getParameter("libraryOwner");
	if(m!=null&&m.getMemberId().equals(libraryOwner)){// 여기에 내 서내 남의 서재 서로 다르게 보여야 함
		// 내 서재
%>

<div id="reviewNote-wrapper" class="container-fluid">
      
        
        <div id="myLibrary-contents-header" class="row">
			<!-- contents-header -->
			<div class="col-12">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<img src="/image/profile/<%=m.getProfileImg() %>" />
						</div>
					</div>
					<div class="col-10">
						<div class="row">
						
							<div id="myLibrary-title" class="col-12"><%=m.getNickname() %> 님의 서재</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a href="/myRivewNote.rw?libraryOwner=<%=m.getMemberId()%>">리뷰노트</a></li>
									<li class="col-2"><a href="/views/library/book_case.jsp">책장</a></li>
									<li class="col-2"><a href="/views/library/collection.jsp">컬렉션</a></li>
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
                           <div id="reviewNote-review-count" class="col-8"><%=count %>개의 리뷰</div>
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
                                <input type="hidden" name="libraryOwner" value="<%=libraryOwner %>"/>
                           </form>
                           </div>
                       </div>
                    </div>
                    <script>
                    	$(function(){
                    		$('.reviewNote-Align').click(function(){
                    			if($(this).text()=='제목순'){
                    				$('#alignForm').attr('action','/rnAlignTitle.rw');
                    				$('#alignForm').attr('action','/myRivewNote.rw');
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
                           <div class="review-card-book-img"><img src="/image/book/<%=rc.getBookImage()%>"/></div>
                           <div class="review-card-text">
                             <div class="review-card-book-title">
                                <span class="review-card-book-title-text"><%=rc.getBookTitle() %></span><span class="review-card-star reviewNoteIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               <%=rc.getReviewCont() %> 
                           </div>
                           <div class="row review-card-bttom">
                              <div class="col-3">
                               <div class="review-card-writer-profile">
                                   <img src="/image/profile/<%=rc.getProfileImg()%>"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row review-card-infor">
                                       <div class="col-12"><%=rc.getNickname() %></div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-6"><%=rc.getReviewDate() %></div>
                                               <div id="" class="col-5">조회 <%=rc.getReviewCount() %></div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewNoteIcon"><div class="review-heart-and-count"><span class="review-heart"><a><% if(rc.getLikeYN()=='Y'){ %>♥<%}else { %>♡<% } %></a></span> <span class="heart-count"><%=rc.getReviewRate() %></span></div></div>
                           </div>
                       </div>
		<% } // foreach문 %>
                       
                       
			</div> <!-- #reviewNote-cardList col -->
			
			<div id="bookcase-page" class="col-12"> <%=pageNavi %>
                <!-- <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                                </svg>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </nav> -->
		</div> 
	<% }else { %>
		님 리뷰 써요<br>
		<a href="#">리뷰 쓰러 가기</a>
	<% } %>
         </div> <!-- row -->
       </div> <!-- col -->
    </div> <!-- #reviewNote-contents row  -->
</div> <!-- wrapper -->	


<% }else if(m!=null){ %>
	<% libraryOwner = request.getParameter("libraryOwner"); %>
		다른 사람 책장
<% }else { %>
	<script>
		alert('회원이 아닙니다. 여기에는 나중에 음...회원가입 링크를 주자...');
		location.replace('/index.jsp');
	</script>
<% } %>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>