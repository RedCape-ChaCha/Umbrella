<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0">
<title>스마트 도서관</title>
<link rel="stylesheet" type="text/css" href="./css/yslib/sub.css">
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
<script type="text/javascript" src="./js/login.js"></script>

<script type="text/javascript">
	$(function() {
		eval("initMenu(4,1,0,0,0)");
	});

	//이미지리셋 버튼
	async function imgreset(){
		var url = "./CaptReset.do";
		await fetch(url).then(function (response){
			response.text().then(function (text){
				document.getElementById("capimg").src=text;
				document.getElementById("captext").value="";
			});
		})
	}
</script>


<script type="text/javascript">
	var siteCd = "yslib";
</script>
</head>
<body >
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<ul class="skip">
		<li><a href="#contentcore">본문 바로가기</a></li>
		<li><a href="#lnb">하위메뉴 바로가기</a></li>
	</ul>
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
					</div>
					<div id="contents" class="contentArea">
						<div class="loginWrap">
							<form method="post" id="frm">
								<div class="loginGroup clearfix">
									<div class="loginArea">
										<div class="inpArea">
											<label for="user_email" class="blind">아이디</label> <input
												type="text" id="user_email" name="user_email"
												placeholder="아이디" class="eng-mode">
										</div>
										<div class="inpArea">
											<label for="user_password" class="blind">비밀번호</label> <input
												type="password" id="user_password" name="user_password"
												placeholder="비밀번호" class="eng-mode" onkeyup="enterkey()">
										</div>
										<c:choose>
											<c:when test="${cnt>=5}">
											<input type="button" id="loginBtn" class="btnLogin themeBtn"
											title="로그인" value="로그인" onclick="loginCheckCap()">
											</c:when>
											<c:otherwise>
											<input type="button" id="loginBtn" class="btnLogin themeBtn"
											title="로그인" value="로그인" onclick="loginCheck()">
											</c:otherwise>
										</c:choose>
										
										<div class="checkArea clearfix">
											<a href="./findIdForm.do">아이디 찾기</a> <a
												href="./findPwForm.do">비밀번호 재발급</a> <a href="./regist.do">회원가입</a>
											<a href="https://kauth.kakao.com/oauth/authorize?client_id=4f9c3a9de712f1ec9ecc89bb51878062&redirect_uri=http://localhost:8090/Umbrella/ksign.do&response_type=code">카카오로그인</a>
										</div>
									</div>
								</div>
							</form>
							<form action="./CaptAuth.do" method="post" id="frm2">
								<input type="hidden" id="loginChk" name="auth" value="0">
									<c:if test="${cnt>=5}">
											<div class="form-group" style="text-align: center; margin-top:35px;">
												<img id="capimg" src="${Capimg}">
												 <a onclick="imgreset()"><img src="./image/button/reset.png"></a><br>
												<br> <input required="required" class="code"
													type="text" id="captext" placeholder="보이는 문자를 입력하세요">
												<input class="btn btn-sm btn-success btn-center"
													type="button" value="인증" id="cap"><br> <a
													id="wrongtime" style="color: red;"></a>
											</div>
										</c:if>
							</form>
							<div class="loginDesc">
								<ul class="dot-list">
									<li>로그인이 안되시는 경우 <span class="emp1">한/영 키</span> 또는 <span
										class="emp1">Caps Lock 키</span>가 눌러져 있는지 확인하세요.
									</li>
									<li>로그인 정보가 기억나지 않는 경우 아이디찾기 또는 비밀번호 재발급을 통해 확인하실 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</div>
</body>

</html>