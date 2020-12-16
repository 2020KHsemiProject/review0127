<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>REVIEW:0127</title>
    <!--외부 CSS-->
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/wrapper.css" rel="stylesheet" type="text/css" />
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
</head>

<body>
    <style>
		body {
 	   		background-color: #FFF6D6;
		}
    </style>
    <div id="wrapper">
        <div id="header">
            <div id="main_logo">
                <center>
                    <img src="/image/login/logo_dark.png" id="main_logo_img" />
                </center>
            </div>
        </div>
        <div id="content">
            <center>
                <div id="inner_content">
                    <form>
                        <input type="text" name="memberId" placeholder="아이디" class="input_group"/>
                        <span></span>
                        <br>
                        <input type="text" name="memberNickName" placeholder="닉네임" class="input_group"/>
                        <span></span>
                        <br>
                        <input type="password" name="memberPw" placeholder="비밀번호" id="input_pw" class="input_group"/>
                        <span></span>
                        <br>
                        <input type="password" name="memberPw_re" placeholder="비밀번호 확인" class="input_group"/>
                        <span></span>
                        <br>
                        <input type="email" name="memberEmail" placeholder="이메일 주소" class="input_group"/>
                        <span></span>
                        <br>
                        <span id="option_text">선택 입력 (예시. 1996 / 남)</span>
                        <br>
                        <input type="text" name="birthYear" placeholder="출생년도" class="input_group"/>
                        <button type="button" class="btn btn-outline-primary" name="gender" value="M">남</button>
                        <button type="button" class="btn btn-outline-primary" name="gender" value="F">여</button>
                        <br><br>
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