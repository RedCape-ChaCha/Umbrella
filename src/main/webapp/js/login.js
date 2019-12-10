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

