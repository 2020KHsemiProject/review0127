<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Review0127</title>
    <style>
        body { margin: 0; font-family: 'Noto Sans KR', sans-serif; }
        .caseIcon {cursor: pointer;}
        * {
            margin: 0; padding: 0;
            text-decoration-line: none;
            list-style: none;
        }
        #myBookcase-wrapper {
            width: 100%; height: auto;
            padding: 0;
        }
        #myBookcase-wrapper>.row {
            /*padding: 0 13.03%;*/
        }
        
/********** 헤더 **********/
        #header {
            height: 100px;
            background-image: url(/image/icon/headerbackground01.png);
        }
        
/************** 콘텐츠 **************/
        
        /********** contents header ***********/
        #myLibrary-contents-header {
            /* 노란색 / contents의 header */
            width: 100%;
            background-color: #ffe58d;
            height: 250px;
            box-shadow: 0 2px 5px -1px gray;
            margin: 0 auto;
        }
        #myLibrary-contents-header-size {
        	width: 1200px;
        	margin: 0 auto;
        }
        #myLibrary-contents-header-size>div:first-child {
            /* 내 프로필 사진 있는 div */
            padding-top: 65px;
        }
        #userprofile {
            /* 내 프로필 사진 div */
            width: 100px; height: 100px;
            border-radius: 100%;
            overflow: hidden;
            position: relative;
            top: 20px;
            left: 50px;
        }
        #userprofile>img {
        	/* 내 프로필 이미지 */
            width: 100%; height: 100%;
        }
        #myLibrary-title {
        	/* 내 콜렉션 타이틀 */
        	padding: 60px 0 20px 0;
            font-size: 30px;
            font-weight: bold;
        }
        #myLibrary-contents-header>div:last-child>div>div:last-child {
            /* lnb div */
            padding-top: 55px;
        }
        #myLibrary-lnb>li {
        	padding-left: 0;
        }
        #myLibrary-lnb>li:nth-child(1) {/* lnb:리뷰노트 */}
        #myLibrary-lnb>li:nth-child(2) {
        	/* lnb:책장 */
        	/* 고정 */
        	padding-left: 15px;
        	font-weight: bold;
        }
        #myLibrary-lnb>li:nth-child(3) {/* lnb:컬렉션 */}
        #myLibrary-lnb a {
            text-decoration: none;
            font-size: 25px;
            color: black;
        }
         
		/********** contents bookcase **********/
        #bookcase-contents {
        	/* 가로중앙 */
            margin: 0 auto;
            width: 1200px;
        }
        .bookcase-case{
        	padding-bottom: 10%;
        }
        .myBookcase-contents-top {
        	/* 타이틀 중 '?개의 책장' 부분 스타일 */
            font-weight: bold;
            font-size: 30px;
            height: 150px;
            padding-top: 4%;
        }
        #bookcase-contents-top>div:last-child {
            /* 책장 추가하기 버튼을 감싼 div */
            text-align: right;
            padding-top: 4%;
        }
        #add-bookcase-btn {
            /* 책장 추가하기 버튼 */
            background-color: #ffe58d;
            width: 160px;
            height: 60px;
            border-radius: 40px;
            border: 0;
            outline: 0;
            font-weight: bold;
            font-size: 18px;
            color: gray;
            box-shadow: 1px 1px 5px -1px gray;
        }
        .modifyCaseNameForm {
        	display: inline-block;
        }
        .modifyCaseName {
        	/* 책장 이름 수정 input 태그 */
        	width: 90%;
        	border: 0;
        }
        .modifyCaseNameForm button{
        	/* 책장 이름 수정 버튼 */
        	background-color: white;
        	border: none;
        	outline: none;
        }
        .modifyCaseNameForm button[type=submit] {
        	display: none;
        }
        .bookcase-settingicon {
            /* 톱니바퀴 + 있는 div col */
            text-align: right;
        }
        hr {margin-top: 0;}
        
        .bookcase-booklist {
            /* 선택한 책들을 담은 div */
            padding-left: 10px;
            padding-right: 0;
            overflow: hidden;
        }
        .bookcase-book {
            /* 책 표지 div */
            width: 220px; height: 320px;
            float: left;
            overflow: hidden;
        }
        .minusButton {
        	/* 수정버튼 눌렀을 때 나오는 책 삭제 버튼 부트스트랩 감싼 div */
            z-index: 1;
            text-align: right;
            position: relative;
            top: 2%; right: 2%;
            color: floralwhite;
            visibility: hidden;
        }
        .bi-dash-circle {
        	/* 수정버튼 눌렀을 때 나오는 책 삭제 버튼 부트스트랩*/
            background-color: RGBA(25,25,25,0.5);
            border-radius: 100%;
            box-shadow: 0 1px 3px gray;
        }
        .bookcase-book>img {
        	/* 책 표지 이미지 */
            z-index: 2;
            height: 100%;
            vertical-align: text-bottom;
            position: relative;
            bottom: 17%;
        }
            
        
        /* 페이지 번호 */
        #bookcase-page {
            height: 150px;
            padding-top: 25px;
        }
        #bookcase-page li {
            height: 70px;
        }
        #bookcase-page a {
            width: 40px; height: 40px;
            text-align: center;
            font-size: 20px;
            color: black;
        }
        
        
    
        #addBook {
        	/* 책 추가할 빈 공간 div */
            display: none;
        }
        #inAddBook {
        	/* 추가한 책의 안쪽 html */
            display: none;
        }
        #bookCase-nullPlace {
        	/* 추가할 책장 빈공간 div */
            display: none;
        }
        
        #book-nullPlace{
        	/* 추가할 책 빈공간 */
            background-color: #ffe58d;
            text-align: center;
            padding-top: 11%;
            color: white;
            cursor: pointer;
            box-shadow: 0 1px 3px gray;
        }
        
        /* Icon */
        .addBook-checkIcon {
        	/* 추가완료 버튼 */
            display: none;
        }
        .fa-lock {
        	/* 자물쇠 버튼 */
            display: none;
        }
        
        
        #footer {
            background-image: url(/image/icon/footerbackground.png);
            height: 150px;
        }
        #footer>img {
            height: 20%;
            margin: 0 auto;
            margin-top: 55px;
        }
        
        
        
        /*********** 모달 ***********/
        #add-bookcase-modal {
            width:100%;
        }
        .modal-content {
            background-color: #FFFFF6;
            border-radius: 30px;
            width: 250%; height: 600px;
            position: absolute;
            top: 200px;
            left: -370px;
            padding: 0 100px;
        }
        .modal-body {
            overflow: hidden;
        }
        .bookInPopUp {
            width: 220px; height: 320px;
            float: left;
            overflow: hidden;
        }
        .bookInPopUp>img {
            width: 100%;
        }
        .selectBookListInPopUp{
            float: left;
            position: relative;
            bottom: 25px;
        }
        .checkInPopUp{
            text-align: right;
            position: relative;
            top: 50px;
            right: 10px;
        }
        .bi-check-circle-fill {
            display: none;
        }
        .modalFooter {
            text-align: center;
        }
        #bookAddBtn {
            border-radius: 40px;
            width: 200px; height: 50px;
            font-weight: bold;
            font-size: 20px;
            background-color: #ffe58d;
        }
        
        
        
        
        
    </style>
    
    <script>
        
        $(function(){
            
        	// bookcaseName 수정 아이콘 클릭
        	$('.modifyCaseNameForm').find('button[type=button]').click(function(){
        		var existName = $(this).parents('.modifyCaseNameForm').prev().text();
        		$(this).css('display','none');
        		$(this).parent().next().find('button').css('display','inline');
	        	$(this).parent().prev().attr('type','text').focus().attr('placeholder',existName);
	        	$(this).parents('.bookcase-case').find('.bookcase-name').css('display','none');
        	});
        	// input 취소 하고 싶을 때 .modifyCaseNameForm 이외의 부분 클릭시 취소 됨
        	$(document).mouseup(function (e){
        		var LayerPopup = $(".modifyCaseNameForm");
        		if(LayerPopup.has(e.target).length === 0){
        			$('.modifyCaseNameForm').find('input[name=bookcaseName]').attr('type','hidden').val('');
        			$('.modifyCaseNameForm').find('button[type=submit]').css('display','none');
        			$('.modifyCaseNameForm').find('button[type=button]').css('display','inline');
        			$('.bookcase-name').css('display','inline');
        		}
        	});
            // 책장 열쇠 잠금
            $('.fa-lock-open').click(function(){
                $(this).css('display','none');
                $(this).parent().next().children().css('display','inline');
            });
            // 책장 열쇠 열림
            $('.fa-lock').click(function(){
                $(this).css('display','none');
                $(this).parent().prev().children().css('display','inline');
            });
            // 책장 수정 아이콘
            $('.bi-gear').click(function(){
                $(this).css('display','none');
                $(this).parent().prev().css('display','inline');
                $(this).parents('.bookcase-case').find('.bookcase-booklist').prepend($('#addBook').html());
                $(this).parents('.bookcase-case').find('.minusButton').css('z-index','10').css('visibility','visible');
            });
            // 책장 수정 완료 아이콘
            $('.addBook-checkIcon').click(function(){
                $(this).css('display','none');
                $(this).next().children().css('display','inline');
                $(this).parents('.bookcase-case').find('.bookcase-booklist').children('#book-nullPlace').remove();
                $(this).parents('.bookcase-case').find('.minusButton').css('z-index','1').css('visibility','hidden');
                // 여기서 저장하는 로직으로 이어져야 함
            });
            // 책장 삭제
            $('.minus-book-icon').click(function(){
                let result = window.confirm('해당 책장을 삭제하시겠습니까?');
            });
            // 책 삭제
            $('.minusButton').click(function(){
                let result = window.confirm('정말 삭제하시겠습니까?');
                if(result){
                    $(this).parent().remove();
                }
            });
            
            
            
            // lnb hover 시 
            $('#mylibrary-lnb>li>a').hover(function(){
                $(this).css('font-weight','bold');
            },function(){
                $(this).css('font-weight','');
            });
            
            
            // 모달 체크 버튼
            $('.bi-check-circle').click(function(){
                $(this).css('display','none');
                $(this).parent().next().children().css('display','inline');
            });
            $('.bi-check-circle-fill').click(function(){
                $(this).css('display','none');
                $(this).parent().prev().children().css('display','inline');
            });
            
            
        });

    </script>
    
    
