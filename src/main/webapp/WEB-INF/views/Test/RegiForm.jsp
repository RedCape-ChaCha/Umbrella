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
$(document).ready(function(){
	$("#id").keyup(function(){
		var inputLength = $(this).val().length;
		var id = $(this).val();
		var idReg = /^[a-zA-Z]+[a-zA-Z0-9]{0,19}$/g;
		// 공백이 없는 문자만 받으며 길이 5 이상
		if(id.indexOf(" ") != -1){
			$(this).val(id.slice(0, -1));
			alert("공백빼라")
		}else if(!idReg.test(id)){
			$("#idd").html("특문금지 ㅅㄱ");
		}else if(inputLength > 5){
			var id = document.getElementsByName("id")[0];
			$.ajax({
				url : "./idChk.ajax",
				type: "post",
				async : false,
				data: "id="+id.value,
				success:function(msg){
					if(msg == "ok"){
						$("#idd").html("사용가능");
					}else{
						$("#idd").html("사용불가");
					}
				},
				error:function(){
					alert("Error?");
				}
			});
		}else{
			$("#idd").html("");
		}
	});
});
</script>
<body>
<div class="container">
<h2 style="color: green;">Join</h2>
<form name= "form" id= "form" method= "post" action="./joinComplete.do" onsubmit="return join()">
	<input type="hidden" id="chkid" value="false">
	<div>
		<label for="text">아이디:</label> 
		<input id="idChkButton"  type="button" onclick="idChk()" value="중복확인">
		<input autocomplete="off" required="required" id="id" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요">
		<div style="color: red;" id="idd"></div>
	</div>
	<div>
		<label for="password">비밀번호:</label>
		<input required="required" name="pw" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
	</div>
	<div>
		<label for="password">비밀번호 재입력:</label>
		<input required="required" name="pw_comfrim" type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요">
	</div>
	<div>
		<label for="text">이름:</label>
		<input required="required" name="name" type="text" class="form-control" placeholder="이름을 입력하세요">
	</div>
	<div >
		<label for="text">전화번호:</label><p style="color: red; display: none;" id="comAuth"></p>
		<input id="authButton1" class="btn btn-sm btn-success btn-center" type="button" onclick="getAuthKey()" value="인증키 받기">
		<input id="authButton2" class="btn btn-sm btn-success btn-center" style="display: none;" type="button" onclick="Auth()" value="인증">
		<input required="required" id="phone" name="phone" type="text" class="form-control" maxlength="11" placeholder="전화번호를 입력하세요"><div style="height: 5px;"></div>
		<input name="phoneauth" id="phoneAuth" type="text" class="form-control" placeholder="인증번호를 입력하세요">
	</div>
	<div>
		<label for="address">주소: </label> <input class="btn btn-sm btn-success btn-center" type="button" value="주소찾기" onclick="goPopup()">
		<input required="required" id="zipNo"  name="zipNo" type="text" readonly="readonly" class="form-control" placeholder="우편번호"><div style="height: 5px;"></div>
		<input required="required" id="roadAddrPart1"  name="roadAddrPart1" name="email" readonly="readonly" type="text" class="form-control" placeholder="도로명주소"><div style="height: 5px;"></div>
		<input id="addrDetail"  name="addrDetail" name="email" type="text" class="form-control" placeholder="고객입력 상세 주소">
	</div>
	<div >
		<input type="submit" value="가입완료">
	</div>
</form>

</div>
</body>
</html>