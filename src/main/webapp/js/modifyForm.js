function goPopup(){
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	document.form.user_address.value = roadAddrPart1;
	document.form.user_detail.value = addrDetail;
	document.form.user_zip.value = zipNo;
}


function timeAjax(){
	var time = new Date().getTime();
	var code = document.getElementById("code");
	var phone = document.getElementById("user_phone");
	var nphone = document.getElementById("new_phone");
	var regExp = /^[0-9]+$/;
	code.value = time;

	if(nphone.value==""){
		alert("변경할 휴대폰 번호를 입력하세요.");
	}else if(!regExp.test(nphone.value)){
		alert("숫자만 입력하세요.");
	}else if(nphone.value == phone.value){
		alert("변경할 휴대폰 번호를 입력하세요.");
	}
	else{
		$.ajax({
			url : "./doAjax.do",
			type : "post",
				async : false,
			data : "time="+time+"&phone="+nphone.value,
			success:function(msg){
				alert(msg);
				
				
			},
			error:function(){
				alert("실패!");
			}
		});	
	}
}


function vail(){
	var time = document.getElementById("code").value;
	var code = document.getElementById("code2").value;
	var nphone = document.getElementById("new_phone");
	var phone = document.getElementById("user_phone");
	$.ajax({
		url : "./timeChk.do",
		type : "post",
		async : false,
		data :"time="+time+"&code="+code+"&phone="+nphone.value,
		success:function(msg){
			alert(msg);
			phone.value = nphone.value;
			nphone.readOnly = true;
		},
		error:function(){
			alert("실패!");
		}
	});
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