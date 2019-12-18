function goPopup(){
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	document.form.user_address.value = roadAddrPart1;
	document.form.user_detail.value = addrDetail;
	document.form.user_zip.value = zipNo;
}

function back(){
	location.href="./init.do";
}

$(document).ready(function(){
	$("#user_email").keyup(function(){
		var id="";
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		id = $(this).val();
		if(id.indexOf(" ") != -1){
			$("#result").css("color","red");
			$("#result").html("공백이 포함된 아이디는 사용하실 수 없습니다.");
			$("#chkval").val("0");
		}else if(!id.match(regExp)){
			$("#result").css("color","red");
			$("#result").html("이메일형식만 사용가능합니다.");
			$("#chkval").val("0");				
		}else{
			$("#result").css("color","red");
			$("#result").html("아이디 체크를 해주세요");
			$("#chkval").val("0");
		}
	});
	$("#user_password").keyup(function () {	
		var regExp=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		var inputLength=$(this).val().length;
		var password="";
		password=$(this).val();
		var pwOk = "";
		pwOk = $(this).val();
		if(password.indexOf(" ")!=-1){
			$("#resultP").css("color","red");
			$("#resultP").html("공백은 사용하실수 없습니다");
		}else if(inputLength>7){
			if(password.match(regExp)){			
			$("#resultP").css("color","red");
			$("#resultP").html(" 8자 이상 16자 이하, 소문자에 숫자하나 필수지만 대문자나 특수문자가 들어갈 수 있는 비밀번호");
			}else{
			$("#resultP").css("color","green");
			$("#resultP").html("사용가능한 비밀번호입니다 ");
			}		
		}else{
			$("#resultP").css("color","red");
			$("#resultP").html("8자리이상만 사용 가능 합니다");
		}
	});
});

function idChk() {
	var id=document.getElementById("user_email").value;
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(id==null||id==""){
		id.focus();
	}else if(!id.match(regExp)){
		$("#result").css("color","red");
		$("#result").html("이메일형식만 사용가능합니다.");
		$("#chkval").val("0");	
	}else{
		$.ajax({
			type:"post",
			url:"./emailChk.do",
			data:"user_email="+id,
			async:true,
			success:function(msg){
				if(msg.isc =="true"){
					$("#chkval").val("1");
					$("#result").css("color","green");
					$("#result").html("사용 가능한 아이디입니다");
				}else{
					$("#chkval").val("0");
					$("#result").css("color","red");
					$("#result").html("사용 불가능한 아이디입니다");
				}
			},
			error:function(){
				alert("잘못된 요청 값입니다");
			}
		});		
	}
}


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
	var pw = document.getElementById("user_password");
	var pwOk = document.getElementById("passOk");
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(email.value==""){
		alert("이메일을 입력해주세요..");
		email.focus();
		return false;
	}else if(regExp.test(!email.value)){
		alert("이메일형식으로 입력해주세요.");
		email.focus();
		return false;
	}else if(phone.value == ""){
		alert("전화번호를 입력해주세요..");
		phone.focus();
		return false;
	}else if(pw.value != pwOk.value){
		alert("비밀번호가 일치 하지 않습니다.");
		pw.focus();
		return false;
	}
	return true;
}