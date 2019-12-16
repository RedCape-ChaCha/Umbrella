
function timeAjax(){
	var time = new Date().getTime();
	var code = document.getElementById("code");
	var phone = document.getElementById("user_phone");
	var regExp = /^[0-9]+$/;
	code.value = time;

	if(phone.value==""){
		alert("휴대폰 번호를 입력하세요.");
	}else if(!regExp.test(phone.value)){
		alert("숫자만 입력하세요.");
	}
	else{
		$.ajax({
			url : "./doAjax.do",
			type : "post",
				async : false,
			data : "time="+time+"&phone="+phone.value,
			success:function(msg){
				alert(msg);
			},
			error:function(){
				alert("실패다!");
			}
		});	
	}
}


function vail(){
	var time = document.getElementById("code").value;
	var code = document.getElementById("code2").value;
	var phone = document.getElementById("user_phone");
	$.ajax({
		url : "./timeChk.do",
		type : "post",
		async : false,
		data :"time="+time+"&code="+code+"&phone="+phone.value,
		success:function(msg){
			alert(msg);
		},
		error:function(){
			alert("실패!");
		}
	});
}

	function submitCheck(){
		var email = document.getElementById("user_email");
		var phone = document.getElementById("user_phone");
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(email.value==""){
			alert("이메일을 입력해주세요..");
			email.focus();
			return false;
		}else if(!regExp.test(email.value)){
			alert("이메일형식으로 입력해주세요.");
			email.focus();
			return false;
		}else if(phone.value == ""){
			alert("전화번호를 입력해주세요..");
			phone.focus();
			return false;
		}
		return true;
	}