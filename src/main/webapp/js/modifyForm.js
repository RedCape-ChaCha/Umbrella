function goPopup(){
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	document.form.user_address.value = roadAddrPart1;
	document.form.user_detail.value = addrDetail;
	document.form.user_zip.value = zipNo;
}

function time(){
	var time = new Date().getTime();
	var code = document.getElementById("code");
	code.value = time;
	location.href="http://localhost:8087/Umbrella_Batch/send.do?time="+time+"&phone=01055231605";
}

function timeAjax(){
	var time = new Date().getTime();
	var code = document.getElementById("code");
	var phone = document.getElementById("user_phone");
	code.value = time;
	if(phone.value==""){
		alert("변경할 휴대폰 번호를 입력하세요.");
	}
	$.ajax({
		url : "./doAjax.do",
		type : "post",
			async : false,
		data : "time="+time+"&phone="+phone,
		success:function(msg){
			alert(msg);
		},
		error:function(){
			alert("실패!");
		}
	});
}


function vail(){
	var time = document.getElementById("code").value;
	var code = document.getElementById("code2").value;
	location.href="./timeChk.do?time="+time+"&code="+code;
	
}

	function submitCheck(){
		var zip = documnet.getElementById("user_zip");
		var add = document.getElementById("user_address");
		var detail = document.getElementById("user_detail");
		var phone = document.getElementById("user_phone");
		
		if(add.value == "" || zip.value=="" || detail.value == ""){
			alert("주소를 입력해주세요..");
			detail.focus();
			return false;
		}else if(phone.value == ""){
			alert("전화번호를 입력해주세요..");
			phone.focus();
			return false;
		}
		return true;
	}