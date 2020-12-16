<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>REVIEW:0127</title>
    <!--외부 CSS-->
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/join.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <!--bootStrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>	
    body { 
    	background-color: #FFF6D6;
    } 
    .guide_span{
    	color: #517800;
    	font-size: 0.8rem;
    	font-weight: 400;
    }
    </style>
</head>

<body>
    <script>
    	$(function(){
    		$('form').submit(function(){
    			var $memberId = $('input[name=memberId]');
    			var $nickName = $('input[name=nickName]');
    			var $memberPwd = $('input[name=memberPwd]');
    			var $memberPwd_re = $('input[name=memberPwd_re]');
    			var $email = $('input[name=birthYear]');
    			var $birthYear = $('input[name=birthYear]');
    			
    			if(!(/^[a-zA-Z0-9]{5,20}$/.test($memberId.val()))) {
    				$memberId.prev().prev().text("아이디를 다시 확인해주세요.").css('color','red');
    				return false;
    			} else if(!(/^[a-zA-z0-9가-힣]{1,10}$/.test($nickName.val()))) {
    				$nickName.prev().prev().text("닉네임을 다시 확인해주세요.").css('color','red');
    				return false;
    			} else if(!(/^[a-zA-Z0-9]{8,16}$/.test($memberPwd.val()))) {
    				$memberPwd.prev().prev().text("비밀번호를 다시 확인해주세요.").css('color','red');
    				return false;
    			} else if($memberId.val()==$memberPwd.val()) {
    				$memberPwd.prev().prev().text("아이디와 동일한 비밀번호는 사용이 불가능합니다.").css('color','red');
    				return false;
    			} else if(($memberPwd.val()!=$memberPwd_re.val())) {
    				$memberPwd_re.prev().prev().text("비밀번호가 동일하지 않습니다.").css('color','red');
    				return false;
    			} else if(!(/^[a-zA-Z0-9@]+$/.test($email.val()))) {
    				$email.prev().prev().text("올바른 이메일 형식으로 입력해주세요.").css('color','red');
    				return false;
    			} else if(!(/^[0-9\s]{4,4}$/.test($birthYear.val()))) {
    				alert("출생년도는 숫자 네 자리만 입력해주세요.");
    				return false;
    			}
    			return true;
    		});
    		
    		$('input[name]').focusin(function(){
    			$(this).css('border','5px solid yellowgreen');
    			switch($(this).attr('name')) {
    			case "memberId":$(this).prev().prev().text("영문자와 숫자 조합 5~20 글자여야 합니다.").css('color','#517800');
    			break;
    			case "nickName":$(this).prev().prev().text("영문자와 숫자,한글 조합 최대10글자까지 입니다.").css('color','#517800');
    			break;
    			case "memberPwd":$(this).prev().prev().text("영문자와 숫자 조합 8~16 글자여야 합니다.").css('color','#517800');
    			break;
    			case "memberPwd_re":$(this).prev().prev().text("비밀번호를 한 번 더 입력해주세요.").css('color','#517800');
    			break;
    			case "email":$(this).prev().prev().text("이메일 형식으로 입력해주세요. ex)abc123@abc.com").css('color','#517800');
    			break;
    			}
    		});
    		$('input[name]').focusout(function(){
				$(this).css('border','1.2px solid #ccc');
				$(this).prev().prev().text("");
			});
    		/*$('#data-agree').not('#data-agree','checked') {
    			preventDefault();
    			alert("개인 정보 제공 및 활용 동의에 체크해주세요.");
    		};*/
    	});
    </script>
    <div id="join_wrapper">
        <div id="join_header">
            <div id="join_logo">
                <center>
                	<a href="/index.jsp"><img src="/image/login/logo_dark.png" id="join_logo_img" /></a>
                </center>
            </div>
        </div>
        <div id="join_content">
            <center>
                <div id="inner_content">
                    <form action="/memberJoin.rw" method="post">
                    	<span class="guide_span"></span><br>    
                        <input type="text" name="memberId" placeholder="아이디" class="input_group "/>
                        <button type="button" id="id_check">중복확인</button>
                        <br>
                        <span class="guide_span"></span><br>
                        <input type="text" name="nickName" placeholder="닉네임" class="input_group"/>
                        <br> 
                        <span class="guide_span"></span><br>                       
                        <input type="password" name="memberPwd" placeholder="비밀번호" id="input_pw" class="input_group"/>
                        <br>
                        <span class="guide_span"></span><br>
                        <input type="password" name="memberPwd_re" placeholder="비밀번호 확인" class="input_group"/>
                        <br> 
                        <span class="guide_span"></span><br>                 
                        <input type="email" name="email" placeholder="이메일 주소" class="input_group"/>
                        <br>
                        <p id="option_text">선택 입력 (예시. 1996 / 남)</p>        
                        <input type="text" name="birthYear" placeholder="출생년도" class="input_group"/>
                        <button type="button" class="btn btn-outline-primary" name="gender" value="M">남</button>
                        <button type="button" class="btn btn-outline-primary" name="gender" value="F">여</button>
                        <br>
                        <span id="data_agree">개인 정보 제공 및 활용 동의</span><input type="checkbox" name="agreement" value="동의"/>
                        <br><br>
                        <input type="submit" value="회원가입"/><br>
                        <input type="reset" value="취소"/>
                    </form>
                </div>
            </center>
        </div>
    </div>
</body></html>