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


<script type="text/javascript">
	$(function() {
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
		<input type="hidden" name="currentPageNo" value="1"> <input
			type="hidden" name="searchCategory" value=""> <input
			type="hidden" name="manageCd" value="MF" /> <input type="hidden"
			name="searchStatusCd" value="" /> <input type="hidden"
			name="lectureIdx" value="0">
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
							<ul class="snsBtnArea clearfix">
								<li><a href="#snsGroup" id="sns" title="SNS 공유하기"
									class="snsShare"><span class="blind">SNS 공유하기</span></a>
									<div id="snsGroup" class="snsList clearfix">
										<a href="#sns1" id="sns1"
											onclick="javascript:fnShareFaceBook('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;"
											title="페이스북에 공유하기" class="snsFacebook"><span
											class="blind">페이스북</span></a> <a href="#sns2" id="sns2"
											onclick="javascript:fnShareTwitter('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;"
											title="트위터에 공유하기" class="snsTwitter"><span class="blind">트위터</span></a>
										<a href="#sns3" id="sns3"
											onclick="javascript:fnShareNaver('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;"
											title="네이버 블로그에 공유하기" class="snsBlog"><span class="blind">네이버
												블로그</span></a> <a href="#sns4" id="sns4"
											onclick="javascript:fnShareKakaoStory('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;"
											title="카카오스토리에 공유하기" class="snsStory"><span class="blind">카카오스토리</span></a>
									</div></li>
								<li class="mobileHide"><a href="#print" id="pprint"
									title="인쇄" class="snsPrint"
									onclick="javascript:fnPrintPopup('yslib'); return false;"><span
										class="blind">현재화면 프린트</span></a></li>
							</ul>
						</div>
					</div>
					<div id="contents" class="contentArea">
						<!--Forced tab Show Que-->
						<!--Real Contents Start-->

						<h4 class="htitle">비밀번호 재발급</h4>
						<ul class="dot-list">
							<li>가입된 회원정보로 회원 비밀번호를 재설정 합니다.</li>
						</ul>
						<c:choose>
							<c:when test="${error eq true }">
								<form name="registForm" id="registForm"
									action="./passwordFind.do" method="post">
									<div class="inpArea">
										<div class="clearfix">
											<p style="color:red;">매칭된 아이디가 없습니다.</p>
										</div>
									</div>
									<div class="btnArea ta_c mt20">
										<input type="button" value="재검색" onclick="javascript:location.href='./findIdForm.do'">
									</div>
								</form>
							</c:when>
							<c:when test="${findPw ne null}">
								<form name="registForm" id="registForm"
									action="./pwUpdate.do" method="post">
									<div class="findForm themeBD2 mt20">
										<div class="findArea info pd0">
											<div class="inpArea">
												<label for="userId">이메일</label> 
												<input type="text" value="${findPw.user_email}" name="user_email" id="user_email" class="form-ele fid">
											</div>
											<div class="inpArea">
												<label for="handphone1">비밀번호변경</label>
												<div class="clearfix">
													<input type="text" id="user_password" name="user_password"
														style="width: 145px;">
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="submit" value="확인">
											</div>

										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<form name="registForm" id="registForm"
									action="./passwordFind.do" method="post">
									<div class="findForm themeBD2 mt20">
										<div class="findArea info pd0">
											<div class="inpArea">
												<label for="userId">이메일</label> <input type="text"
													name="user_email" id="user_email" class="form-ele fid">
											</div>
											<div class="inpArea">
												<label for="handphone1">휴대폰번호</label>
												<div class="clearfix">
													<input type="text" id="user_phone" name="user_phone"
														style="width: 145px;">
												</div>
											</div>
											<div class="btnArea ta_c mt20">
												<input type="submit" value="확인">
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
