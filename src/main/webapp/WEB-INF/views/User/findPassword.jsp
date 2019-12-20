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
<title>역삼도서관</title>
<link rel="shortcut icon" href="./image/common/ico_sns_favicon.png">
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
		eval("initMenu(4,3,0,0,0)");
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
					</div>
					<div id="contents" class="contentArea">
						<h4 class="htitle">비밀번호 재발급</h4>
						<ul class="dot-list">
							<li>가입된 회원정보로 회원 비밀번호를 재설정 합니다.</li>
						</ul>
						<c:choose>
							<c:when test="${error eq true }">
								<div class="findForm themeBD2 mt20">
									<div class="findArea info pd0">
										<div class="inpArea">
											<p style="color: red;">검색된 아이디 혹은 전화번호가 없습니다.</p>
										</div>
										<div class="btnArea ta_c mt20">
											<input type="button" value="재검색"
												onclick="javascript:location.href='./findPwForm.do'" class="btn wide themeBtn">
										</div>
									</div>
								</div>
							</c:when>
							<c:when test="${findPw ne null}">
								<form name="registForm" id="registForm" action="./pwUpdate.do"
									method="post">
									<div class="findForm themeBD2 mt20">
										<div class="findArea info pd0">
											<div class="inpArea">
												<label for="userId">이메일</label> <input type="text"
													value="${findPw.user_email}" name="user_email"
													id="user_email" class="form-ele fid">
											</div>
											<div class="inpArea">
												<label for="handphone1">비밀번호변경</label>
												<div class="clearfix">
													<input type="password" id="user_password"
														name="user_password" style="width: 145px;" class="btn wide themeBtn">
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="submit" value="확인" class="btn wide themeBtn">
											</div>

										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<form name="registForm" id="registForm"
									action="./passwordFind.do" method="post"
									onsubmit="return submitCheck()">
									<div class="findForm themeBD2 mt20">
										<div class="findArea info pd0">
											<div class="inpArea">
												<label for="userId">이메일</label> <input type="text"
													name="user_email" id="user_email" class="form-ele fid"
													required="required">
											</div>
											<div class="inpArea">
												<label for="handphone1">휴대폰번호</label>
												<div class="clearfix">
													<input type="text" id="user_phone" name="user_phone"
														style="width: 145px;" required="required"> <input
														type="button" onclick="timeAjax()" value="번호인증하기" class="btn wide themeBtn"><br>
													<br> <input type="hidden" id="code" onclick="time()" ><br>
													<p>인증번호확인</p>
													<input type="text" id="code2"> <input type="button"
														onclick="vail()" value="확인" class="btn wide themeBtn"><br>
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="submit" value="확인" class="btn wide themeBtn">
											</div>

										</div>
									</div>
								</form>
							</c:otherwise>
						</c:choose>

						<!-- End Of the Real Contents-->
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- //footer -->



	</div>
	<!-- //wrap -->
</body>

</html>
