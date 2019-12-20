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


<script type="text/javascript">
	$(function() {
		eval("initMenu(4,2,0,0,0)");
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
						<h4 class="htitle">아이디찾기</h4>
						<ul class="dot-list">
							<li>가입된 회원정보로 회원 아이디를 확인합니다.</li>
						</ul>

						<form name="idFindForm" id="idFindForm" action="./findId.do"
							method="post">
							<div class="findForm themeBD2 mt20">
								<div class="findArea info pd0">
									<c:choose>
										<c:when test="${id ne null}">
											<div class="inpArea">
												<label for="handphone1">아이디</label>
												<div class="clearfix">
													<input type="text" id="user_phone" name="user_phone"
														value="${id}" readonly="readonly" style="width: 145px;">
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="button" value="로그인하러가기"
													onclick="javascript:location.href='./init.do'" class="btn wide themeBtn">
											</div>
										</c:when>
										<c:when test="${error eq true }">
											<div class="inpArea">
												<div class="clearfix">
													<p style="color: red;">매칭된 아이디가 없습니다.</p>
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="button" value="재검색"
													onclick="javascript:location.href='./findIdForm.do'" class="btn wide themeBtn">
											</div>
										</c:when>
										<c:otherwise>
											<div class="inpArea">
												<label for="handphone1">휴대폰번호</label>
												<div class="clearfix">
													<input type="text" id="user_phone" name="user_phone"
														style="width: 145px;">
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="submit" value="확인" class="btn wide themeBtn">
											</div>
										</c:otherwise>
									</c:choose>
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
