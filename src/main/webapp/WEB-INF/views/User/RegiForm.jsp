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
	


<script type="text/javascript">
var siteCd = "yslib";
</script>

<script type="text/javascript">
	$(function(){
		$("#password").keypress(function(e){
			var code = e.keyCode || e.which;
			if(code == 13){
				fnLoginProc();
				return false;
			}
		});
		$("#loginBtn").click(fnLoginProc);
	});

	function fnLoginProc() {
		var form = document.loginForm;

		if(isEmpty(form.userId.value)){
			alert("아이디를 입력하세요");
			form.userId.focus();
			return false;
		}

		if(isEmpty(form.password.value)){
			alert("비밀번호를 입력하세요");
			form.password.focus();
			return false;
		}

		form.action = "/yslib/menu/10576/program/30024/memberLoginProc.do";
		form.submit();

		return false;
	}

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
	<h3>회원가입</h3>
	<div class="navi"></div>
	<div class="snsFarm">
	</div>
</div>
				<div id="contents" class="contentArea">

					<div class="loginWrap">
						<form action="./login.do" method="post">
<!-- 							<input type="hidden" name="returnUrl" value="aHR0cHM6Ly9saWJyYXJ5LmdhbmduYW0uZ28ua3IveXNsaWIvbWVtYmVyTG9naW4uZG8/cmV0dXJuVXJsPWFIUjBjSE02THk5c2FXSnlZWEo1TG1kaGJtZHVZVzB1WjI4dWEzSXZlWE5zYVdJdk5EQXdNVEV2WTI5dWRHVnVkSE11Wkc4JTNE"> -->
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
<!-- 									<input type="button" id="loginBtn" title="로그인" value="로그인" class="btnLogin themeBtn"> -->
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
								<li><input type="button" value="회원가입"></li>
								<li><input type="button" value="돌아가기" onclick="back()"></li>
							</ul>
						</div>
					</div>
<script type="text/javascript">
	function back(){
		location.href="./testMember.do";
	}
</script>
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