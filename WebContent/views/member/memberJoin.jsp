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
    <script src="/views/js/memberJoin.js"></script>
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
                        <button type="button" id="nick_check">중복확인</button>
                        <br> 
                        <span class="guide_span"></span><br>                       
                        <input type="password" name="memberPwd" placeholder="비밀번호" id="input_pw" class="input_group"/>
                        <br>
                        <span class="guide_span"></span><br>
                        <input type="password" name="memberPwd_re" placeholder="비밀번호 확인" class="input_group"/>
                        <br> 
                        <span class="guide_span"></span><br>                 
                        <input type="email" name="email" placeholder="이메일 주소" class="input_group"/>
                        <button type="button" id="email_check">중복확인</button>
                        <br>
                        <%--<p id="option_text">선택 입력 (예시. 1996 / 남)</p> --%>        
                        <input type="number" name="birthYear" placeholder="출생년도" class="input_group" min="1900" max="2020"/>
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-warning radio_size" id="label_M">
								<input type="radio" name="gender" id="radio_M" value="M">남
							</label>
							<label class="btn btn-warning radio_size" id="label_F">
								<input type="radio" name="gender" id="radio_F" value="F">여
							</label>
						</div>
                        <br>
                        <div id="option_data">
                        	<span id="data_agree">개인 정보 제공 및 활용 동의</span><input type="checkbox" name="agreement" value="동의" required/>
                        </div>
                        <br><br>
                        <input type="submit" value="회원가입"/><br>
                        <input type="reset" value="취소"/>
                    </form>
                </div>
            </center>
        </div>
    </div>
</body></html>