</head>
<body>
        <!-- modal 1 -->
        
        <div class="modal fade" id="add-bookcase-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
             <form>
              <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel">추가할 책을 선택하세요</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
              <!-- 내가 좋아요 누른 책 리스트 -->
                <div class="selectBookListInPopUp">
                    <div class="checkInPopUp">
                        <span class="minusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                            </svg>
                        </span>
                        <span class="plusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle-fill caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                            </svg>
                        </span>
                    </div>
                    <div class="bookInPopUp" style="margin: 8px;">
                        <img src="/image/book/b0009.jpg"/>
                    </div>                    
                </div>
                
                <div class="selectBookListInPopUp">
                    <div class="checkInPopUp">
                        <span class="minusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                            </svg>
                        </span>
                        <span class="plusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle-fill caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                            </svg>
                        </span>
                    </div>
                    <div class="bookInPopUp" style="margin: 8px;">
                        <img src="/image/book/b0001.jpg"/>
                    </div>                    
                </div>
              </div>
              <div class="modalFooter">
                <button id="bookAddBtn" class="btn">선택완료</button>
              </div>
              </form>
            </div>
          </div>
        </div>

        
        <!-- 추가할 책의 빈공간 -->
        <!-- <div class="bookcase-book" style="margin: 8px;"> 첫번째 div 속성 이걸로 해야함
            즉 id 값과 onclick 값 빼면 됨  -->
        <div id="addBook">
            <div id="book-nullPlace" class="bookcase-book" style="margin: 8px;" onclick="addBookInCase();">
                <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg>
            </div>
        </div>
        
        <!-- 책 빈공간 안에 데이터 채울 공간 -->
        <div id="inAddBook">
            <div class="minusButton">
                <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                </svg>
            </div>
            <img src="/image/book/b001.jpg"/>           
        </div>
        
