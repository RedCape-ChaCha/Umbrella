<%@page import="com.rainbow.um.dto.UserDto"%>
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
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./js/jquery.slider.js"></script>
<script type="text/javascript" src="./js/jquery.tab.js"></script>
<script type="text/javascript" src="./js/jquery.newsticker.js"></script>
<script type="text/javascript" src="./js/gnb.js"></script>
<script type="text/javascript" src="./js/common.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="./css/common/main.css">
<link rel="stylesheet" type="text/css" href="./css/yslib/layout.css">
<script type="text/javascript">
	$(function() {
		eval("initMenu(0,0,0,0,0)");
	});
	var siteCd = "yslib";

	$(function() {
		$(".tab").each(function() {
			$(this).tabList({
				tabContSelector : false
			});
		});
	});
	function fnSearchMonth(searchMonth) {
		$("#holidayWrap").load(
				"/yslib/main/include/holiday.do?searchMonth=" + searchMonth);
	}
</script>
</head>
<body onload="build();">
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
		<div id="container" class="main">
			<section id="section1" class="mainSectionCore">
				<div class="sectionGroup">
					<div class="slogan"
						style="background-image: url(../include/image/yslib/main/img_library.png)">
						직장인을 위한 24시간<strong class="themeFC2">스마트 도서관</strong>
					</div>
					<dl class="mainSearchWrap themeColor2" style="text-align: center;">
						<dd class="mainSearchForm clearfix">
							<form name="mainSearchForm" id="mainSearchForm" method="post">
								<fieldset>
									<legend class="blind">통합검색 영역</legend>
									<div class="mainSearchKeyword">
										<label for="mainSearchKeyword" class="blind">검색어 입력</label> <input
											type="text" title="검색어 입력" class="form-ele"
											id="mainSearchKeyword" name="searchKeyword"
											placeholder="도서명 또는 저자명을 입력해주세요"> <a href="#search"
											id="mainSearchBtn" title="검색" class="btnSearch">검색</a>
									</div>
								</fieldset>
							</form>
						</dd>
					</dl>
					<div class="sectionContent">
						<div class="memberService">
							<article class="loginArea logoutArea" id="logoutArea">
								<h2 class="title">
									<b class="themeFC">${LDto.user_email}</b>님 환영합니다!
								</h2>
								<a href="./logout.do" class="btnLogout themeBtn">로그아웃</a>
								<div class="myBtnArea clearfix">
									<a href="./login.mypage.do">내서재</a> <a href="./login.modifyform.do">정보수정</a>
								</div>
							</article>
							<div class="libraryInfoGroup clearfix">

								<script type="text/javascript">
									function fnHolidaySearchMonth(month) {
										$("#holidayWrap")
												.load(
														"/yslib/main/include/holiday.do",
														{
															searchMonth : month
														});
									}
								</script>

								<article class="guideArea">
									<h1 class="title themeColor3">도서관 이용시간</h1>
									<p>
										자료실 (월~금) <span class="themeFC">09:00~22:00</span>
									</p>
									<p>
										자료실 (토, 일) <span class="themeFC">09:00~17:00</span>
									</p>
									<p>
										열람실 <span class="themeFC">06:00~22:00</span>
									</p>
									<a href="40073/contents.html" title="도서관 이용시간 상세보기"
										class="more"><span class="blind">더보기</span></a>
								</article>
							</div>

						</div>
						<div class="boardGroup">
							<ul class="tab clearfix">
								<li><a href="./noList.do">공지사항</a></li>
							</ul>
							<article id="noticeArticle" class="boardArticle">
								<h1 class="blind">공지사항</h1>
								<ul class="articleList">
									<c:forEach var="n" items="${noLists}">
										<li><a href="./noDetail.do?board_seq=${n.board_seq}">${n.board_title}</a>
											<span class="date"> <fmt:parseDate
													value="${n.board_regdate}" var="nDate" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${nDate}" pattern="yyyy.MM.dd" />
										</span>
									</c:forEach>
								</ul>
								<a href="./noList.do" title="공지사항 더보기" class="more"><span
									class="blind">더보기</span></a>
							</article>

						</div>
					</div>
					<article class="schedule">
						<h1 class="blind">도서관일정</h1>
						<div id="calendarWrap">
							<table id="calen" style="text-align: center;" class="calendar">
								<tr>
									<td><font size=2%; color="#B3B6B3"><label
											onclick="beforem()" id="before"></label></font></td>
									<td colspan="5" align="center" id="yearmonth"></td>
									<td><font size=2%; color="#B3B6B3"><label
											onclick="nextm()" id="next"></label></font></td>
								</tr>
								<tr>
									<td align="center"><font color="#FF9090">일</font></td>
									<td align="center">월</td>
									<td align="center">화</td>
									<td align="center">수</td>
									<td align="center">목</td>
									<td align="center">금</td>
									<td align="center"><font color=#7ED5E4>토</font></td>
								</tr>
							</table>
						</div>
					</article>
<!-- 					주요서비스 -->
				</div>
			</section>
</div>
			<section id="section2" class="mainSectionGroup">
			<div class="bookZone">
				<ul class="tab book clearfix">
					<li><a href="#recommendBook">추천도서</a></li>
				</ul>
				<div id="recommendBook" class="bookListWrap">
					<ul class="bookList clearfix">
						<c:forEach var="bl" items="${boLists}">
							<li>
								<span class="cover"><img alt="${bl.book_name}" src="https://s3.ap-northeast-2.amazonaws.com/rainbow.study/ThumbnailImg/${bl.book_img }"> </span>
								<span class="txt">${bl.book_name}</span>
							</li>
						</c:forEach>
					</ul>
			</div>
        </div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

	<script type="text/javascript">
		initMenu(0, 0, 0, 0, 0);
	</script>
</body>

</html>
