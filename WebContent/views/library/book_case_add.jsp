<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rw.member.model.vo.Member" %>
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
<dependency>
		<groupId>org.apache.maven.plugins</groupId>
		<artifactId>maven-resources-plugin</artifactId>
		<version>2.4.3</version>
	</dependency>
    <style>
        .caseIcon {cursor: pointer;}
        
        #myBookcase-wrapper {
            width: 100%;
            padding: 0;
            min-height: 550px;
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
            height: auto;
        }
        .bookcase-case{
        	padding-bottom: 10%;
        }
        .font-rem{
        	font-size:1.6rem;
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
            margin: 0 10px;
        }
        #reset-btn{
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
            margin: 0 10px;
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
            margin: 27px;
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
            
            // lnb hover 시 
            $('#mylibrary-lnb>li>a').hover(function(){
                $(this).css('font-weight','bold');
            },function(){
                $(this).css('font-weight','');
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

        
    </script>
    
    
</head>
<body>
<div id="pagename" style="display:none;">책장</div>
        
<% 
	String libraryOwner = request.getParameter("libraryOwner");
	Member mem = (Member)session.getAttribute("member");
%>

<% if((Member)session.getAttribute("member")!=null&&((Member)session.getAttribute("member")).getMemberId().equals(libraryOwner)){ %>
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
									<li class="col-2"><a href="/views/library/collection.jsp">컬렉션</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="bookcase-contents" class="row">
		<form>
			<div class="col-12" style="height:120px; padding-top:50px;">
				<input type="text" name="bookCaseTitle" placeholder="책장이름을 입력해주세요" style="width:400px; height:50px; border-style: none; margin-left:20px;"/>
				<hr style="margin:5px;">
			</div>
			<div class="col-12" height: auto;">
			<div id="bookList">
	<% ArrayList<Book> listLB = (ArrayList<Book>)request.getAttribute("listLB"); %> 
	<% for(Book likeB : listLB) { %>  
			<div class="selectBookListInPopUp">
                <input type="hidden" value="<%=likeB.getBookId()%>"/>
                    <div class="checkInPopUp" thisBookId="<%=likeB.getBookId()%>">
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
                        <img src="<%=likeB.getBookImage()%>"/>
                    </div>                    
                </div>
	<% } %>	
			</div>	
			</div>
		</form>
		<div class="col-12" style="height:100px;">
				<div style="margin: 0 400px;">
				<button id="add-bookcase-btn" type="button">추가 완료</button> 
				<button id="reset-btn" type="button">취소</button>
				</div>
			</div>
		</div>

<script>
	$(function(){
		var arr = [];
		$('.bi-check-circle').click(function(){
			$(this).css('display','none');
			$(this).parent().next().children().css('display','inline');
			var thisBookId = $(this).parent().parent().attr('thisBookId');
			arr.push(thisBookId);
		});
		$('.bi-check-circle-fill').click(function(){
			$(this).css('display','none');
			$(this).parent().prev().children().css('display','inline');
			var thisBookId = $(this).parent().parent().attr('thisBookId');
			var delId = arr.indexOf(thisBookId);
			arr.splice(delId,1);
		});
		
		$('#add-bookcase-btn').click(function(){
			var bookCaseTitle = $('input[name=bookCaseTitle]').val();
			if(bookCaseTitle==''){
				alert('책장 제목을 입력해주세요');
			}else if(arr==null) {
				alert('책을 1개이상 선택해주세요.');
			} else{
				var object = {'addBookList':arr,'bookCaseTitle':bookCaseTitle};
				$.ajax({
					url : '/addBookCase.rw?libraryOwner='+'<%=libraryOwner%>',
					datatype : 'json',
					traditional : true,
					data : object,
					type : 'post',
					success : function(data){
						if(data.result){
							alert('책장이 추가 되었습니다.');
						}else{
							alert('책장 추가에 실패하였습니다.\n지속적인 오류시 관리자에 문의하세요.');
						}
						location.replace('/myBookCase.rw?libraryOwner='+'<%=libraryOwner%>');
					},
					error : function(){
						alert('책장 추가에 실패하였습니다.\n지속적인 오류시 관리자에 문의하세요.');
					}
				});
			}
		});
		
		$('#reset-btn').click(function(){
			history.back();
		});
	})
</script>


</div> <!-- wrpper -->
<% } else { %>
<script>
alert('잘못된 접근입니다.');
history.back();
</script>
<% } %>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>