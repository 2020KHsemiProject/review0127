<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<%@ page import="rw.library.model.vo.BookCase" %>
<%@ page import="rw.library.model.vo.Library" %>
<%@ page import="rw.library.model.vo.LibraryPageData" %>
<%@ page import="rw.review.model.vo.Book" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="/views/common/header.jsp" flush="false" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script> -->
    <!-- 폰트 어썸 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- font noto sans kr -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW:0127</title>

<!-- 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/views/css/library_my_contents_top.css" />

    <style>
        .caseIcon {cursor: pointer;}
        
        #myBookcase-wrapper {
            width: 100%;
            padding: 0;
        }
        button:focus {
			outline: none;
		}
        

/************** 콘텐츠 **************/
        
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
            height: 150px;
            padding-top: 4%;
        }
        #bookcase-count{
        	font-size: 1.6rem;
        }
        .font-rem{
        	font-size:1.6rem;
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
            font-size: 1.1rem;
            color: gray;
            box-shadow: 1px 1px 5px -1px gray;
        }
        .modifyCaseNameForm {
        	display: inline-block;
        }
        .modifyCaseName {
        	/* 책장 이름 수정 input 태그 */
        	width: 85%; height:30px;
        	border: 0;
        }
        .modifyCaseNameForm button{
        	/* 책장 이름 수정 버튼 */
        	background-color: white;
        	border: none;
        	outline: none;
        }
        .modifyCaseNameForm button.sendModifyTitleBtn {
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
            font-size: 1rem;
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
        
        .book-nullPlace{
        	/* 추가할 책 빈공간 */
            background-color: #ffe58d;
            text-align: center;
            padding-top: 11%;
            color: white;
            cursor: pointer;
            box-shadow: 0 1px 3px gray;
            display:none;
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
        
        
        
        
        
        /*********** 모달 ***********/
        .modal-body::-webkit-scrollbar { 
            visibility: hidden;
            width: 20px; height:15px;
        }
        .modal-body:hover::-webkit-scrollbar { 
            visibility: visible;
            width: 20px; height:15px;
        }
        /* 스크롤바의 width */
        .modal-body:hover::-webkit-scrollbar-track { display: none;}
        /* 스크롤바의 전체 배경색 */        
        .modal-body:hover::-webkit-scrollbar-thumb { 
            background-color: #ffe58d;
            border-radius: 40px 40px 40px 40px;
        }
        /* 스크롤바 색 */
        .modal-body:hover::-webkit-scrollbar-button { display: none; }
        /* 위 아래 버튼 (버튼 없애기를 함) */
        
        
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
        	height: 420px;
	    	margin-bottom: 30px; 
        	white-space:nowrap; 
            overflow-x: auto;
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
        	$('.modifyCaseNameForm').find('button.modifyTitleBtn').click(function(){
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
        			$('.modifyCaseNameForm').find('button.sendModifyTitleBtn').css('display','none');
        			$('.modifyCaseNameForm').find('button.modifyTitleBtn').css('display','inline');
        			$('.bookcase-name').css('display','inline');
        		}
        	});
            // 책장 수정 아이콘
            $('.bi-gear').click(function(){
                $(this).css('display','none');
                $(this).parent().prev().css('display','inline');
                $(this).parents('.bookcase-case').find('.book-nullPlace').css('display','inline');
                $(this).parents('.bookcase-case').find('.minusButton').css('z-index','10').css('visibility','visible');
            });
            // 책장 수정 완료 아이콘
            $('.addBook-checkIcon').click(function(){
                $(this).css('display','none');
                $(this).next().children().css('display','inline');
                $(this).parents('.bookcase-case').find('.bookcase-booklist').children('.book-nullPlace').remove();
                $(this).parents('.bookcase-case').find('.minusButton').css('z-index','1').css('visibility','hidden');
                history.go(0);
            });
            // 책장 삭제
            $('.minus-book-icon').click(function(){
                let result = window.confirm('해당 책장을 삭제하시겠습니까?');
            });
            
            
            
            
            // lnb hover 시 
            $('#mylibrary-lnb>li>a').hover(function(){
                $(this).css('font-weight','bold');
            },function(){
                $(this).css('font-weight','');
            });
            
         // 책 삭제
            $('.bi-dash-circle').click(function(){
            	var $thisTag = $(this);
            	var bookShelfId = $thisTag.parents('.bookcase-case').attr('name');
    			var delBookId = $thisTag.prev().val();
    			var object = {'bookShelfId':bookShelfId,'bookId':delBookId};
                var result = window.confirm('정말 삭제하시겠습니까?');
                if(result){
                    $.ajax({
                    	url : '/delBookInCase.rw',
                    	data : object,
                    	type : 'post',
                    	success : function(result){
                    		if(result){
                    			$thisTag.parents('.bookcase-book').remove();	
                    		}else{
                    			alert('해당 책 삭제에 실패했습니다. 다시 시도해주세요. \n만약, 지속적인 오류 발생시 관리자에 문의하세요.');
                    		}
                    	}
                    });
                }
            });
            
            
            
         	// lnb hover 시 
            $('#mylibrary-lnb>li>a').hover(function(){
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
            
            
        });

        
        
        
        
        
        
        /// 다른사람 책장
        // 책갈피
            $('.other_bookCaseScrap').click(function(e){
            	var color = $(this).css('color');
            	console.log(color);
                if(color=='rgb(255, 108, 108)') {
                    if(confirm('해당 리뷰를 삭제하시겠습니까?')){
                        $(this).css('color','gray');
                    }
                }else {
                    $(this).css('color','#FF6C6C');
                }
                e.stopImmediatePropagation(); // 버블링 방지
            });
    </script>
    
    
</head>
<body>
<div id="pagename" style="display:none;">책장</div>
        
<% 
	String libraryOwner = request.getParameter("libraryOwner");
	
%>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>