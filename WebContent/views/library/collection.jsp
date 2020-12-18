<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel= "stylesheet" type="text/css" href="/views/css/library_my_contents_top.css">

    <style>
        body { margin: 0; font-family: 'Noto Sans KR', sans-serif; }
        .collectionIcon {cursor: pointer;}
        * {
            /* 전체 태그 */
            margin: 0; padding: 0;
            text-decoration-line: none;
            list-style: none;
            font-size: 1rem;
        }
        #myCollection-wrapper {
            width: 100%;
            padding: 0;
        }
        #myCollection-wrapper>.row {
            /*padding: 0 13.03%;*/
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
        #myCollection-cardList {
        	padding-left: 20px;
        }
        #myCollection-cardList>div:nth-child(2){
        	padding:0;
        }
        .myCollection-book-card {
        	/* 리뷰카드 크기&스타일 */
            margin: 8px;
            width: 370px; height: 560px;
            border: 1px solid gray;
            float: left;
            box-shadow: 2px 2px 5px #D5D5D5;
        }
        .myCollection-book-img {
        	/* 카드 속> 이미지 div */
            width: 100%; height: 55%;
            overflow: hidden;
        }
        .myCollection-book-img>img {
        	/* 카드 속> 이미지 div 속> 이미지 태그 크기 */
            width: 100%;
            z-index: 19;
            position: relative;
            bottom: 15.5%;
        }
        .reviweScrap {
        	/* 카드 속> 이미지 div 속> 책갈피 YN */
            z-index: 20;
            position: relative;
            color: #FF6C6C;
        }
        .reviweScrapN {
        	/* 카드 속> 이미지 div 속> 책갈피 YM 속> 책갈피 N */
            display: none;
            color: #FF6C6C;
        }
        .myCollection-book-text {
        	/* 카드 속> 리뷰 text div */
            width: 100%; height: 30%;
            padding: 3% 4% 1% 4%;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .book-text-title {
        	/* 카드 속> 리뷰 text div 속> 제목 및 별 div */
            padding-bottom: 2%;  
        }
        .book-text-title-name {
        	/* 카드 속> 리뷰 text div 속> 제목 span */
        	display: inline-block;
        	width: 72%;
        }
        .review-star {
        	/* 카드 속> 리뷰 text div 속> 별점 span */
            position: relative;
            right: 8px;
            color: gold;   
        }
        .myCollection-card-text-bttom {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div */
            width: 100%; height: 15%;
            padding-top: 3%;
        }
        .myCollection-userProfile {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 프로필 이미지 div 스타일 */
            width: 50px; height: 50px;
            border-radius: 100%;
            position: relative;
            left: 40%;
            overflow: hidden;
        }
        .myCollection-userProfile>img {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 프로필 이미지 div 속> 이미지 태그 크기 */
            width: 100%; height: 100%;
        }
        .myCollection-book-card-user {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 유저이름 및 작성일 및 조회수 div*/
            font-size: 14px;
            padding: 5% 0 1% 0;
        }
        .myCollection-book-card-user div {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 유저이름 및 작성일 및 조회수 div 속> 모든 div*/
            padding-right: 0;
        }
        .myCollection-book-card-user .row>div:last-child {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 유저이름 및 작성일 및 조회수 div 속> 조회수*/
            position: relative;
            left: 6%;
        }
        
        /********** 좋아요 **********/
        .rvheart {
        	/* 좋아요 div를 담은 div */
            padding: 5% 0 0 8%;
        }
        .review-heart-and-count {
        	/* 좋아요 div 스타일 */
            border: 1px solid gray;
            width: 120%; height: 63%;
            border-radius: 40px 40px 40px 40px;
            position: relative;
            right: 30%;
            bottom: 10%;
        }
        .review-heart {
        	/* 좋아요 div 속> 하트 */
            color: red;
            position: relative;
            top: 9%;
            left: 15%;
        }
        .heart-count {
        	/* 좋아요 div 속> 좋아요 수 */
            position: relative;
            top: 9%;
            left: 30%;
        }
        
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
            white-space:nowrap; 
            overflow-x: auto;
        }
        #others-library-wrap::-webkit-scrollbar { 
            visibility: hidden;
            width: 20px; height:15px;
        }
        #others-library-wrap:hover::-webkit-scrollbar { 
            visibility: visible;
            width: 20px; height:15px;
        }
        /* 스크롤바의 width */
        #others-library-wrap:hover::-webkit-scrollbar-track { display: none;}
        /* 스크롤바의 전체 배경색 */        
        #others-library-wrap:hover::-webkit-scrollbar-thumb { 
            background-color: #ffe58d;
            border-radius: 40px 40px 40px 40px;
        }
        /* 스크롤바 색 */
        #others-library-wrap:hover::-webkit-scrollbar-button { display: none; }
        /* 위 아래 버튼 (버튼 없애기를 함) */
        
        .others-user-profile {
        	/* 다른사람의 프로필 이미지 div */
            width: 130px; height: 130px;
            border-radius: 100%;
            overflow: hidden;
            position: relative;
            z-index: 15;
        }
        .others-user-profile>img {
        	/* 다른사람의 프로필 이미지 div> 이미지 태그 */
            width: 130px; height: 130px;
        }
        .others-library-delete {
        	/* 다른 사람 서재를 삭제하는 버튼을 감싼 div를 감싼 div (동그라미) */
            width: 45px; height: 45px;
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
            white-space:nowrap; 
            overflow-x: auto;
        }
            /* SCROLL */
        #myCollection-collectionlist::-webkit-scrollbar { 
            visibility: hidden;
            width: 20px; height:15px;
        }
        #myCollection-collectionlist:hover::-webkit-scrollbar { 
            visibility: visible;
            width: 20px; height:15px;
        }
        /* 스크롤바의 width */
        #myCollection-collectionlist:hover::-webkit-scrollbar-track { display: none; }
        /* 스크롤바의 전체 배경색 */        
        #myCollection-collectionlist:hover::-webkit-scrollbar-thumb { 
            background: #ffe58d;
            opacity: 0.5;
            border-radius: 40px 40px 40px 40px;
        }
        /* 스크롤바 색 */
        #myCollection-collectionlist:hover::-webkit-scrollbar-button { display: none; }
        /* 위 아래 버튼 (버튼 없애기를 함) */
        
        .collectionBox {
        	/* 다른 사람 책장 */
            width: 700px; height: 432px;
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
            width: 120px; height: 160px;
            margin: 4px;
            box-shadow: 1px 1px 3px #D5D5D5;
            float: left;
            overflow: hidden;
            padding: 0;
        }
        .collectionBox-book>img {
        	/* 책 속의 이미지 태그 */
            height: 100%; width:100%;
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
            
            // 책갈피
            $('.reviweScrap').click(function(){
                if($(this).attr('class').indexOf('Y')!=-1) {
                    if(confirm('해당 리뷰를 삭제하시겠습니까?')){
                        $(this).css('display','none');
                        $(this).next().css('display','inline');
                    }else{
                        
                    }
                }else {
                    $(this).css('display','none');
                    $(this).prev().css('display','inline');
                }
            });
            
         	// 다른 사람 서재 삭제 버튼 클릭 시 
            $('.others-library-delete').click(function(){
                if(confirm("해당 서재를 삭제하실건가요?")) {
                    //삭제 로직
                }
            });
            
         	//
         	$('.collectionBox-delete>.fa-trash-alt').click(function(){
         		confirm('해당 책장을 삭제하실건가요?');
         	});
         	
            // lnb hover 시 
            $('#myCollection-lnb>li>a').hover(function(){
                $(this).css('font-weight','bold');
            },function(){
                $(this).css('font-weight','');
            });
            
            
         	// lnb bold 처리
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
<div id="pagename" style="display:none;">컬렉션</div>

    <div id="myCollection-wrapper" class="container-fluid">
      
        <%@ include file="/views/common/header.jsp" %>
        <div id="myLibrary-contents-header" class="row">
			<!-- contents-header -->
			<div class="col-12">
				<div id="myLibrary-contents-header-size" class="row">
					<div class="col-2">
						<div id="userprofile">
							<img src="/image/profile/ppp.jpg" />
						</div>
					</div>
					<div class="col-10">
						<div class="row">
							<div id="myLibrary-title" class="col-12">(익명) 님의 서재</div>
							<div class="col-12">
								<ul id="myLibrary-lnb" class="row">
									<li class="col-2"><a href="/myRivewNote.rw">리뷰노트</a></li>
									<li class="col-2"><a href="/views/library/book_case.jsp">책장</a></li>
									<li class="col-2"><a href="/views/library/collection.jsp">컬렉션</a></li>
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
                   <div id="myCollection-review-count" class="col-12 myCollection-contents-title">리뷰(18)</div>
                   <div class="col-12">
                       <div class="myCollection-book-card">
                           <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">나는 손발이 모두 묶여도, 자유</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                       <div class="col-12 userNickname-data">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       <div class="myCollection-book-card">
                            <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                       <div class="col-12 userNickname-data">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       <div class="myCollection-book-card">
                           <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                       <div class="col-12 userNickname-data">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       <div class="myCollection-book-card">
                           <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                       <div class="col-12 userNickname-data">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       <div class="myCollection-book-card">
                           <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                       <div class="col-12 userNickname-data">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       <div class="myCollection-book-card">
                           <div class="myCollection-book-img">
                                <span class="reviweScrap reviweScrapY collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                <span class="reviweScrap reviweScrapN collectionIcon">
                                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                    </svg>
                                </span>
                               <img src="/image/book/b001.jpg"/>
                            </div>
                           <div class="myCollection-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star collectionIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row myCollection-card-text-bttom">
                              <div class="col-3">
                               <div class="myCollection-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row myCollection-book-card-user">
                                        <div class="col-12 userNickname-data">(userNickname)</div>
                                        <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                        </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart collectionIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                   </div>
               </div>
            </div>
            
            <div class="col-12">
               <div class="row">
                   <div id="myCollection-review-count" class="col-12 myCollection-contents-title">서재(8)</div>
                   <div id="others-library-wrap" class="col-12">
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp1.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       
                       
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                       <div class="others-library">
                        <div class="others-library-delete collectionIcon"><i class="fas fa-trash-alt"></i></div>
                        <div class="others-user-profile">
                            <img src="/image/profile/ppp.jpg"/>
                        </div>
                        <div class="others-library-name">(user1)의 서재</div>
                       </div>
                   </div>
               </div>
            </div>
            
            <div class="col-12">
               <div class="row">
                   <div id="myCollection-collection-count" class="col-12 myCollection-contents-title">책장(10)</div>
                   <div id="myCollection-collectionlist" class="col-12">
                       
                       <div class="collectionBox">
                            <div class="row collectionBox-title">
                               <div class="col-9">(000)님이 좋아하는 컬렉션</div>
                               <div class="col-3 collectionBox-delete"><i class="fas fa-trash-alt collectionIcon"></i></div>
                            </div>
                           <hr>
                           <div class="collectionBox-wrap">
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0003.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0001.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0004.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0003.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0001.jpg"></div>
                           </div>
                           
                       </div>
                       
                       <div class="collectionBox">
                           <div class="row collectionBox-title">
                               <div class="col-9">(000)님이 좋아하는 컬렉션</div>
                               <div class="col-3 collectionBox-delete"><i class="fas fa-trash-alt collectionIcon"></i></div>
                            </div>
                           <hr>
                           <div class="collectionBox-wrap">
                               <div class="collectionBox-book"><img src="/image/book/b0004.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0003.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0001.jpg"></div>
                           </div>
                       </div>
                       
                       <div class="collectionBox">
                           <div class="row collectionBox-title">
                               <div class="col-9">(000)님이 좋아하는 컬렉션</div>
                               <div class="col-3 collectionBox-delete"><i class="fas fa-trash-alt collectionIcon"></i></div>
                            </div>
                           <hr>
                           <div class="collectionBox-wrap">
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0003.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0001.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0004.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0002.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0003.jpg"></div>
                               <div class="collectionBox-book"><img src="/image/book/b0001.jpg"></div>
                           </div>
                           
                       </div>
                       
                   </div>
               </div>
            </div>
            
                    
                    
                    
        </div>
        
        <%@ include file="/views/common/footer.jsp" %>
       
    </div>
    

</body>
</html>