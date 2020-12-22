/**
 * 
 */

$(function(){
		
		
		
		var $option = $('select option');
		
		for(var i=0;i<3;i++){
		
		if(($option.eq(i).val())=="<%=category %>"){
			
			$option.eq(i).prop('selected','selected');
			
		}}
		
		
		var value= $('select option:selected').val();
    	$('select[name=category]').val(value);
    	
    	
$('.deleteNotice').submit(function(){
    		
    		var inform = $(this).parents('tr').children().eq(2).text();
    		var $returnVal = window.confirm('['+inform+'] \n 글을 삭제하겠습니까?');
    		
    		if($returnVal){
    			return true;
    		}else{
    			return false;
    		}
    	
    	
    	
    	})
    	
    	
    	
    	
    	$('.restoreNotice').submit(function(){
    		
    		var inform = $(this).parents('tr').children().eq(2).text();
    		var $returnVal = window.confirm('['+inform+'] 글을 복구하겠습니까?');
    		if($returnVal){
    			return true;
    		}else{
    			return false;
    		}
    	

    	
    	})
    	
    	
    	$allCheckbox = $('#all_select').children();
    	
    	$allCheckbox.click(function(){
    		
    		
		if($allCheckbox.prop('checked')==true){
    			
    			$('input:checkbox').prop('checked', true);
    			
    		
    		}else{
    			
    			$('input:checkbox').prop('checked', false);
    		}
		
    	
    	});
    	
    	
    	
    	
    	$('#deleteNoticeList').submit(function(){
    		
    		var $checkArr = new Array();
    		
    		$checkArr = $('input[name=delete-select]:checked');
    		
    		var whereQuery = "";
    		
            $.each($checkArr,function(index,item){
                
				if(index==0){
					
					whereQuery = "notice_no = "+$(item).val();
					
				}else{
					
					whereQuery = whereQuery + " or notice_no = "+$(item).val();
				}
                
				                
            });
    	
            if(whereQuery==""){
            	
            	return false;
            	
            }else{
            	
            	if(confirm("선택된 글을 삭제하시겠습니까?")==true){
            		
            		$('input[name=noticeNoArr]').val(whereQuery);
            		
            		return true;
            		
            	}else{
            		
            		return false;
            	}
            }
    		
    	
    	
    	});
		
	
	})	