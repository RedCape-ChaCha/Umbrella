<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
<meta name="author" content="역삼도서관">
<meta name="description" content="역삼도서관 정보 및 도서검색 제공">
<meta name="generator" content="jnet co. ltd.">
<title>스마트도서관</title>
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
			$(function(){
				eval("initMenu(7,1,0,0,0)");
			});
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
	<h2>회원정보</h2>
	<ul id="lnb" class="lnb">
		<li><a href="./loginForm.do">로그인</a></li>
		<li><a>아이디찾기</a></li>
		<li><a>비밀번호재발급</a></li>
		<li><a href="./regist.do">회원가입</a></li>
	</ul>
</div>

			<div id="contentcore">
				
<div class="naviandtitle">
	<h3>로그인</h3>
	<div class="navi"></div>
	<div class="snsFarm">
	</div>
</div>
				<div id="contents" class="contentArea">

					<div class="loginWrap">
						<form action="./login.do" method="post">
							<div class="loginGroup clearfix">
								<div class="loginArea">
									<div class="inpArea">
										<label for="user_email" class="blind">아이디</label>
										<input type="text" id="user_email" name="user_email" placeholder="아이디" class="eng-mode">
									</div>
									<div class="inpArea">
										<label for="user_password" class="blind">비밀번호</label>
										<input type="password" id="user_password" name="user_password" placeholder="비밀번호" class="eng-mode">
									</div>
									<input type="submit" id="loginBtn" class="btnLogin themeBtn" title="로그인" value="로그인">
									<div class="checkArea clearfix">
										<a href="memberFindId.html">아이디 찾기</a>
										<a href="memberFindPwd.html">비밀번호 재발급</a>
										<a href="./regist.do">회원가입</a>
									</div>
								</div>
							</div>
						</form>
						<div class="loginDesc">
							<ul class="dot-list">
								<li>로그인이 안되시는 경우 <span class="emp1">한/영 키</span> 또는 <span class="emp1">Caps Lock 키</span>가 눌러져 있는지 확인하세요.</li>
								<li>로그인 정보가 기억나지 않는 경우 아이디찾기 또는 비밀번호 재발급을 통해 확인하실 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<!-- End Of the Real Contents-->

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
