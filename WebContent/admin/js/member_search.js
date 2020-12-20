$(function(){
		
		
	
		var $option = $('select option');
		
		for(var i=0;i<3;i++){
		
		if(($option.eq(i).val())=="<%=category %>"){
			
			$option.eq(i).prop('selected','selected');
			
		}}
		
		var value= $('select option:selected').val();
		$('select[name=category]').val(value);
		
	$('.withdrawMember').submit(function(){
		
		var inform = $(this).children().eq(1).val()
		var $returnVal = window.confirm('['+inform+'] 님을 탈퇴처리 하겠습니까?');
		
		if($returnVal){
			return true;
		}else{
			return false;
		}
	
	})
	
	$('.restoreMember').submit(function(){
		
		var inform = $(this).children().eq(1).val()
		var $returnVal = window.confirm('['+inform+'] 계정을 복구 하겠습니까?');
		
		if($returnVal){
			return true;
		}else{
			return false;
		}
	
	})
	
	$allCheckbox = $('#all_select').children();

	$allCheckbox.click(function() {

		if ($allCheckbox.prop('checked') == true) {

			$('input:checkbox').prop('checked', true);

		} else {

			$('input:checkbox').prop('checked', false);
		}

	});

$('emailList').submit(
			function() {

				var $checkArr = new Array();

				$checkArr = $('input[name=send-select]:checked');

				var whereQuery = "";

				$.each($checkArr, function(index, item) {

					if (index == 0) {

						whereQuery = $(item).val();

					} else {

						whereQuery = whereQuery + "," + $(item).val();
					}

				});

				if (whereQuery == "") {

					return false;

				} else {

					if (confirm("선택 회원에게 인증 이메일을 전송하시겠습니까?") == true) {

						$('input[name=emailArr]').val(whereQuery);

						return true;

					} else {

						return false;
					}
				}

			});
	
	
	})	