<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
<title>공지사항</title>
<link rel="shortcut icon" href="./image/common/ico_sns_favicon.png">
<link rel="stylesheet" type="text/css" href="./css/yslib/sub.css">
<link rel="stylesheet" type="text/css" href="./css/yslib/layout.css">
<link rel="stylesheet" type="text/css" href="./js/jquery-ui.min.css">
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./js/jquery.slider.js"></script>
<script type="text/javascript" src="./js/jquery.tab.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/jquery-ui.datepicker.js"></script>
<script type="text/javascript" src="./js/jquery.newsticker.js"></script>
<script type="text/javascript" src="./js/moment.min.js"></script>
<script type="text/javascript" src="./js/moment-ko.js"></script>
<script type="text/javascript" src="./js/jQuery.stringify.js"></script>
<script type="text/javascript" src="./js/gnb.js"></script>
<script type="text/javascript" src="./js/common.js"></script>
<script type="text/javascript" src="./js/regiForm.js"></script>
	
	

	

<script type="text/javascript">
	$(function(){
	eval("initMenu(4,1,0,0,0)");
	});
</script>
	

<script type="text/javascript">
var siteCd = "yslib";
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<form name="paramForm" id="paramForm" method="get">
	

<!--  default param -->
<input type="hidden" name="currentPageNo" value="1">

<input type="hidden" name="searchCategory" value="">
	<input type="hidden" name="manageCd" value="MF" />
	<input type="hidden" name="searchStatusCd" value="" />
	<input type="hidden" name="lectureIdx" value="0">
</form>
<!-- skip -->
<ul class="skip">
	<li><a href="#contentcore">본문 바로가기</a></li>
	<li><a href="#lnb">하위메뉴 바로가기</a></li>
</ul>
<!-- //skip -->
<!-- wrap -->
<div id="wrap">

	<div id="container" class="sub">
		<div class="contentGroup">
			
<div id="lnbNav" class="navArea">
	<h2>주메뉴</h2>
	<ul id="lnb" class="lnb"></ul>
</div>

			<div id="contentcore">
<div class="naviandtitle">
	<h3>페이지타이틀</h3>
	<div class="navi"></div>
	<div class="snsFarm">
	</div>
</div>
				<div id="contents" class="contentArea">

					<div class="loginWrap">
		<input type="hidden" id="chkval" value="0">
		<form action="./signUp.do" method="post" id="form" name="form">
					<input type="hidden" id="code" onclick="time()"><br>
					<input type="text" id="user_email" name="user_email" placeholder="아이디" required="required" >
					<input type="button" id="emailChk" onclick="idChk()" value="중복확인"><br>
					<span id="result"></span><br/>
					<input type="password" id="user_password" name="user_password" placeholder="비밀번호" required="required"><br>
					<span id="resultP"></span><br/>
					<input type="text" id="user_phone" name="user_phone" placeholder="전화번호" required="required" >
					<input type="button" onclick="timeAjax()" value="번호인증하기"><br><br>
					<input type="text" id="code2" placeholder="인증번호확인">
					<input type="button" onclick="vail()" value="확인"><br>	
					<input type="text" id="user_zip" name="user_zip" placeholder="우편번호" required="required" readonly="readonly" ><input type="button" value="주소찾기" onclick="goPopup()"><br>
					<input type="text" id="user_address" name="user_address" placeholder="도로명주소" required="required" readonly="readonly" ><br>
					<input type="text" id="user_detail" name="user_detail" placeholder="상세주소" required="required" ><br>
				<hr>
					<div class="loginDesc">
						<input type="submit" value="회원가입">
						<input type="button" value="돌아가기" onclick="back()">
					</div>
		</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //container -->
	

<!-- footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<!-- //footer -->



</div>
<!-- //wrap -->
</body>

</html>