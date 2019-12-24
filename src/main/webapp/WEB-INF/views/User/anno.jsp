<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안내사항</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/popup.js"></script>
<script type="text/javascript">
	function closePopup(){
	    window.close();
	}
	function closePopupToday(){                 
	    setCookie('todayClose','Y', 1);
	    window.close();
	}
</script>
<body>
접속 가능한 계정 정보<br>
회원 : testuser@user.com / testuser<br>
관리자 : testadmin@admin.com / testadmin<br>

현재 OTP 인증키 발급은 SMS 발송시 금액이 부가되는 관계로<br>
alert 창으로 대체합니다.<br>
지식관리시스템은 현재 이용 불가능합니다.<br>
<br>
    <a href="javascript:closePopup();">닫기</a>
    <a href="javascript:closePopupToday()">오늘하루열지않기</a>
</body>
</html>