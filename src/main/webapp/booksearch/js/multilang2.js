$(function(){
	$(".multiLangBox").css({'top':"92px",'left':"206px",'right':"96px"});
	$(".fnInputBox input").focus(function(){		
		var inputId = $(this).attr("id");
		var inputNumber = inputId.substr(-1);
		multiLangPosition = 44 * inputNumber + 48;
	});
	
	//다국어입력기
	$("#multiLangBtn").click(function(){
		$(".multiLangBox").css({'top':multiLangPosition});
		$(".multiLangBox").toggle();
		return false;
	});
	$('.multiLangBox .multiLang ul.language li a').click(function() {
		$('.multiLangBox .multiLang ul.language li a').hasClass("selected");
		$('.multiLangBox .multiLang ul.language li a').removeClass("selected");
		$(this).addClass("selected");
		var multiLangIndex = $('.multiLangBox .multiLang ul.language li a').index($(this));
		$('.multiLangBox .multiLang .languageContents').hide();
		$('.multiLangBox .multiLang .languageContents').eq(multiLangIndex).show();
		return false;
	});
	$('.multiLangBox .multiLang ul.language li:first-child a').trigger('click');
	$('p.multiLangBox_close a').click(function() {
		$('.multiLangBox').hide();
		return false;
	});
	$(".multiLangBox").draggable();
});
