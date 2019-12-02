<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function goPopup(){
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
	document.form.user_address.value = roadAddrPart1;
	document.form.user_detail.value = addrDetail;
	document.form.user_zip.value = zipNo;
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
			}else if(id.match(!regExp)){
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
		var id=document.getElementById("user_email");
		if(id.value==null||id.value==""){
			id.focus();
		}else{
			$.ajax({
				type:"post",
				url:"./emailChk.do",
				data:"user_email="+id.value,
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

</script>

<body>
		<input type="hidden" id="chkval" value="0">
		<form action="./signUp.do" method="post" id="form" name="form" >
					<input type="text" id="user_email" name="user_email" placeholder="아이디" required="required" >
					<input type="button" id="emailChk" onclick="idChk()" value="중복확인"><br>
					<span id="result"></span><br/>
					<input type="password" id="user_password" name="user_password" placeholder="비밀번호" required="required"><br>
					<span id="resultP"></span><br/>
					<input type="password" id="passOk" placeholder="비밀번호확인" required="required"><br>
					<input type="text" id="user_phone" name="user_phone" placeholder="전화번호" required="required" ><br>
					<input type="text" id="user_zip" name="user_zip" placeholder="우편번호" required="required" readonly="readonly" ><input type="button" value="주소찾기" onclick="goPopup()"><br>
					<input type="text" id="user_address" name="user_address" placeholder="도로명주소" required="required" readonly="readonly" ><br>
					<input type="text" id="user_detail" name="user_detail" placeholder="상세주소" required="required" ><br>
				<hr>
					<div id="button">
						<input type="submit" value="회원가입">
						<input type="button" value="돌아가기" onclick="javascript:history.back(-1)">
					</div>
		</form>
</body>
</html>