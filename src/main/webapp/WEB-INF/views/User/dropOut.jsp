<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<script type="text/javascript" src="./js/findForm.js"></script>


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
					<h2>
						<em>회원정보</em>
					</h2>
					<ul id="lnb" class="lnb">
						<li><a href="./login.modifyform.do" class="current">회원정보수정</a></li>
						<li><a href="./login.findPwForm.do">비밀번호변경</a></li>
						<li><a href="./login.userDelForm.do">회원탈퇴</a></li>
					</ul>
				</div>

				<div id="contentcore">

					<div class="naviandtitle">
						<h3>페이지타이틀</h3>
						<div class="navi"></div>
					</div>
					<div id="contents" class="contentArea">
						<h4 class="htitle">회원탈퇴</h4>
						<ul class="dot-list">
							<li>회원에서 탈퇴합니다.</li>
						</ul>
						<form name="registForm" id="registForm"
							action="./userUpdateDel.do" method="post"
							onsubmit="return submitCheck2()">
							<div class="findForm themeBD2 mt20">
								<div class="findArea info pd0">
									<div class="inpArea">
										<p>아이디</p>
										<div class="clearfix">
											<input type="text" id=user_email name="user_email"
												style="width: 145px;" value="${LDto.user_email }"
												required="required" readonly="readonly">
										</div>
									</div>
									<div class="inpArea">
										<p>비밀번호</p>
										<div class="clearfix">
											<input type="password" id="user_password"
												name="user_password" style="width: 145px;"
												required="required">
										</div>
									</div>
									<div class="btnArea ta_c mt20">
										<input type="submit" value="확인" class="btn wide themeBtn">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- //footer -->



	<!-- //wrap -->
</body>

</html>
