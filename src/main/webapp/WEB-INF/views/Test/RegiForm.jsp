<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">


$(document).ready(function(){
	$("#user_email").keyup(function(){
		var inputLength = $(this).val().length;
		var id="";
		id = $(this).val();
		if(id.indexOf(" ") != -1){	
			$("#result").css("color","red");
			$("#result").html("공백이 포함된 아이디는 사용하실 수 없습니다.");
			$("#chkval").val("0");
		}else if(inputLength > 5){
			jQuery.ajax({
				type : "post",
				url : "./emailchk.do",
				data : "user_email="+$(this).val(),
				async : true,
				success : function(msg){
					if(msg.isc == "true"){
						$("#chkval").val("1");
						$("#result").html("사용가능한 아이디입니다.");
						$("#result").css("color","blue");
					}else{
						$("#chkval").val("0");
						$("#result").html("사용불가능한 아이디입니다.");
						$("#result").css("color","red");
					}
				},
				error : function(){
					alert("잘못된요청값입니다.");
				}
			});
		}else{
			$("#result").css("color","red");
			$("#result").html("6자리 이상만 사용 가능합니다.");
			$("#chkval").val("0");
		}
	});
});



</script>
<body>
		<input type="hidden" id="chkval" value="0">
<form action="./signUp.do" method="post" id="frm" name="frm" onsubmit="return check()">
	<div>
		<label for="text">아이디:</label>
		<input required="required" id="user_email" name="user_email" type="text" placeholder="아이디를 입력하세요">
		 <input id="idChkButton" type="button" value="중복확인" onclick="idChk()" >
		<div style="color: red;" id="idd"></div>
	</div>
	<div>
		<label for="password">비밀번호:</label>
		<input  type="password" name="user_password" required="required" placeholder="비밀번호를 입력하세요">
	</div>
	<div>
		<label for="password">비밀번호확인:</label>
		<input type="password" name="pw_comfrim" required="required"   placeholder="비밀번호를 다시 입력하세요">
	</div>
	<div>
		<label for="text">이름:</label>
		<input required="required" name="name" type="text" class="form-control" placeholder="이름을 입력하세요">
	</div>
	<div>
		<label for="text">전화번호:</label><p style="color: red; display: none;" id="comAuth"></p>
		<input required="required" id="phone" name="phone" type="text" class="form-control" maxlength="11" placeholder="전화번호를 입력하세요"><div style="height: 5px;"></div>
	</div>
	<div>
		<label for="address">주소: </label> <input class="btn btn-sm btn-success btn-center" type="button" value="주소찾기" onclick="goPopup()">
		<input required="required" id="zipNo"  name="zipNo" type="text" readonly="readonly" class="form-control" placeholder="우편번호"><div style="height: 5px;"></div>
		<input required="required" id="roadAddrPart1"  name="roadAddrPart1" name="email" readonly="readonly" type="text" class="form-control" placeholder="도로명주소"><div style="height: 5px;"></div>
		<input id="addrDetail"  name="addrDetail" name="email" type="text" class="form-control" placeholder="고객입력 상세 주소">
	</div>
	<div style="text-align: right">
		<input class="btn btn-sm btn-success btn-center" type="submit" value="가입완료">
	</div>
</form>
</body>
</html>