$(function() {
	
 $(".mainmenu>li").mouseover(function() {
	 $(this).children(".submenu").stop().slideDown(); 
	 });
 
 $(".mainmenu>li").mouseleave(function() {
	 $(this).children(".submenu").stop().slideUp(); 
	 
	 });


$('.submenu>li>a').click(function(){
	$(this).css('background', '#dce5fe');
	$(this).css('color','#4d5ac8');
	$(this).css('display','fixed');
})
 });
