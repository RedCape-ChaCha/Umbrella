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
		eval("initMenu(3,1,0,0,0)");
	});

	var siteCd = "yslib";

	function milgCheck() {
		location.href = "./login.MilgUseHistory.do";
	}
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

						<div class="tabNav">
							<div class="virtSelect">
								<a href="#script">탭메뉴</a>
							</div>
							<ul class="tnb clearfix">
								<li></li>
							</ul>
						</div>
						<div class="myPageWrap">
							<div class="clearfix">
								<div class="myInfoBox pcVersion mobileHide">
									<div class="title">
										<strong class="name">${LDto.user_email}</strong>님, 반갑습니다.
									</div>
									<a href="./login.modifyform.do" class="btnModify">개인정보수정</a>
									<div class="myInfo">
										<div class="memType">
											<strong class="member typeA themeColor">정회원</strong>
										</div>
										<div class="myInfoList">
											<ul class="dot-list">
												<li>회원가입일 : ${LDto.user_regdate}</li>
												<li>휴대폰번호 : ${dto.user_phone} (SMS수신)</li>
												<li>마일리지 : ${mileage} <input type="button"
													class="btnMile" onclick="milgCheck()" value="확인하기"></li>
												<c:if test="${overChk == true }">
													<li style="color: red;">연체중(추가 대출불가)</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>

								<div class="myInfoBox mVersion mobileShow">


									<div class="title">
										<strong class="name">${LDto.user_email}</strong>님, 반갑습니다.

									</div>
									<a href="./modifyform.do" class="btnModify">개인정보수정</a>
									<div class="membership">
										<ul class="dot-list">
											<li>회원가입일 : ${LDto.user_regdate}</li>
											<li>휴대폰번호 : ${dto.user_phone} (SMS수신)</li>
											<li>마일리지 : ${mileage} <input type="button"
												class="btnMile" onclick="milgCheck()" value="확인하기"></li>
											<c:if test="${overChk == true }">
												<li style="color: red;">연체중(추가 대출불가)</li>
											</c:if>
										</ul>
									</div>
								</div>


								<h4 class="htitle">서비스 이용현황</h4>
								<ul class="myState clearfix">
									<li>
										<div>
											<strong class="tit">대출중인<br>도서
											</strong> <a href="./login.ownLoanList.do" class="num">${loanCount}</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">웹대출신청<br>도서
											</strong> <a href="./login.ownWebList.do" class="num">${applyCount}</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">예약중인<br>도서
											</strong> <a href="./login.ownResvList.do" class="num">${resvCount}</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">이전대출<br>도서
											</strong> <a href="./login.history.do" class="num">${historyCount}</a>
										</div>
									</li>
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
