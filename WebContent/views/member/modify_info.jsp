<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>REVIEW:0127</title>
    <!--외부 CSS-->
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <!-- <link href="./css/wrapper.css" rel="stylesheet" type="text/css" /> -->
    <link href="../css/modify.css" rel="stylesheet" type="text/css" />
    <!--웹폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <!--bootStrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>

<body>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #footer {
            background-color: #2A303D;
            height: 100px;
            text-align: center;
            line-height: 100px;
        }

        #footer span {
            color: white;
        }
    </style>

    <div id="wrapper">
        <div id="header">
            <div id="gnb-wrap">
                <div id="logo"><a href="/index.jsp"><img src="/image/logo.png" alt=""></a></div>
                <ul id="gnb">
                    <li><a href="/views/review/review_list.jsp">리뷰</a></li>
                    <li><a href="/views/library/review_note.jsp">서재</a></li>
                    <li><img id="user-menu-btn" src="/image/profile/default_user.png" alt=""></li>
                </ul>
            </div>
            <ul id="menu-bar">
                <li><a href="/views/member/login.jsp">로그인</a></li>
                <li><a href="/views/member/memberJoin.jsp">회원가입</a></li>
                <li><a href="/views/member/modify_info.jsp">회원정보수정</a></li>
                <li><a href="/views/service_center/customer_center.jsp">고객센터</a></li>
            </ul>
        </div>
        <script>
            $(function() {
                $('#user-menu-btn').click(function() {
                    if ($('#menu-bar').css('display') == 'none') {
                        $('#menu-bar').css('display', 'block');
                    } else {
                        $('#menu-bar').css('display', 'none');
                    }
                });
                $('#input_file').click(function(){
                	$('#profile_img').css('display','none');
                });
            });
        </script>

        <div id="content">
            <div id="content_title">
                <h1>회원 정보 수정</h1>
            </div>
		
            <div id="content_main">
                <center>
                    <div id="inner_content">
                        <div id="inner_content_first">
                            <div id="picture_box">
                                <div id="profile_img_area">
                                    <div id="image_box">
                                        <!--사진을 업로드하면 이미지를 diplay:none 설정-->
                                        <img src="/image/profile/profile.png" id="profile_img" />
                                    </div>
                                    <label id="profile_change_btn"><input type="file" accept="image/" id="input_file" /></label>
                                    <center>
                                        <p id="profile_info">※ 프로필 사진은 100px X 100px 사이즈를 권장합니다.</p>
                                    </center>
                                    <button type="button" class="btn btn-primary" id="withdraw_btn" data-toggle="modal" data-target="#myModal">회원탈퇴</button>
                                </div>
                            </div>
                        </div>
                        <div id="inner_content_second">
                            <table class="modify_table">
                                <tr class="tr_first">
                                    <th>아이디</th>
                                    <td><span class="user_id">abc1234</span></td>
                                </tr>
                                <tr class="tr_second">
                                    <th>닉네임</th>
                                    <td>
                                        <div class="input_group_nick">
                                            <div class="input_box_nick">
                                                <input type="text" class="input-text_nick" value="개똥이" />
                                            </div>
                                            <button type="button">중복확인</button>
                                            <span class="exp_complete">사용 가능한 닉네임입니다.</span>
                                            <!-- <span class="exp_lack">이미 존재하는 닉네임입니다.</span>-->
                                        </div>
                                    </td>
                                </tr>
                                <tr class="tr_third">
                                    <th id="th_email">이메일</th>
                                    <td>
                                        <div class="input_group_email">
                                            <div class="input_box_email">
                                                <input type="text" class="input-text_email" value="abc1234@abc.com" />
                                            </div>
                                            <button type="button">이메일 변경</button>
                                        </div>
                                        <div class="email_state">
                                            <p class="email_success">
                                                <img src="/image/modify_information/email_success.png" />
                                                인증된 이메일 주소입니다.
                                            </p>

                                        </div>
                                        <!--<div class="email_state_1">
                                        <p class="email_lack">
                                            <img src="../../image/modify_information/email_lack.png" />
                                            인증되지 않은 이메일 주소입니다.
                                        </p>
                                    </div>
                                    <p class="email_confirm">
                                        이메일 주소를 인증하시면, 변경이 완료됩니다.
                                    </p>-->
                                    </td>
                                </tr>
                                <tr class="tr_fourth">
                                    <th id="th_pw_re">비밀번호 재설정</th>
                                    <td>
                                        <form id="password_form" method="post" action="/modify.do">
                                            <div class="password_change_guide">
                                                <p class="guide_title">비밀번호 변경 시 유의사항</p>
                                                <ul class="guide_list_wrapper">
                                                    <li class="guide_list">영문/숫자 조합으로 8자 이상, 16자 이하로
                                                        입력해주세요.</li>
                                                    <li class="guide_list">3자리 이상 연속된 문자는 사용할 수 없습니다.</li>
                                                    <li class="guide_list">ID와 동일한 비밀번호는 사용할 수 없습니다.</li>
                                                </ul>
                                            </div>
                                            <div class="password_row">
                                                <input type="password" class="modify_pwd" id="modify_current_pw" name="userPw" placeholder="현재 비밀번호" /> <span class="pw_warning_text">
                                                    현재 비밀번호와 일치하지 않습니다. </span>
                                            </div>
                                            <div class="password_row">
                                                <input type="password" class="modify_pwd" id="modify_new_pw" name="userPw_new" placeholder="새 비밀번호" /> <span class="pw_warning_text">
                                                    비밀번호 유의사항을 확인해주세요. </span>
                                            </div>
                                            <div class="password_row">
                                                <input type="password" class="modify_pwd" id="modify_new_pw_confirm" name="userPw" placeholder="새 비밀번호 확인" /> <span class="pw_warning_text"> 비밀번호가 일치하지 않습니다. </span>
                                            </div>
                                            <div class="password_row">
                                                <button type="submit" id="modify_pw_btn">비밀번호 변경</button>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                                <tr class="tr_fifth">
                                    <th id="th_sub">추가 정보 입력 <br>(선택사항)
                                    </th>
                                    <td>
                                        <form>
                                            <div id="sub_option">
                                                <span id="age_title">연령대</span>
                                                <input type="text" name="age" placeholder="예)1996" size="5" id="age" />
                                                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                    <span id="gender_title">성별</span>
                                                    <button type="button" class="btn btn-secondary" id="man">남</button>
                                                    <button type="button" class="btn btn-secondary" id="woman">여</button>
                                                </div>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="inner_content_third">
                            <button type="button">수정</button>
                        </div>
                    </div>
                </center>
            </div>

        </div>

        <div id="footer">
            <span>Copyright © 2020 REVIEW:0127 All rights reserved.</span>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">회원탈퇴</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <p class="withdraw_guide">※ 탈퇴 안내</p>
                            <p class="withdraw_guide_text">1. 탈퇴 후 동일 아이디로는 재가입이
                                불가능합니다.</p>
                            <ul class="withdraw_ul">
                                <li class="withdraw_list">- 입력하신 정보는 회원탈퇴 이외의 목적으로<br>사용되지
                                    않습니다.
                                </li>
                                <li class="withdraw_list">- 아이디 외, 동일 이메일은 사용 가능합니다.</li>
                            </ul>
                            <p class="withdraw_guide_text">2. 작성한 게시글은 탈퇴 후 삭제되지
                                않습니다.</p>
                            <ul class="withdraw_ul">
                                <li class="withdraw_list">- 리뷰 및 커뮤니티 게시판 등 모든 게시글은<br>탈퇴
                                    후에도 유지됩니다.
                                </li>
                                <li class="withdraw_list">- 해당 게시물에 대한 삭제를 원하는 경우, <br>탈퇴
                                    전에 모두 삭제해주세요.
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <form class="withdraw_form">
                            <input type="checkbox" name="withdrawAgree" id="withdraw_check" /> 
                            <span id="check_text">해당 내용을 모두 확인했으며, 회원 탈퇴에 동의합니다.</span><br> 
                            <input type="submit" name="withdrawOK" value="회원탈퇴" id="check_submit" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>