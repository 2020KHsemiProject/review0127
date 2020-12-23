<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW:0127</title>
<!--외부 CSS-->
<link href="/views/css/header.css" rel="stylesheet" type="text/css" />
<link href="/views/css/modify.css" rel="stylesheet" type="text/css" />
<!--웹폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
	crossorigin="anonymous"></script>
<script src="/views/js/modify_info.js"></script>
<!--bootStrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<style>
* {
	margin: 0;
	padding: 0;
}
</style>
<script>
$(function() {	
	$('#modify_pwd_btn').click(function() {
		var memberId = $('#member_id').val();
		var sessionPwd = '<%=m.getMemberPwd()%>';
		var currentPwd = $('#current_pwd').val();
		var memberPwd = $('#new_pwd').val();
		var memberPwd_re = $('#new_pwd_re').val();
		var checkNumber = memberPwd.search(/[0-9]/g);
		var checkEnglish = memberPwd.search(/[a-z]/ig);
		if ((sessionPwd != currentPwd)) {
			$('#current_pwd').next().text("현재 비밀번호와 일치하지 않습니다.").css('color','red');
				return false;
		} else if (currentPwd == memberPwd) {
			$('#new_pwd').next().text("현재 비밀번호와 동일합니다.").css('color', 'red');
				return false;
		} else if (!(/^[a-zA-Z0-9]{8,16}$/.test(memberPwd))) {
			$('#new_pwd').next().text("비밀번호의 길이를 다시 확인해주세요.").css('color', 'red');
				return false;
		} else if (checkNumber < 0 || checkEnglish < 0) {
			$('#new_pwd').next().text("숫자와 영문자를 혼용하여 입력해주세요.").css('color', 'red');
				return false;
		} else if (memberPwd.search(memberId) > -1) {
			$('#new_pwd').next().text("비밀번호에 아이디가 포함되었습니다.").css('color', 'red');
				return false;
		} else if (/(\w)\1\1\1/.test(memberPwd)) {
			$('#new_pwd').next().text("같은 문자를 4번 이상 사용하실 수 없습니다.").css('color','red');
				return false;
		} else if ((memberPwd != memberPwd_re)) {
			$('#new_pwd_re').next().text("비밀번호가 동일하지 않습니다.")	.css('color', 'red');
				return false;
		} else {
			$.ajax({
				url : "/memberPwdChange.rw",
				type : "post",
				data : {"memberPwd" : memberPwd},
				success : function(data) {
					if (data == "complete") {
						alert("비밀번호 변경이 완료되었습니다.");
						location.replace('/views/member/modify_info.jsp');
					} else {
						alert("비밀번호 변경이 정상적으로 처리되지 못했습니다. 지속적인 문제 발생 시 관리자에게 문의해주세요.");
					}
				},
				error : function() {
					console.log("error");
				}
			});
		}
	});
});
</script>
</head>
<body>

	<div id="wrapper">
		<div id="content">
			<div id="content_title">
				<h1>회원 정보 수정</h1>
			</div>

			<center>
				<div id="content_main">
					<div id="inner_content">
						<div id="inner_content_first">
							<center>
								<div id="picture_box">
									<div id="profile_img_area">
										<form action="/profileUpload.rw" method="post"
											enctype="multipart/form-data" id="profile_form">
											<div id="image_box">
												<input type="hidden"> 
												<% if(m.getProfileImg()!=null) { %>
													<img src="/image/profile/<%= m.getProfileImg() %>" id="profile_img" />
												<% } else { %>
													<img src="/image/profile/default_user_dark.png" id="profile_img" />
												<% } %>
											</div>
											<label id="profile_change_btn"> 
												<input type="file" onChange="uploadImg();" accept="image/*" id="input_file" name="profileImg"/>
											</label>
										</form>
										<form action="/profileDel.rw" method="post" id="profile_del_form">
											<label id="profile_del_btn"> 
												<img src="/image/profile/picture_change_del.png" id="img_del" />
											</label>
										</form>
										<p id="profile_info">※ 프로필 사진은 100px X 100px 사이즈를 권장합니다.</p>

										<button type="button" class="btn btn-primary"
											id="withdraw_btn" data-toggle="modal" data-target="#myModal">회원탈퇴</button>
									</div>
								</div>
							</center>
						</div>
						<form action="/modifyInfo.rw" method="post">
						<div id="inner_content_second">
							<table class="modify_table">
								<tr class="tr_first">
									<th>아이디</th>
									<td><input type="text" id="member_id"
										value="<%=m.getMemberId()%>" name="memberId" readonly /></td>
								</tr>
								<tr class="tr_second">
									<th>닉네임</th>
									<td>
										<div class="input_group_nick">
											<div class="input_box_nick">
												<input type="text" class="input-text_nick" id="nick_change"
													value="<%=m.getNickname()%>" name="nickName" />
											</div>
											<button type="button" id="nick_check_re">중복확인</button>
										</div>
									</td>
								</tr>
								<tr class="tr_third">
									<th id="th_email">이메일</th>
									<td>
										<div class="input_group_email">
											<div class="input_box_email">
												<input type="email" class="input-text_email"
													value="<%=m.getEmail()%>" id="email_change" />
											</div>
											<button type="button" id="email_change_btn">이메일 변경</button>
										</div> <% if (m.getEmailYN() == 'Y') { %>
										<div id="email_state_success">
											<p id="email_success">
												<img src="/image/icon/email_success.png"
													id="email_success_img" /> 인증된 이메일 주소입니다.
											</p>
										</div> <% } else { %>
										<div id="email_state_lack">
											<p id="email_lack">
												<img src="/image/icon/email_lack.png" id="email_lack_img" />인증되지
												않은 이메일 주소입니다.
											</p>
										</div> <% } %>
										<p class="email_confirm">이메일을 인증하면, 변경이 완료됩니다.</p>
									</td>
								</tr>
								<tr class="tr_fourth">
									<th id="th_pw_re">비밀번호 재설정</th>
									<td>
										<%--<form action="/memberPwdChange.rw" method="post" --%>
											<div class="password_change_guide">
												<p class="guide_title">비밀번호 변경 시 유의사항</p>
												<ul class="guide_list_wrapper">
													<li class="guide_list">영문/숫자 조합으로 8자 이상, 16자 이하로
														입력해주세요.</li>
													<li class="guide_list">4자리 이상 연속된 동일 문자는 사용할 수 없습니다.</li>
													<li class="guide_list">ID가 포함된 비밀번호는 사용할 수 없습니다.</li>
												</ul>
											</div>
											<div class="password_row">
												<input type="password" class="modify_pwd" id="current_pwd"
													name="memberPwd" placeholder="현재 비밀번호" /> <span
													class="pw_warning_text"></span>
											</div>
											<div class="password_row">
												<input type="password" class="modify_pwd" id="new_pwd"
													name="memberPwd_new" placeholder="새 비밀번호" /> <span
													class="pw_warning_text"></span>
											</div>
											<div class="password_row">
												<input type="password" class="modify_pwd" id="new_pwd_re"
													name="memberPwd_new_re" placeholder="새 비밀번호 확인" /> <span
													class="pw_warning_text"></span>
											</div>
											<div class="password_row">
												<button type="button" id="modify_pwd_btn">비밀번호 변경</button>
												<%--<button type="submit" id="modify_pw_btn">비밀번호 변경</button>--%>
											</div>
									</td>
								</tr>
								<tr class="tr_fifth">
									<th id="th_sub">추가 정보 입력</th>
									<td>
										<div id="sub_option">
											<span id="age_title">연령대</span> <input type="text"
												name="birthYear" value="<%=m.getBirthYear()%>" size="5" id="age" />
											<div class="btn-group btn-group-toggle" data-toggle="buttons">
												<span id="gender_title">성별</span>
												<label class="btn btn-warning radio_size" id="label_M">
													<input type="radio" name="gender" id="radio_M" value="M">남
												</label>
												<label class="btn btn-warning radio_size" id="label_F">
													<input type="radio" name="gender" id="radio_F" value="F">여
												</label>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div id="inner_content_third">
							<input type="submit" id="modify_submit" value="수정"/>
						</div>
					</form>
					</div>
				</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">회원탈퇴</h4>
					</div>
					<div class="modal-body">
						<div>
							<p class="withdraw_guide">※ 탈퇴 안내</p>
							<p class="withdraw_guide_text">1. 탈퇴 후 동일 아이디로는 재가입이 불가능합니다.</p>
							<ul class="withdraw_ul">
								<li class="withdraw_list">- 입력하신 정보는 회원탈퇴 이외의 목적으로<br>사용되지
									않습니다.
								</li>
								<li class="withdraw_list">- 아이디 외, 동일 이메일은 사용 가능합니다.</li>
							</ul>
							<p class="withdraw_guide_text">2. 작성한 게시글은 탈퇴 후 삭제되지 않습니다.</p>
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
						<form action="/memberWithdraw.rw" method="post"
							class="withdraw_form">
							<input type="checkbox" name="withdrawAgree" id="withdraw_check"
								required /> <span id="check_text">해당 내용을 모두 확인했으며, 회원
								탈퇴에 동의합니다.</span><br> <input type="submit" name="withdrawOK"
								value="회원탈퇴" id="check_submit" />
						</form>
					</div>
				</div>
			</div>
		</div>
		</center>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>