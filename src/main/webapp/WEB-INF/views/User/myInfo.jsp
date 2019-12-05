<%@page import="com.rainbow.um.dto.UserDto"%>
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
<meta property="og:type" content="website">
<meta property="og:title" content="역삼도서관">
<meta property="og:description" content="역삼도서관 정보 및 도서검색 제공">
<meta property="og:image" content="../include/image/common/ico_sns_favicon.png">
<meta property="og:url" content="index.html">
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
	$(function(){
	eval("initMenu(3,1,0,0,0)");
	});
</script>
	
<script type="text/javascript">
var siteCd = "yslib";
</script>

<script type="text/javascript">
	$(function(){
		$("#searchKeyword").keypress(fnSearchEnter);
		$("#searchBtn").click(fnSearch);

	});


	function fnSearch(){
		var form = document.searchForm;
		form.action = ".do";
		form.submit();
	}

	function fnList(page){
		var form = document.paramForm;
		form.currentPageNo.value = page;
		form.action = ".do";
		form.submit();
	}

	function fnDetail(idx){
		var form = document.paramForm;
		form.lectureIdx.value = idx;
		form.action = ".do";
		form.submit();
	}

	function fnSearchCategory(idx){
		var form = document.paramForm;
		form.currentPageNo.value = 1;
		form.searchCategory.value = idx;
		form.action = ".do";
		form.submit();
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
	<h2>주메뉴</h2>
	<ul id="lnb" class="lnb"></ul>
</div>

			<div id="contentcore">
				
<div class="naviandtitle">
	<h3>페이지타이틀</h3>
	<div class="navi"></div>
	<div class="snsFarm">
		<ul class="snsBtnArea clearfix">
			<li><a href="#snsGroup" id="sns" title="SNS 공유하기" class="snsShare"><span class="blind">SNS 공유하기</span></a>
				<div id="snsGroup" class="snsList clearfix">
					<a href="#sns1" id="sns1" onclick="javascript:fnShareFaceBook('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;" title="페이스북에 공유하기" class="snsFacebook"><span class="blind">페이스북</span></a>
					<a href="#sns2" id="sns2" onclick="javascript:fnShareTwitter('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;" title="트위터에 공유하기" class="snsTwitter"><span class="blind">트위터</span></a>
					<a href="#sns3" id="sns3" onclick="javascript:fnShareNaver('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;" title="네이버 블로그에 공유하기" class="snsBlog"><span class="blind">네이버 블로그</span></a>
					<a href="#sns4" id="sns4" onclick="javascript:fnShareKakaoStory('https://library.gangnam.go.kr/yslib/menu/10560/program/30016/mypage/myInfo.do'); return false;" title="카카오스토리에 공유하기" class="snsStory"><span class="blind">카카오스토리</span></a>
				</div>
			</li>
			<li class="mobileHide"><a href="#print" id="pprint" title="인쇄" class="snsPrint" onclick="javascript:fnPrintPopup('yslib'); return false;"><span class="blind">현재화면 프린트</span></a></li>
		</ul>
	</div>
</div>
				<div id="contents" class="contentArea">
					
<!--Forced tab Show Que-->
<div class="tabNav">
	<div class="virtSelect"><a href="#script">탭메뉴</a></div>
	<ul class="tnb clearfix">
		<li></li>
	</ul>
</div>
<!--Forced tab Show Que-->
					<!--Real Contents Start-->
					<div class="myPageWrap">
						<div class="clearfix">
							<!-- 정회원일때 -->
							<div class="myInfoBox pcVersion mobileHide">
								<div class="title"><strong class="name">${LDto.user_email}</strong>님, 반갑습니다.
									
								</div>
								<a href="/intro/memberModifyCheck.do" class="btnModify">개인정보수정</a>
								<div class="myInfo">
									<div class="memType">
														<strong class="member typeA themeColor">정회원</strong>
									</div>
									<div class="myInfoList">
										<ul class="dot-list">
											<li>회원가입일 : </li>
											<li>휴대폰번호 : 010-3***-4366
												(SMS수신)
											</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="myInfoBox mVersion mobileShow">
								
									
										<div class="title"><strong class="name">${LDto.user_email}</strong>님, 반갑습니다.
											
										</div>
										<a href="/intro/memberModify.do" class="btnModify">개인정보수정</a>
										<div class="membership">
											<ul class="dot-list">
												<li>아이디 : 5623157</li>
												<li>회원번호 : 5623157</li>
											</ul>
										</div>
									
									
								
							</div>

							
								<h4 class="htitle">서비스 이용현황</h4>
								<ul class="myState clearfix">
									<li>
										<div>
											<strong class="tit">대출중인<br>도서</strong>
											<a href="/yslib/loanStatusList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">연체중인<br>도서</strong>
											<a href="/yslib/loanStatusList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">예약중인<br>도서</strong>
											<a href="/yslib/reservationStatusList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">대출반납<br>도서(3개월)</strong>
											<a href="/yslib/loanHistoryList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">상호대차<br>신청도서</strong>
											<a href="/yslib/dooraeLillStatusList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">신청중인<br>희망도서</strong>
											<a href="/yslib/hopeBookList.do" class="num">0</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">등록한<br>관심자료</strong>
											<a href="/yslib/basketList.do" class="num">1</a>
										</div>
									</li>
									<li>
										<div>
											<strong class="tit">신청중인<br>문화행사</strong>
											<a href="/yslib/lectureApplyList.do" class="num">0</a>
										</div>
									</li>
								</ul>
							
						</div>
					</div>

					<!-- End Of the Real Contents-->
				</div>
			</div>
		</div>
	</div>	

	

<!-- footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<!-- //footer -->

<iframe name="hiddenFrame" id="hiddenFrame" title="빈프레임" class="blind"></iframe>

</div>
<!-- //wrap -->
</body>

</html>