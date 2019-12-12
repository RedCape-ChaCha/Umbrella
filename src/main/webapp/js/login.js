//엔터키막기
$("#cap").keydown(function (event)
		{
	if (event.keyCode == '13') {
		if (window.event)
		{
			event.preventDefault();
			return;
		}
	}
});

//엔터키
function enterkey() {
        if (window.event.keyCode == 13) {
        	loginCheck();
        }
}




//로그인 유효값확인
function loginCheck() {
		var id = document.getElementById("user_email");
		var pw = document.getElementById("user_password");
		var capt = document.getElementById("captext");
		var frm = document.getElementById("frm");
		var check = document.getElementById("loginChk").value;
		
		var result = "";
		if (id.value == null || id.value.trim() == "") {
			id.focus();
			$("#user_email").val("");
			alert("아이디를 입력해 주세요");
		}	 
		else if (pw.value == null || pw.value.trim() == "") {
			pw.focus();
			$("#user_password").val("");
			alert("비밀번호를 입력해 주세요");
		}else {
			frm.action = "./login.do";
			frm.submit();
		}
	}
//캡챠로그인
function loginCheckCap() {
	var id = document.getElementById("user_email");
	var pw = document.getElementById("user_password");
	var capt = document.getElementById("captext");
	var frm = document.getElementById("frm");
	var check = document.getElementById("loginChk").value;
	
	var result = "";
	if (id.value == null || id.value.trim() == "") {
		id.focus();
		$("#user_email").val("");
		alert("아이디를 입력해 주세요");
	}	 
	else if (pw.value == null || pw.value.trim() == "") {
		pw.focus();
		$("#user_password").val("");
		alert("비밀번호를 입력해 주세요");
	}else if(check == "clear"){
		frm.action = "./login.do";
		frm.submit();
	}else{
		document.getElementById("wrongtime").innerHTML = "캡챠 인증을 해주세요.";
		document.getElementById("captext").focus();
	}
}

//인증번호확인
$(function(){
	$("#cap").click(function(){
		var code = $(".code").val();
		var key = document.getElementById("capimg").src.split('=')[1];
		var wt = document.getElementById("wrongtime");
		var ct = document.getElementById("captext");
		$.ajax({
			url : "./CaptAuth.do",
			type: "post",
			async : false,
			data: "code="+code+"&key="+key,
			dataType : "JSON",
			success:function(msg){
				if(msg.result==true){
					wt.innerHTML = "일치합니다.";
					ct.disabled=true;
					document.getElementById("loginChk").value="clear";
					ct.attr("readonly","readonly");
				}else{
					wt.innerHTML = "틀렸습니다.";
					ct.value="";
					ct.focus();
					imgreset();
				}
			},
			error:function(){
				alert("Error");
			}
		});
	});
});