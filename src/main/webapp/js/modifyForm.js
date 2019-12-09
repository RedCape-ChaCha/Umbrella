function goPopup(){
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	document.form.user_address.value = roadAddrPart1;
	document.form.user_detail.value = addrDetail;
	document.form.user_zip.value = zipNo;
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