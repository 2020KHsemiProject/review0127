<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
<%@ page import="rw.library.model.vo.BookCase" %>
<%@ page import="rw.library.model.vo.Library" %>
<%@ page import="rw.library.model.vo.LibraryPageData" %>
<%@ page import="rw.review.model.vo.Book" %>
<%@ page import="rw.col.model.vo.BookshelfCollection" %>
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
            min-height: 550px;
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
        .other_bookCaseScrap {
        	color: gray;
        }
        
        .not-yet {
		margin: 0 auto;
		text-align: center;
		font-size: 3rem;
}
        
    @media (max-width:1200px){
    	#myBookcase-wrapper{ width: 1200px;}
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
        
    </script>
    
    
</head>
<body>
<div id="pagename" style="display:none;">책장</div>
        
<% 
	String libraryOwner = request.getParameter("libraryOwner");
	Member mem = (Member)request.getAttribute("member"); 
	int count = (int)request.getAttribute("count");
	if(mem.getProfileImg()==null){
		mem.setProfileImg("default_user_dark.png");
	}
	///////////////////////////////////////////////////////////// 내 책장
if((Member)session.getAttribute("member")!=null&&((Member)session.getAttribute("member")).getMemberId().equals(libraryOwner)){
%>
        
    
	<div id="myBookcase-wrapper" class="container-fluid">
	
        
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

							<div id="myLibrary-title" class="col-12"><%=mem.getNickname() %>
								님의 서재
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
     
        
        
        
        <div id="bookcase-contents" class="row">
        <!-- contents -->
            <div class="col-12">
                <div class="row myBookcase-contents-top">
                   <!-- user의 프로필과 서재 네비게이션 부분 -->
                    <div id="bookcase-count" class="col-10"><%=count %>개의 책장</div>
                    <div class="col-2">
                    <form action="/addBookCasePage.rw?" post="post">
                    <input type="hidden" name="libraryOwner" value="<%=mem.getMemberId()%>"/>
                        <button type="submit" id="add-bookcase-btn">책장 추가하기</button>
                    </form>
                    </div>
                </div>
            </div>

	<% LibraryPageData listPage = (LibraryPageData)request.getAttribute("list");
			ArrayList<BookCase> list = listPage.getList();
			String pageNavi = listPage.getPageNavi();
		if(!list.isEmpty()){
			
			for(BookCase bkc : list) {
				Library libr = bkc.getLibr();
				ArrayList<Book> listB = bkc.getListB();
	%>
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case" name="<%=libr.getBookShelfId()%>">
                
                
                
                
                
                
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name font-rem"><%=libr.getBookShelfName() %></span>
                                <form class="modifyCaseNameForm">
                                    <input type="hidden" class="modifyCaseName" name="bookcaseName<%=libr.getBookShelfId()%>"/>
                                    <span><button type="button" class="font-rem modifyTitleBtn"><i class="far fa-edit caseIcon"></i></button></span>
                                    <span><button type="button" class="font-rem sendModifyTitleBtn" onclick="modifyTitleBtn('<%=libr.getBookShelfId() %>')"><i class="fas fa-edit caseIcon"></i></button></span>
                                </form>
                                
					<% if(libr.getPrivateYN()=='N'){ %>
						<span class="font-rem"><i class="fas fa-lock-open caseIcon" onclick="modifyLock('<%=libr.getBookShelfId()%>','N');"></i></span>
                        <span class="font-rem"><i class="fas fa-lock caseIcon" style="display:none;" onclick="modifyLock('<%=libr.getBookShelfId()%>','Y');"></i></span>
					<% }else { %>
						<span class="font-rem"><i class="fas fa-lock-open caseIcon" style="display:none;" onclick="modifyLock('<%=libr.getBookShelfId()%>','N');"></i></span>
                        <span class="font-rem"><i class="fas fa-lock caseIcon" onclick="modifyLock('<%=libr.getBookShelfId()%>','Y');"></i></span>
					<% } %>
                                </H3>
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                <H3>
                                <span  class="addBook-checkIcon">
                                    <svg width="1.6rem" height="1.6rem" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                                    </svg>   
                                </span>
                                <!-- 톱니바퀴 아이콘 -->
                                <span class="modifyBook-gearIcon">
                                <svg width="1.6rem" height="1.6rem" viewBox="0 0 16 16" class="bi bi-gear caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
                                  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
                                </svg>
                                </span>
                                <!-- x 아이콘 -->
                                <span class="minus-book-icon">
                                    <svg width="2.1rem" height="2.1rem" viewBox="0 0 16 16" class="bi bi-x caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg" onclick="delCase('<%=libr.getBookShelfId() %>');">
                                      <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </span>
                                </H3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    
                    
                    
                    
                    
                    <div class="col-12 bookcase-booklist"> <!-- 여기가 책 리스트 -->
                    
                    <div class="bookcase-book book-nullPlace" style="margin: 8px;" onclick="addBookInCase('<%=libr.getBookShelfId()%>');">
                		<svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    	<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                    	<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                		</svg>
            		</div>
                       
					<% for(Book b : listB){ %>
                       
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                           <input type="hidden" value="<%=b.getBookId()%>"/>
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="<%=b.getBookImage() %>"/>
                        </div>
                        
                     <% } /// 포이치문 책표지%>
                        
                    </div>
                    
                    
                    
				</div>
			</div>
			
			
			
			<script>
			
			////// 책장 이름 수정
    		function modifyTitleBtn(bookShelfId){
    			var $inputTag = $('input[name=bookcaseName'+bookShelfId+']');
        		var titleName = $inputTag.val();
        		var object = {'bookShelfId':bookShelfId,'titleName':titleName};
        		$.ajax({
        			url : '/bookCaseModifyTitle.rw',
        			data : object,
        			type : 'post',
        			success : function(data){
            			$inputTag.css('display','none').val('');
            			$inputTag.parent().prev().text(data.updateTitle).css('display','inline');
            			$inputTag.next().children().css('display','inline');
            			$inputTag.next().next().children().css('display','none');
        			},
        			error : function(){
        				alert('책장 이름 수정에 실패했습니다.\n지속적인 오류시 관리에 문의해주세요.')
        			}
        		});
    		};
			
			//// 자물쇠 버튼
    		// 책장 열쇠 잠금
    		function modifyLock(bookShelfId,lock){
			
				var object = {'bookShelfId':bookShelfId,'lockData':lock};
				if(lock=='N'){
	                $.ajax({
	                	url : '/bookCaseModifyLock.rw',
	                	data : object,
	                	type : 'post',
	                	success : function(){
	                		history.go(0);
	                	},
	                	error : function(){
	                		alert('책장 잠금에 실패했습니다.\n지속적인 오류시 관리에 문의해주세요.');
	                	}
	                });
					}else{
		                $.ajax({
		                	url : '/bookCaseModifyLock.rw',
		                	data : object,
		                	type : 'post',
		                	success : function(){
		                		history.go(0);
		                	},
		                	error : function(){
		                		alert('책장 잠금에 실패했습니다.\n지속적인 오류시 관리에 문의해주세요.')
		                	}
						});
					}
				}
            
          	function delCase(bookShelfId){
          		confirm(bookShelfId);
          		var result = window.confirm('해당 책장을 삭제하시겠습니까?');
       			if(result){
       				location.replace('/deletBookCase.rw?libraryOwner='+'<%=libraryOwner%>'+'&bookShelfId='+bookShelfId);
              	}
       		};
          </script>
            
          <% } //// 포이치문 책장 %>  
            
          
            
            
            
            <div id="bookcase-page" class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
						<%=pageNavi %>
                    </ul>
                </nav>
            </div>
            
            
            
            
            
            
            
            
    <% ArrayList<Book> listLB = (ArrayList<Book>)request.getAttribute("listLB"); %>        
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
              
         <% for(Book likeB : listLB) { %>
                <div class="selectBookListInPopUp">
                <input type="hidden" value="<%=likeB.getBookId()%>"/>
                    <div class="checkInPopUp">
                        <span class="minusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle caseIcon befor-like" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
                            </svg>
                        </span>
                        <span class="plusBookInPopUp">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-check-circle-fill caseIcon after-like" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                            </svg>
                        </span>
                    </div>
                    <div class="bookInPopUp" style="margin: 8px;">
                        <img src="<%=likeB.getBookImage()%>"/>
                    </div>                    
                </div>
                
           <% } ///// 모달 책 포이치문%>   
           
                
              </div>
              <div class="modalFooter">
                <button type="button" id="bookAddBtn" class="btn">선택완료</button>
              </div>
              </form>
            </div>
          </div>
        </div>
            
            
            
            
      <script>
    	var modalData; // 책장 고유ID
    	
		function addBookInCase(data){
	       	// 모달 책장의 책 추가 onload면 안 됨
			$('#add-bookcase-modal').modal('show');
			modalData = data;
		};
      	
		// 모달 체크 추가버튼
		$('.bi-check-circle').click(function(){
			var $thisTag = $(this);
			var addBookId = $thisTag.parent().parent().prev().val();
			//console.log(addBookId);
			var object = {'bookShelfId':modalData,'bookId':addBookId};
			$.ajax({
				url : '/addBookInCase.rw',
				data : object,
				type: 'post',
				success : function(){
					$thisTag.css('display','none');
					$thisTag.parent().next().children().css('display','inline');
				},
				error : function(){
					console.log('책 추가에 실패했습니다.\n지속적인 오류시 관리에 문의해주세요.');
				}
			});
			
		});
		
		// 모달 체크 삭제버튼
		$('.bi-check-circle-fill').click(function(){
			var $thisTag = $(this);
			var delBookId = $thisTag.parent().parent().prev().val();
			var object = {'bookShelfId':modalData,'bookId':delBookId};
			$.ajax({
				url : '/delBookInCase.rw',
				data : object,
				type: 'post',
				success : function(){
					$thisTag.css('display','none');
					$thisTag.parent().prev().children().css('display','inline');
				},
				error : function(){
					console.log('책 추가에 실패했습니다.\n지속적인 오류시 관리에 문의해주세요.');
				}
			});
			
		});
		// 모달 선택완료 버튼
		$('#bookAddBtn').click(function(){
			history.go(0);
		});
	</script>      
            
            
            
            
            
	<% } else { %>  
	<div class="reviewNote-contents"> 
            <div class="not-yet"><%=mem.getNickname() %>님의 책장이 아직 없습니다.</div>
    </div>
	<% } %>
        </div>

        

        
    </div>
    

        
        
       
    

 <% } else if((Member)session.getAttribute("member")!=null){ 
 ///////////////////////////////////////////////////////////////////////////////////// 다른사람 책장
 
 
 %> 


<div id="myBookcase-wrapper" class="container-fluid">
	
        
        <div id="myLibrary-contents-header" class="row" style="background-color: #7895B5;">
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

							<div id="myLibrary-title" class="col-12" style="color: white;"><%=mem.getNickname() %>님의 서재</div>
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
     
        
        
        
        <div id="bookcase-contents" class="row">
        <!-- contents -->
            <div class="col-12">
                <div class="row myBookcase-contents-top">
                   <!-- user의 프로필과 서재 네비게이션 부분 -->
                    <div id="bookcase-count" class="col-10"><%=count %>개의 책장</div>
                    <div class="col-2">
                      <!--   <button id="add-bookcase-btn" onclick="addBookCase();">책장 추가하기</button>  -->
                    </div>
                </div>
            </div>
            
	<% LibraryPageData listPage = (LibraryPageData)request.getAttribute("list");
		ArrayList<BookCase> list = listPage.getList();
		String pageNavi = listPage.getPageNavi();
		if(!list.isEmpty()){
			
			for(BookCase bkc : list) {
				Library libr = bkc.getLibr();
				ArrayList<Book> listB = bkc.getListB();
	%>
          
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case" name="<%=libr.getBookShelfId()%>">
                
                
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name font-rem"><%=libr.getBookShelfName() %></span>
                                </H3>
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                <H3>
                                <!-- 스크랩 아이콘 -->
                                <span class="other_bookCaseScrap bookCaseScrap<%=libr.getBookShelfId() %> caseIcon">
                                   	<svg width="2.5em" height="2.5em" viewBox="0 0 16 16" class="bi bi-bookmark-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5V2z"/>
                                    </svg>
                                </span>
                                </H3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    
                    
                    
                    <div class="col-12 bookcase-booklist"> <!-- 여기가 책 리스트 -->
                       
					<% for(Book b : listB){ %>
                       
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="<%=b.getBookImage() %>"/>
                        </div>
                        
                     <% } /// 포이치문 책표지%>
                        
                    </div>
                    
                    
                    
				</div>
			</div>
			
			
			<% ArrayList<BookshelfCollection> bcColList = (ArrayList<BookshelfCollection>)request.getAttribute("bcColList"); 
				for(BookshelfCollection bcCol : bcColList){
					if(libr.getBookShelfId().equals(bcCol.getBookshelfId())){ %>
				<script>
					$('.bookCaseScrap'+'<%=libr.getBookShelfId() %>').css('color','#FF6C6C');
				</script>
			<%		}
				}
			%>
			
			
			
			<script>
			// 책갈피
            $('.other_bookCaseScrap').click(function(e){
            	e.stopImmediatePropagation(); // 버블링 방지
            	var color = $(this).css('color');
            	var $thisTag = $(this);
            	
            	var bookCaseId = $thisTag.parents('.bookcase-case').attr('name');
            	
                if(color=='rgb(255, 108, 108)') { // 빨간색일 때
                	if(confirm('해당 책장을 컬렉션에서 삭제하시겠습니까?')){                		
                	$.ajax({
                		url : '/boolshelfCollectionDel3.rw',
                		data : {'bookCaseId':bookCaseId},
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
                    	url : '/boolshelfCollectionAdd.rw',
                    	data : {'bookCaseId':bookCaseId},
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
            </script>
			
          <% } //// 포이치문 책장 %>  
            
            
            
            
            
            
            
            <div id="bookcase-page" class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <%=pageNavi %>
                    </ul>
                </nav>
            </div>
            
            
	<% } else { %>   
	<div class="reviewNote-contents">
            <div class="not-yet">
            	<%=mem.getNickname() %>님의 책장이 아직 없습니다.
			</div>
	</div>
	<% } %>
        </div>

        

        
    </div>











<% } else {
///////////////////////////////////////////////////////////////////////////////////// 비회원
%>
<div id="myBookcase-wrapper" class="container-fluid">
	
        
        <div id="myLibrary-contents-header" class="row" style="background-color: #7895B5;">
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

							<div id="myLibrary-title" class="col-12" style="color: white;"><%=mem.getNickname() %>님의 서재</div>
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
     
        
        
        
        <div id="bookcase-contents" class="row">
        <!-- contents -->
            <div class="col-12">
                <div class="row myBookcase-contents-top">
                   <!-- user의 프로필과 서재 네비게이션 부분 -->
                    <div id="bookcase-count" class="col-10"><%=count %>개의 책장</div>
                    <div class="col-2">
                      <!--   <button id="add-bookcase-btn" onclick="addBookCase();">책장 추가하기</button>  -->
                    </div>
                </div>
            </div>
            
	<% LibraryPageData listPage = (LibraryPageData)request.getAttribute("list");
		ArrayList<BookCase> list = listPage.getList();
		String pageNavi = listPage.getPageNavi();
		if(!list.isEmpty()){
			
			for(BookCase bkc : list) {
				Library libr = bkc.getLibr();
				ArrayList<Book> listB = bkc.getListB();
	%>
          
            <div class="col-12">
               <br><br>
                <div class="row bookcase-case">
                
                
                    <div class="col-12">
                        <div class="row">
                            <div class="col-10">
                                <H3>
                                <span class="bookcase-name font-rem"><%=libr.getBookShelfName() %></span>
                                </H3>
                            </div>
                            <div class="col-2 bookcase-settingicon">
                                
                            </div>
                        </div>
                        <hr>
                    </div>
                    
                    
                    
                    <div class="col-12 bookcase-booklist"> <!-- 여기가 책 리스트 -->
                       
					<% for(Book b : listB){ %>
                       
                        <div class="bookcase-book" style="margin: 8px;">
                           <div class="minusButton">
                            <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-dash-circle caseIcon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                            </svg>
                            </div>
                            <img src="<%=b.getBookImage() %>"/>
                        </div>
                        
                     <% } /// 포이치문 책표지%>
                        
                    </div>
                    
                    
                    
				</div>
			</div>
          
          <% } //// 포이치문 책장 %>  
            
            
            
            
            
            
            
            <div id="bookcase-page" class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <%=pageNavi %>
                    </ul>
                </nav>
            </div>
            
            
	<% } else { %>   
			
            <div class="not-yet">
            	<%=mem.getNickname() %>님의 책장이 아직 없습니다.
			</div>
			</div>
	<% } %>
        

        

        
    </div>

<% } %>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>