<script>
      	// 책 빈공간 추가
	function addBookInCase(){
       	// 모달 책장의 책 추가
		$('#add-bookcase-modal').modal('show');
	}
</script>
        
        <!-- 추가할 책장의 빈공간 -->
        <div id="bookCase-nullPlace">
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name">(user1) 님의 개인 책장</span>
                                <form class="modifyCaseNameForm">
                                    <input type="hidden" class="modifyCaseName" name="bookcaseName" placeholder="(user1) 님의 개인 책장"/>
                                    <span><button type="button"><i class="far fa-edit caseIcon"></i></button></span>
                                    <span><button type="submit"><i class="fas fa-edit caseIcon"></i></button></span>
                                </form>
                                <span><i class="fas fa-lock-open caseIcon"></i></span>
                                <span><i class="fas fa-lock caseIcon"></i></span>
                                </H3>
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                <H3>
                                <span  class="addBook-checkIcon">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                                    </svg>   
                                </span>
                                <!-- 톱니바퀴 아이콘 -->
                                <span class="modifyBook-gearIcon">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-gear caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
                                  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
                                </svg>
                                </span>
                                <!-- + 아이콘 -->
                                <span class="minus-book-icon">
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </span>
                                </H3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="col-12 bookcase-booklist">
                       <div id="book-nullPlace" class="bookcase-book" style="margin: 8px;" onclick="addBookInCase();">
                            <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- <button id="add-bookcase-btn" data-toggle="modal" data-target="#add-bookcase-modal">책장 추가하기</button> 모달ㄴ -->
        
        
        
        
        
        
        
    

        
        
        
        
        
        
        
        
        
        
        
        
    
	<div id="myBookcase-wrapper" class="container-fluid">
	
        <div id="header" class="row">HEADER</div>
        
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
									<li class="col-2"><a href="/views/library/reviewNote.jsp">리뷰노트</a></li>
									<li class="col-2"><a href="/views/library/bookcase.jsp">책장</a></li>
									<li class="col-2"><a href="/views/library/collection.jsp">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
     
        
        
        
        <div id="bookcase-contents" class="row">
        <!-- contents -->
            <div class="col-12">
                <div class="row myBookcase-contents-top">
                   <!-- user의 프로필과 서재 네비게이션 부분 -->
                    <div id="bookcase-count" class="col-10">(6)개의 책장</div>
                    <div class="col-2">
                        <button id="add-bookcase-btn" onclick="addBookCase();">책장 추가하기</button>
                    </div>
                </div>
            </div>
            
