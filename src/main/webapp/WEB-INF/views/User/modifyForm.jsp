<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<script type="text/javascript" src="./js/modifyForm.js"></script>


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
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


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
						<h3>회원정보수정</h3>
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

						<div class="memberWrap">
							<form action="./update.do" method="post" id="form" name="form"
								onsubmit="return submitCheck()">
								<input type="hidden" id="time" name="time">
								<div class="boardWrap mt30">
									<p>
										<span class="essential">정보수정</span>
									</p>
									<table class="board-view">
										<caption>나의정보</caption>
										<colgroup>
											<col style="width: 20%;">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">이메일</th>
												<td>${LDto.user_email }</td>
											</tr>
											<tr>
												<th scope="row"><label for="phone">휴대폰번호</label></th>
												<td>
													<div class="numericForm clearfix">
														<input type="hidden" id="user_phone" name="user_phone"
															value="${dto.user_phone}" readonly="readonly">
													</div>
													<br> <input type="text" id="new_phone"
													name="new_phone" placeholder="${dto.user_phone}"> <input
													type="button" onclick="timeAjax()" value="번호인증하기" class="btn wide themeBtn"><br>
												<br> <input type="hidden" id="code" onclick="time()"><br>
													<input type="text" id="code2"> <input type="button"
													onclick="vail()" value="확인" class="btn wide themeBtn"><br>
												</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td><input type="text" id="user_zip" name="user_zip"
													required="required" readonly="readonly"
													value="${dto.user_zip}">
													<input type="button"
													value="주소찾기" onclick="goPopup()" class="btn wide themeBtn"><br> <input
													type="text" id="user_address" name="user_address"
													required="required" readonly="readonly"
													value="${dto.user_address}"><br> <input
													type="text" id="user_detail" name="user_detail"
													placeholder="상세주소" required="required"
													value="${dto.user_detail }"><br></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btnGroup">
									<input type="submit" value="정보수정확인" class="btn wide themeBtn">
								</div>
							</form>
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
