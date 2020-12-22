function uploadImg() {
	var fileInfo = document.getElementById("input_file").files[0];
	var reader = new FileReader();
		reader.onload = function() {
			document.getElementById("profile_img").src = reader.result;
			document.getElementById("profile_form").submit();
        	};         
    if( fileInfo ) {
    	reader.readAsDataURL( fileInfo );
    }
}
$(function() {
	$('#img_del').click(function(){
		$('#profile_img').attr('src','/image/profile/default_user_dark.png');
	});
	$('#modify_pw_btn').click(
		function() {
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
							data : {"memberId" : memberId,"memberPwd" : memberPwd},
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
	$('#current_pwd').focusout(function() {
		$(this).css('border', '1.2px solid #ccc');
		$(this).next().text("");
	});
	$('#new_pwd').focusout(function() {
		$(this).css('border', '1.2px solid #ccc');
		$(this).next().text("");
	});
	$('#new_pwd_re').focusout(function() {
		$(this).css('border', '1.2px solid #ccc');
		$(this).next().text("");
	});
	
	$('#nick_check_re').click(function() {
		var nickName = $('#nick_change').val();

		$.ajax({
			url : "/nickCheck.rw",
			type : "post",
			data : {
				"nickName" : nickName
			},
			success : function(data) {
				if (!(/^[a-zA-z0-9가-힣]{1,10}$/.test(nickName))) {
					alert("닉네임을 다시 확인해주세요.");
					return false;
				}
				if (data == 'usable') {
					alert("사용 가능한 닉네임입니다.");
				} else {
					alert("이미 사용 중인 닉네임입니다.");
				}
			},
			error : function() {
				console.log("error");
			}
		});
	});
	$('#email_change_btn').click(function() {
		if($('#email_change_btn').text()=='이메일 변경'){
			$('#email_state_success').css('display', 'none');
			$('#email_state_lack').css('display', 'none');
			$('.email_confirm').css('display', 'block');
			$('.input-text_email').val("");
			$('#email_change_btn').text('변경 완료');
		} else {
			var email = $('#email_change').val();
			console.log(email);
			if(email_change==""){
				alert("이메일을 입력해주세요.");
			} else {
				$.ajax({
					url:"/emailChange.rw",
					type:"post",
					data:{"email":email},
					success:function(data){
						if(data=="success"){
							alert("이메일 변경이 완료되었습니다. 이메일을 다시 인증해주세요.");
							location.replace('/views/member/modify_info.jsp');
						} else {
							alert("이메일 변경이 정상적으로 처리되지 않았습니다.(지속적인 문제 발생 시 관리자에게 문의해주세요.)")
						}
					},
					error:function(){
						console.log("error");
					}
				});
			}
		}
	});
});
