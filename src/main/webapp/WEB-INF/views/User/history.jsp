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
	eval("initMenu(3,1,0,0,0)");
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
	<ul class="tnb clearfix"><li style="min-width: 224.75px;"><a href="./loneList.do">대출현황</a></li>
<li style="min-width: 224.75px;"><a href="./bookList.do">예약현황</a></li>
<li class="choiced" style="min-width: 224.75px;"><a href="./history.do" class="current">대출이력</a></li>
</ul>
</div>
<!--Forced tab Show Que-->
					<!--Real Contents Start-->
					<form name="searchForm" id="searchForm" method="get">
						<fieldset>
							<legend class="blind">게시글 검색 영역</legend>
							<div class="pageSearch ta_l">
								<span class="item">
									<select name="searchLibrary" id="searchLibrary" title="도서관 선택" class="form-ele auto">
										<option value="ALL">전체도서관</option>
										
											<option value="MA">도곡정보문화도서관</option>
										
											<option value="MB">논현도서관</option>
										
											<option value="SA">논현정보도서관</option>
										
											<option value="SB">대치1동작은도서관</option>
										
											<option value="MC">대치도서관</option>
										
											<option value="MD">못골도서관</option>
										
											<option value="ME">못골한옥어린이도서관</option>
										
											<option value="SC">삼성도서관</option>
										
											<option value="SD">세곡도서관</option>
										
											<option value="SE">역삼2동작은도서관</option>
										
											<option value="MF">역삼도서관</option>
										
											<option value="MG">역삼푸른솔도서관</option>
										
											<option value="MH">열린도서관</option>
										
											<option value="MI">정다운도서관</option>
										
											<option value="MJ">즐거운도서관</option>
										
											<option value="MK">청담도서관</option>
										
											<option value="ML">행복한도서관</option>
										
											<option value="TD">개포4동주민도서관</option>
										
											<option value="TC">도곡2동주민도서관</option>
										
											<option value="TG">수서동주민도서관</option>
										
											<option value="TA">신사동주민도서관</option>
										
											<option value="TB">압구정동주민도서관</option>
										
											<option value="TF">일원1동주민도서관</option>
										
											<option value="TE">일원본동주민도서관</option>
										
									</select>
								</span>
								<span class="item inputDateGroup">
									<select name="searchDayKey" id="searchDayKey" title="구분 선택" class="form-ele auto min">
										<option value="LOANDATE">대출일</option>
										<option value="RETURNDATE">반납일</option>
									</select>
									<span class="inputDateArea m_100">
										<span class="inputDate">
											<input type="text" title="검색 시작 날짜" name="searchStartDate" id="searchStartDate" value="" readonly="readonly" class="hasDatepicker"><a href="#openDatepicker" title="날짜선택" class="ui-datepicker-trigger"><img src="/include/image/common/ico_cal.png" alt="날짜선택" title="날짜선택"></a>
										</span> ~
										<span class="inputDate">
											<input type="text" title="검색 시작 날짜" name="searchEndDate" id="searchEndDate" value="" readonly="readonly" class="hasDatepicker"><a href="#openDatepicker" title="날짜선택" class="ui-datepicker-trigger"><img src="/include/image/common/ico_cal.png" alt="날짜선택" title="날짜선택"></a>
										</span>
									</span>
								</span>
								<span class="schForm mt05">
									<select name="searchKey" id="searchKey" title="검색방법 선택" class="schSel">
										<option value="TITLE" selected="selected">서명</option>
										<option value="REG_NO">등록번호</option>
									</select>
									<input type="text" name="searchValue" id="searchValue" value="" title="검색어 입력" class="schKwd" placeholder="검색어를 입력해 주세요">
									<a href="#btn" id="searchBtn" class="btn input search themeBtn2">검색</a>
								</span>
							</div>
							<div class="boardFilter">
								
									<div class="sort">
										<select name="searchSort" id="searchSort" title="정렬방식 선택">
											<option value="KEY" selected="selected">등록일</option>
											<option value="LOANDATE">대출일</option>
											<option value="RETURNDATE">반납일</option>
										</select>
										<button type="button" id="sortBtn" class="btn input">정렬</button>
									</div>
								
								<p class="count">대출이력 : <span class="themeFC">1</span>건</p>
							</div>
							
								<div class="boardFilter clearfix">
									<div class="fr"><a href="#down" id="exportExcelBtn" class="btn down themeBtn3">대출이력 엑셀출력</a></div>
								</div>
							
						</fieldset>
					</form>

					<!-- 게시판 목록 -->
					<div class="articleWrap">
						<ul class="article-list">
							
								
									
										<li>
											<p class="title">
												<a href="#link" onclick="javascript:fnSearchResultDetail(448718,1587809,'MO'); return false;">
													 (윤성우의) 열혈 Java 프로그래밍  
												</a>
											</p>
											<ul class="info sdot-list">
												<li>
													<span>도서관 : 역삼도서관</span>
													<span>자료실 : [역삼] 성인자료실</span>
												</li>
												
												<li>
													<span class="status cncl">상태 : <em>반납</em></span>
													<span>대출일 : 2019.06.12</span>
													<span>반납일 : 2019.07.02</span>
												</li>
											</ul>
										</li>
									
								
								
							
						</ul>
					</div>
					<!-- //게시판 목록 -->

					<!-- 페이징 -->
					<div class="pagingWrap">
						
							<p class="paging">
								<span class="current">1</span>


							</p>
						
					</div>
					<!-- //페이징 -->
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