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
<title>회원가입</title>
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
	$(function() {
		eval("initMenu(4,4,0,0,0)");
	});
</script>


<script type="text/javascript">
	var siteCd = "yslib";
</script>
</head>
<body>
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
						<div class="snsFarm"></div>
					</div>
					<div id="contents" class="contentArea">
						<h4 class="htitle">회원가입</h4>
						<ul class="dot-list">
							<li>정보를 입력하고 회원에 가입합니다.</li>
						</ul>
						<input type="hidden" id="chkval" value="0">
						<form action="./signUp.do" method="post" id="form" name="form"
							onsubmit="return submitCheck()">
							<input type="hidden" id="code" onclick="time()"><br>
							<div class="findForm themeBD2 mt20">
								<div class="findArea info pd0">
									<div class="inpArea">
										<label for="userId">이메일</label> <input type="text"
											id="user_email" name="user_email" placeholder="이메일"
											required="required"> <input type="button"
											id="emailChk " onclick="idChk()" value="중복확인"
											class="btn wide themeBtn"><br> <span id="result"
											style="text-align: center !important;"></span><br />
									</div>
									<div class="inpArea">
										<label for="userPw">비밀번호</label> <input type="password"
											id="user_password" name="user_password" placeholder="비밀번호"
											required="required"><br> <span id="resultP"></span><br />
									</div>
									<div class="inpArea">
										<label for="userPwok"></label> <input type="password"
											id="passOk" name="passOk" placeholder="비밀번호확인"
											required="required"><br> <span id="resultP"></span><br />
									</div>
									<div class="inpArea">
										<label for="userPh">전화번호</label> <input type="text"
											id="user_phone" name="user_phone" placeholder="전화번호"
											required="required"> <input type="button"
											onclick="timeAjax()" value="번호인증하기" class="btn wide themeBtn"><br>
										<br>
									</div>
									<div class="inpArea">
										<label for="userph2"></label> <input type="text" id="code2"
											placeholder="인증번호확인"> <input type="button"
											onclick="vail()" value="확인" class="btn wide themeBtn"><br>
									</div>
									<div class="inpArea">
										<label for="userzip">주소</label> <input type="text"
											id="user_zip" name="user_zip" placeholder="우편번호"
											required="required" readonly="readonly"> <input
											type="button" value="주소찾기" onclick="goPopup()"
											class="btn wide themeBtn"><br>
									</div>
									<div class="inpArea">
										<label for="userzip2"></label> <input type="text"
											id="user_address" name="user_address" placeholder="도로명주소"
											required="required" readonly="readonly"><br>
									</div>
									<div class="inpArea">
										<label for="userzip3"></label> <input type="text"
											id="user_detail" name="user_detail" placeholder="상세주소"
											required="required"><br>
									</div>
									<hr>
									<div class="loginDesc"
										style="text-align: center !important; background-color: white !important;">
										<input type="submit" value="회원가입" class="btn wide themeBtn">
										<input type="button" value="돌아가기" onclick="back()"
											class="btn wide themeBtn">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>

</html>