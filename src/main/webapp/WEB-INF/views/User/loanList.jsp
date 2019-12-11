<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
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
<script type="text/javascript" src="./js/modifyForm.js"></script>
	
	
<script type="text/javascript">
	$(function(){
	eval("initMenu(3,2,0,0,0)");
	});
	$(function(){
		$("#kdcDepth1List > li > a").click(fnKdc1Change);
		$(".kdcDepth2List > li > dl> dt > a").click(fnKdc2Change);
		$(".kdcDepth2List > li > dl> dd > a").click(fnKdc3Change);
		$("#kdcDepth2List_0").show();
		$("#resultSubList").hide();
	});
</script>
	
<script type="text/javascript">
var siteCd = "yslib";
</script>

</head>
<body>
<!-- //skip -->
<!-- wrap -->
<div id="wrap">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	

	<div id="container" class="sub">
		<div class="contentGroup">
			
<div id="lnbNav" class="navArea">
	<h2> <em>회원정보</em> </h2>
	<ul id="lnb" class="lnb"><li><a href="./modifyform.do" class="current">회원정보수정</a></li>
<li><a href="/intro/menu/10075/program/30033/mypage/memberPwdModify.do">비밀번호변경</a></li>
<li><a href="/intro/menu/10076/program/30034/mypage/memberWithdraw.do">회원탈퇴</a></li>
</ul>
</div>

			<div id="contentcore">
				
<div class="naviandtitle">
	<h3>회원정보수정</h3>
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
<div class="tabNav" style="display: block;">
	<div class="virtSelect" style="display: none;"><a href="#script">탭메뉴</a></div>
	<ul class="tnb clearfix">
		<li class="choiced" ><a class="current" href="./login.ownLoanList.do">대출현황</a></li>
		<li ><a href="./login.ownWebList.do" >웹대출현황</a></li>
		<li ><a href="./login.ownResvList.do">예약현황</a></li>
		<li ><a href="./login.history.do">대출이력</a></li>
	</ul>
</div>
<!--Forced tab Show Que-->
					<!--Real Contents Start-->


					<form name="searchForm" id="searchForm" method="get">
						<fieldset>
							<legend class="blind">게시글 검색 영역</legend>
							<!-- 게시판 필터 -->
							<div class="boardFilter">
								<p class="count">대출현황 : <span class="themeFC">${count}</span>건</p>
							</div>
							
							<!-- //게시판 필터 -->
						</fieldset>
					</form>


					<!-- 게시판 목록 -->
					<div class="articleWrap">
						<ul class="article-list check">
							<c:choose>
								<c:when test="${list eq null }">
									<li class="emptyNote">대출 정보가 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="book" items="${list}">
										<li>
											<p class="title">
												<a href="#link" onclick="javascript:fnSearchResultDetail(448718,1587809,'MO'); return false;">
													 ${book.book_name}
												</a>
											</p>
											<ul class="info sdot-list">
												<li>
													<span>도서관 : 스마트 도서관</span>
												</li>
												<li>
													<span class="status cncl">상태 : 
															<c:choose>
																<c:when test="${book.return_date > nowTime }">
																	<em>대출중</em>
																</c:when>
																<c:otherwise>
																	<em style="color: red;">연체중</em>
																</c:otherwise>
															</c:choose>
													</span>
													<span>대출일 : ${book.loan_date}</span>
													<span>반납 예정일 : ${book.return_date}</span>
												</li>
											</ul>
										</li>
									</c:forEach>
								</c:otherwise>								
							</c:choose>
						</ul>
					</div>
					<!-- //게시판 목록 -->

					<!-- 페이징 -->
					<div class="pagingWrap">
						
					</div>
					<!-- //페이징 -->
					<!-- End Of the Real Contents-->

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