<script>
    function addBookCase(){
        let add = $('#bookCase-nullPlace').html();
        $('#bookcase-contents').children().eq(1).after(add);
    	//$('#add-bookcase-modal').modal('show');
    }
</script>
            
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name">나님의 개인 책장</span>
                                <form class="modifyCaseNameForm">
                                    <input type="hidden" class="modifyCaseName" name="bookcaseName"/>
                                    <span><button type="button"><i class="far fa-edit caseIcon"></i></button></span>
                                    <span><button type="submit"><i class="fas fa-edit caseIcon"></i></button></span>
                                </form>
                                <span><i class="fas fa-lock-open caseIcon"></i></span>
                                <span><i class="fas fa-lock caseIcon"></i></span>
                                </H3>
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                <H3>
                                <span  class="addBook-checkIcon">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                                    </svg>   
                                </span>
                                <!-- 톱니바퀴 아이콘 -->
                                <span class="modifyBook-gearIcon">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-gear caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
                                  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
                                </svg>
                                </span>
                                <!-- + 아이콘 -->
                                <span class="minus-book-icon">
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </span>
                                </H3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="col-12 bookcase-booklist">
                       
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0001.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0002.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0003.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0004.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0005.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0006.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0007.jpg"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name">(user1) 님의 개인 책장</span>
                                <form class="modifyCaseNameForm">
                                    <input type="hidden" class="modifyCaseName" name="bookcaseName"/>
                                    <span><button type="button"><i class="far fa-edit caseIcon"></i></button></span>
                                    <span><button type="submit"><i class="fas fa-edit caseIcon"></i></button></span>
                                </form>
                                <span><i class="fas fa-lock-open caseIcon"></i></span>
                                <span><i class="fas fa-lock caseIcon"></i></span>
                                </H3>
                                
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                <H3>
                                <span  class="addBook-checkIcon">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                                    </svg>     
                                </span>
                                <!-- 톱니바퀴 아이콘 -->
                                <sapn class="modifyBook-gearIcon">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-gear caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
                                  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
                                </svg>
                                </sapn>
                                <!-- + 아이콘 -->
                                <span class="minus-book-icon">
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </span>
                                </H3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="col-12 bookcase-booklist">
                       
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0008.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0009.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b0010.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b004.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b003.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b002.jpg"/>
                        </div>
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="/image/book/b004.jpg"/>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bookcase-page" class="col-12">
                <nav aria-label="Page navigation example">
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
                </nav>
            </div>
        </div>

        <div id="footer" class="row">
            <img src="/image/icon/CopyRight%20%C2%A9%202020%20%20All%20rights%20reserved..png"/>
        </div>
        
    </div>
    
    
    

    
</body>
</html>