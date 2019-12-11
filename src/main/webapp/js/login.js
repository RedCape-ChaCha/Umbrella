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
		var frm = document.getElementById("frm");
		
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
		}else{
			frm.action = "./login.do";
			frm.submit();
		}
	}

//전역변수
var cnt = 0;

//이미지리셋 버튼
function imgreset(){
	$.ajax({
		url : "./CaptReset.ajax",
		type: "post",
		async : false,
		success:function(msg){
			document.getElementById("capimg").src=msg;
			document.getElementById("captext").value="";
		},
		error:function(){
			alert("Error?");
		}
	});
}

$(function(){
	$("#cap").click(function(){
		var code = $(".code").val();
		var key = document.getElementById("capimg").src.split('=')[1];
		var wt = document.getElementById("wrongtime");
		var ct = document.getElementById("captext");
		$.ajax({
			url : "./CaptAuth.ajax",
			type: "post",
			async : false,
			data: "code="+code+"&key="+key,
			dataType : "JSON",
			success:function(msg){
				if(msg.result==true){
					wt.innerHTML = "일치합니다.";
					ct.disabled=true;
					document.getElementById("chk").value="clear";
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