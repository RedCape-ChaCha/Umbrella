$(function(){
	//다국어입력기
	$("#multiLangBtn").click(function(){
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
