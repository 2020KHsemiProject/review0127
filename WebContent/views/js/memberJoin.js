$(function() {
	var idCheckClick;
	var nickCheckClick;
	$('form').submit(
			function() {
				var memberId = $('input[name=memberId]');
				var nickName = $('input[name=nickName]');
				var memberPwd = $('input[name=memberPwd]');
				var memberPwd_re = $('input[name=memberPwd_re]');
				var email = $('input[name=email]');
				var birthYear = $('input[name=birthYear]');
				var gender = $('input[name=gender]');
				var checkNumber = memberPwd.val().search(/[0-9]/g);
				var checkEnglish = memberPwd.val().search(/[a-z]/ig);

				console.log(memberId.val() + "/" + nickName.val() + "/"
						+ memberPwd.val() + "/" + memberPwd_re.val() + "/"
						+ email.val() + "/" + birthYear.val() + "/"
						+ gender.val());

				if (!(/^[a-zA-Z0-9]{5,20}$/.test(memberId.val()))) {
					memberId.prev().prev().text("아이디를 다시 확인해주세요.").css('color',
							'red');
					return false;
				} else if (!(/^[a-zA-z0-9가-힣]{1,10}$/.test(nickName.val()))) {
					nickName.prev().prev().text("닉네임을 다시 확인해주세요.").css('color',
							'red');
					return false;
				} else if (!(/^[a-zA-Z0-9]{8,16}$/.test(memberPwd.val()))) {
					memberPwd.prev().prev().text("비밀번호의 길이를 다시 확인해주세요.").css(
							'color', 'red');
					return false;
				} else if (checkNumber < 0 || checkEnglish < 0) {
					memberPwd.prev().prev().text("숫자와 영문자를 혼용하여 입력해주세요.").css(
							'color', 'red');
					return false;
				} else if (memberPwd.val().search(memberId.val()) > -1) {
					memberPwd.prev().prev().text("비밀번호에 아이디가 포함되었습니다.").css(
							'color', 'red');
					return false;
				} else if (/(\w)\1\1\1/.test(memberPwd.val())) {
					memberPwd.prev().prev().text("같은 문자를 4번 이상 사용하실 수 없습니다.")
							.css('color', 'red');
					return false;
				} else if ((memberPwd.val() != memberPwd_re.val())) {
					memberPwd_re.prev().prev().text("비밀번호가 동일하지 않습니다.").css(
							'color', 'red');
					return false;
				} else if (idCheckClick != true) {
					alert("아이디의 중복 여부를 확인해주세요.");
					return false;
				} else if (nickCheckClick != true) {
					alert("닉네임의 중복 여부를 확인해주세요.");
					return false;
				}
				return true;
			});

	$('input[name]').focusin(
			function() {
				$(this).css('border', '5px solid yellowgreen');
				switch ($(this).attr('name')) {
				case "memberId":
					$(this).prev().prev().text("영문자와 숫자 조합 5~20 글자여야 합니다.")
							.css('color', '#517800');
					break;
				case "nickName":
					$(this).prev().prev().text("영문자와 숫자,한글 조합 최대10글자까지 입니다.")
							.css('color', '#517800');
					break;
				case "memberPwd":
					$(this).prev().prev().text("영문자와 숫자 조합 8~16 글자여야 합니다.")
							.css('color', '#517800');
					break;
				case "memberPwd_re":
					$(this).prev().prev().text("비밀번호를 한 번 더 입력해주세요.").css(
							'color', '#517800');
					break;
				case "email":
					$(this).prev().prev().text(
							"이메일 형식으로 입력해주세요. ex)abc123@abc.com").css('color',
							'#517800');
					break;
				}
			});
	$('input[name]').focusout(function() {
		$(this).css('border', '1.2px solid #ccc');
		$(this).prev().prev().text("");
	});

	$('#id_check').click(function() {
		idCheckClick = true;
		var memberId = $('input[name=memberId]').val();

		if (memberId == "") {
			alert("아이디를 입력해주세요.");
		} else {
			$.ajax({
				url : "/idCheck.rw",
				type : "post",
				data : {
					"memberId" : memberId
				},
				success : function(data) {
					if (!(/^[a-zA-Z0-9]{5,20}$/.test(memberId))) {
						alert("아이디를 다시 확인해주세요.");
						return false;
					}
					if (data == 'usable') {
						alert("사용 가능한 아이디입니다.");
					} else {
						alert("이미 사용 중인 아이디입니다.");
					}
				},
				error : function() {
					console.log("error");
				}
			}); // end of ajax
		} // end of else
	}); // end of click   

	$('#nick_check').click(function() {
		nickCheckClick = true;
		var nickName = $('input[name=nickName]').val();

		if (nickName == "") {
			alert("닉네임을 입력해주세요.");
		} else {
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
			}); // end of ajax	
		} // end of else    			
	}); // end of click
}); // end of function
