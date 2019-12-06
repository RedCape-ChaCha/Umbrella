function loginCheck() {
		var id = document.getElementById("user_email");
		var pw = document.getElementById("user_password");
		var logoutArea = document.getElementById("logoutArea");
		var loginArea = document.getElementsByClassName("loginArea");
		var frm = document.forms[0];
		frm.action = "./login.do";
		
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
			jQuery.ajax({
				type: "post",
				url:"./loginCheckMap.do",
				data: "user_email="+id.value+"&user_password="+pw.value,
				success: function(msg){
					if (msg.isc == "성공") {
						document.getElementById("logoutArea").style.display = "block";
						document.getElementById("loginArea").style.display = "none";
						frm.submit();
					}else{
						alert("아이디나 비밀번호를 확인해 주세요");
					}
				},
				error: function() {
					alert("로그인에 문제가 발생함");
				}
			});
		}
	}