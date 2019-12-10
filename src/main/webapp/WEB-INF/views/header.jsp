<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		var $topPopupClose = $(".topPopupClose");
		$topPopupClose.on("click", function() {
			var $area = $(this).parents(".topPopupWrap");
			var hgt = $area.height();
			$area.css({
				"margin-top" : "-" + hgt + "px",
				"z-index" : 0
			});
			return false;
		});
	});
</script>

<ul class="skip">
	<li><a href="#contents">본문 바로가기</a></li>
	<li><a href="#gnb">주메뉴 바로가기</a></li>
</ul>
<header id="header">
	<a href="#back" id="blackBG"><span class="blind">이전으로 돌아가기</span></a>



	<div id="snb">
		<div class="siteUtilGroup">
			<div id="libraryShortcut" class="libSite dropdown"></div>
			<div id="siteMenu" class="siteMenu clearfix">
				<ul class="clearfix">
					<c:choose>
						<c:when test="${empty LDto}">
						<li class="login"><a href="./loginForm.do">로그인</a></li>
						<li class="joinus"><a href="./regist.do">회원가입</a></li>
						</c:when>
						<c:otherwise>
						<li class="login"><a href="./logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".dropdown > a").click(function() {
				var $dropdownNav = $(this).siblings("ul");
				if ($dropdownNav.css("display") == "none") {
					$(".dropdown > ul").hide();
					$dropdownNav.show();
				} else {
					$dropdownNav.hide();
				}
				return false;
			});

		});
	</script>

	<div class="headerInner clearfix">
		<h1 id="logo">
			<c:choose>
				<c:when test="${empty LDto}">
					<a href="./init.do"><img src="./image/etc/umbrella.png" alt="로고이미지"></a>
				</c:when>
				<c:otherwise>
					<a href="./index.do"><img src="./image/etc/umbrella.png" alt="로고이미지"></a>
				</c:otherwise>
			</c:choose>
		</h1>
		<a href="#open" id="mobileIndexOpen"><span class="blind">메뉴
				열기</span></a>
	</div>
	<nav id="gnbNav" class="clearfix">
		<div id="mobileIndexClose">
			역삼도서관 전체메뉴<a href="#close"><span class="blind">메뉴 닫기</span></a>
		</div>
		<ul id="gnb" class="clearfix">
			<li id="gnb1"><a href="./serch.do"> <em>자료검색</em>
			</a>
				<ul>
					<li id="gnb1_1"><a href="./serch.do">통합검색</a></li>
					<li id="gnb1_2"><a href="./searchSub.do">주제별검색</a></li>
					<li id="gnb1_3"><a href="./bobList.do">대출베스트</a></li>
				</ul></li>
			<li id="gnb2"><a href="./noList.do"> <em>참여마당</em>
			</a>
				<ul>
					<li id="gnb2_1"><a href="./noList.do">공지사항</a></li>
					<li id="gnb2_2"><a href="#">FAQ</a></li>
				</ul></li>
			<li id="gnb3"><a href="./myInfo.do"> <em>내서재</em>
			</a>
				<ul>
					<li id="gnb3_1"><a
						href="./mypage.do">기본정보</a></li>
					<li id="gnb3_2"><a
						href="./loneList.do">도서이용정보</a>
					</li>
					<li id="gnb3_3"><a
						href="">관심자료목록</a>
					</li>
					<li id="gnb3_4"><a href="./qnaList.do">Q&A</a></li>
				</ul></li>
			<li id="gnb7"><a
				href="menu/10576/program/30024/memberLogin.html"> <em>회원정보</em>
			</a>
				<ul>
					<li id="gnb7_1">
							<a href="./loginForm.do">로그인</a></li>
					<li id="gnb7_2">
					<a
						href="">아이디찾기</a>
						<ul class="MkTab">
							<li id="gnb7_2_1"><a
								href="">개인정보로 찾기</a></li>
							<li id="gnb7_2_2"><a
								href="">본인인증으로  
									찾기</a></li>
						</ul></li>
					<li id="gnb7_3"><a
						href="">비밀번호재발급</a>
						<ul class="MkTab">
							<li id="gnb7_3_1"><a
								href="">개인정보로 찾기</a></li>
							<li id="gnb7_3_2"><a
								href="">본인인증으로
									찾기</a></li>
						</ul></li>
					<li id="gnb7_4"><a
						href="">회원가입</a>
				</ul></li>
		</ul>
	</nav>
	<div id="submenuArea">
		<div id="submenuLink">
			<p class="catchphrase">
				직장인을 위한 24시간<strong>스마트 도서관</strong>
			</p>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {
			var tph = $(".topPopupWrap").height();
			var tpl = $(".topPopupWrap").length;
			var total_h = tph * tpl;
			if (tpl > 0) {
				$("#blackBG").css('top', 127 + total_h + 'px');
			}
		});
	</script>
</header>