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
<style>
	body { margin: 0; font-family: 'Noto Sans KR', sans-serif; }
	.reviewListIcon {cursor: pointer;}
	* {
		margin: 0; padding: 0;
		text-decoration-line: none;
		list-style: none;
		font-size: 1rem;
		}
	#reviewList-contents {
		/* 가로중앙 */
        margin: 0 auto;
        width: 1200px;
	}
	#reviewList-top {
		width: 100%; height: 150px;
		text-align: center;
		padding: 55px 35px 0 35px;
	}
	#reviewList-top>div {
		line-height: 150px;
		font-size: 2rem;
	}
	#reviewList-writeBar {
		width: 100%; height: 55px;
		padding-left:10px;
	}
	#reviewList-contents>div:nth-child(2){
		padding: 58px 30px 0 28px;
	}
	hr {
		margin: 1px;
	}
	.barLine {
		padding-top: 10px;
	}
	.reviewAlignBtn{
		width: 100px; height:100%;
		line-height: 50px;
		float: left;
	}
	.reviewWriteBtn{
		height:100%;
		line-height: 50px;
		text-align: center;
		float: right;
	}
	.writerBtn {
		width: 200px; 
	}
	#reviewList-content{
		width: 100%;
	}
	
	
	
	
	
	
	/****************리뷰카드*****************/
		#reviewList-cardList{
			padding:30px 35px; width:100%;
		}
        .reviewList-book-card {
        	/* 리뷰카드 크기&스타일 */
            margin: 8px;
            width: 370px; height: 560px;
            border: 1px solid gray;
            float: left;
            box-shadow: 2px 2px 5px #D5D5D5;
        }
        .reviewList-book-img {
        	/* 카드 속> 이미지 div */
            width: 100%; height: 55%;
            overflow: hidden;
        }
        .reviewList-book-img>img {
        	/* 카드 속> 이미지 div 속> 이미지 태그 크기 */
            width: 100%; 
        }
        .reviewList-book-text {
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
        .reviewList-card-text-bttom {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div */
            width: 100%; height: 15%;
            padding-top: 3%;
        }
        .reviewList-userProfile {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 프로필 이미지 div 스타일 */
            width: 50px; height: 50px;
            border-radius: 100%;
            position: relative;
            left: 40%;
            overflow: hidden;
        }
        .reviewList-userProfile>img {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 프로필 이미지 div 속> 이미지 태그 크기 */
            width: 100%; height: 100%;
        }
        .reviewList-book-card-user {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 유저이름 및 작성일 및 조회수 div*/
            padding: 5% 0 0 2%;
        }
        .reviewList-book-card-user div {
        	/* 카드 속> 작성자 정보 및 좋아요 버튼 div 속> 유저이름 및 작성일 및 조회수 div 속> 모든 div*/
            padding-right: 0;
        }
        .reviewList-book-card-user .row>div:last-child {
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
            right: 20%;
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
        
        #moreReview{
        	height: 150px; 
        	padding-top: 25px;
        }
        #moreBtn{
        	width: 300px; height: 50px; 
        	background-color: white;
        	border-radius: 50px 50px;
        	border: 1px solid gray;
        	margin: 0 auto;
        	text-align: center;
        	line-height: 50px;
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
            
        })
    </script>
    
    
</head>
<body>

<div id="reviewList-wrapper">
	<%@ include file="/views/common/header.jsp" %>

	<div id="reviewList-contents">
		<div id="reviewList-top"><div>review</div></div>
		<div>
			<hr style="border:1px solid gray;">
			<div id="reviewList-writeBar">
				<div class="reviewAlignBtn"><span class="reviewListIcon">추천순</span></div>
				<div class="reviewAlignBtn"><span class="reviewListIcon">최신순</span></div>
				<div class="writerBtn reviewWriteBtn"><span class="reviewListIcon">리뷰등록</span></div>
				<div class="barLine reviewWriteBtn" style="border:1px solid lightgray; height:85%; margin-top:3.5px;"></div>
			</div>
			<hr>
		</div>
		
		
		
		
		
		<div id="reviewList-content">
               <div class="row">
                   <div id="reviewList-cardList" class="col-12">
                       <div class="reviewList-book-card">
                           <div class="reviewList-book-img"><img src="/image/book/b001.jpg"/></div>
                           <div class="reviewList-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star reviewListIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row reviewList-card-text-bttom">
                              <div class="col-3">
                               <div class="reviewList-userProfile">
                                   <img src="/image/profile/ppp.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row reviewList-book-card-user">
                                       <div class="col-12">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div id="" class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewListIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       <div class="reviewList-book-card">
                           <div class="reviewList-book-img"><img src="/image/book/b001.jpg"/></div>
                           <div class="reviewList-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star reviewListIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row reviewList-card-text-bttom">
                              <div class="col-3">
                               <div class="reviewList-userProfile">
                                   <img src="/image/profile/ppp1.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row reviewList-book-card-user">
                                       <div class="col-12">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewListIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       <div class="reviewList-book-card">
                           <div class="reviewList-book-img"><img src="/image/book/b001.jpg"/></div>
                           <div class="reviewList-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star reviewListIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row reviewList-card-text-bttom">
                              <div class="col-3">
                               <div class="reviewList-userProfile">
                                   <img src="/image/profile/ppp1.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row reviewList-book-card-user">
                                       <div class="col-12">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewListIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       <div class="reviewList-book-card">
                           <div class="reviewList-book-img"><img src="/image/book/b001.jpg"/></div>
                           <div class="reviewList-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star reviewListIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row reviewList-card-text-bttom">
                              <div class="col-3">
                               <div class="reviewList-userProfile">
                                   <img src="/image/profile/ppp1.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row reviewList-book-card-user">
                                       <div class="col-12">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewListIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       <div class="reviewList-book-card">
                           <div class="reviewList-book-img"><img src="/image/book/b001.jpg"/></div>
                           <div class="reviewList-book-text">
                             <div class="book-text-title">
                                <span class="book-text-title-name">제목</span><span class="review-star reviewListIcon">
                                  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                                </span>
                              </div>
                               이 책은 많은 사람들에게 새벽 기상의 힘을 전파하고 있는 김유진 변호사가 새벽 기상이 자신의 삶을 어떻게 바꿨는지 소개한다. 저자는 인생에서 주저앉고 싶은 순간이 왔을 때마다 동이 
                           </div>
                           <div class="row reviewList-card-text-bttom">
                              <div class="col-3">
                               <div class="reviewList-userProfile">
                                   <img src="/image/profile/ppp1.jpg"/>
                               </div>
                               </div>
                               <div class="col-6">
                                   <div class="row reviewList-book-card-user">
                                       <div class="col-12">(userNickname)</div>
                                         <div class="col-12">
                                           <div class="row">
                                               <div id="" class="col-4">2020.12.01</div>
                                               <div class="col-5">조회 55</div>
                                           </div> 
                                         </div>
                                   </div>
                               </div>
                               <div class="col-3 rvheart reviewListIcon"><div class="review-heart-and-count"><span class="review-heart">♡</span> <span class="heart-count">90</span></div></div>
                           </div>
                       </div>
                       
                       
                       
                       
                   </div>
               </div>
            </div>
            
                    
            <div id="moreReview" class="col-12">
               <div id="moreBtn" class="reviewListIcon">더 보기</div>
            </div>
            
                 
	</div>
	
	 <%@ include file="/views/common/footer.jsp" %>
</div>
	


</body>
</html>