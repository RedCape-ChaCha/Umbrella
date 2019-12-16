<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">

<title>스마트 도서관</title>
<link rel="shortcut icon" href="../include/image/common/ico_sns_favicon.png">
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
<link rel="stylesheet" type="text/css" href="./booksearch/css/search.css" />
<script type="text/javascript" src="./booksearch/js/multilang2.js"></script>
<script type="text/javascript" src="./booksearch/js/jquery-ui-draggable.min.js"></script>

	
	
<script type="text/javascript">
	$(function(){
	eval("initMenu(1,1,0,0,0)");
	});
</script>
	

<script type="text/javascript">
var siteCd = "yslib";
</script>
<script type="text/javascript">
	var activeElementName = "";
	$(function(){
		$("#resetBtn").click();
/* 		$("input[type=text]").keypress();
		$("input[type=text]").focus(); 
		$("select[name=searchSort]").click();
		$("select[name=searchOrder]").hide();*/
		$("#searchBtn").click();
		$("#result").hide();
	});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<!--  default param -->
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
					<form id="searchForm" name="searchForm" method="post">
						<input type="hidden" name="searchType" value="DETAIL">
						<input type="hidden" name="searchCategory" value="BOOK">
						<div class="detailSearchFrom">
							<div class="detailSearch">
								<div class="searchFormArea">
									<table class="detailSearchTbl">
										<caption>상세검색 양식 작성</caption>
										<colgroup>
											<col style="width:70px" />
											<col />
										</colgroup>
										<tr>
											<th scope="row" rowspan="4">검색항목</th>
											<td>
												<div class="fnInputBox">
													<select id="searchKey1" name="searchKey1" title="검색 항목 선택" class="form-ele fix">
														<option value="TITLE" selected="selected">서명</option>
														<option value="AUTHOR">저자</option>
														<option value="PUBLISHER">발행자</option>
														<option value="ISBN">ISBN</option>
													</select>
													<input type="text" id="searchKeyword1" name="searchKeyword1" title="검색어 입력" class="form-ele full" />
												</div>
											</td>
										</tr>
									</table>
									<div class="ta_c" style="margin-top: 10px;">
										<a href="#btn" id="searchBtn" class="btn search themeBtn">자료검색</a>
										<a href="#btn" id="resetBtn" class="btn reset">결과내 재검색</a>
									</div>
								</div>
							</div>
						</div>
						</form>
<div id="result">
<div class="resultFilter clearfix" style="margin-top: 10px;">
		<div class="sort">
			<select name="searchSort" id="searchSort" class="resultSelect" title="정렬방식 선택">
								<option value="SIMILAR" selected="selected">정확도순</option>
								<option value="KEY">등록일</option>
								<option value="TITLE">서명</option>
								<option value="AUTHOR">저자</option>
								<option value="PUBLISHER">발행자</option>
								<option value="PUBLISHYEAR">발행연도</option>
							</select>
							<select name="searchOrder" id="searchOrder" class="resultSelect" title="정렬순서 선택" style="display:none">
								<option value="DESC" selected="selected">내림차순</option>
								<option value="ASC">오름차순</option>
							</select>
</div>
<select name="searchRecordCount" id="searchRecordCount" class="resultSelect" title="출력 건수 선택">
		<option value="10" selected="selected">10건</option>
		<option value="20">20건</option>
		<option value="30">30건</option>
		<option value="40">40건</option>
		<option value="50">50건</option>
</select>
	<a href="#btn" id="sortBtn" class="btnGo">확인</a>
</div>
<ul class="resultList imageType" id="resultList">
				<li>
					<span class="chk"><input type="checkbox" name="check" title="선택" value="661088^1311141^BO"></span>
						<div class="thumb">
							<a href="#link" onclick="javascript:fnSearchResultDetail(661088,1311141,'BO'); return false;" class="cover">
								<em class="tag"></em>
								<span class="img"><img class="bookCoverImg" src="https://bookthumb-phinf.pstatic.net/cover/064/619/06461957.jpg" alt="어느 책중독자의 고백 표지"></span>
							</a>
						</div>
					<dl class="bookDataWrap">
						<dt class="tit">
							<span class="cate">도서</span>
							<a href="#link" onclick="javascript:fnSearchResultDetail(661088,1311141,'BO'); return false;">어느 책중독자의 고백</a>
						</dt>
						<dd class="author">
							<span>저자 : 톰 라비 지음 ;김영선 옮김</span>
							<span>발행자: 돌베개</span>
						</dd>
						<dd class="data">
								<span>ISBN: 8971994207</span>
								<span>
									청구기호: 013.41-라48ㅇ
								</span>
						</dd>
						<dd class="site">
						</dd>
					</dl>
					<div class="bookStateBar clearfix">
						<p class="txt">
						</p>
						<div class="stateArea">
											<span class="state typeC"><span class="ico"></span> 도서예약</span>
								<a href="#wishbook"  class="state typeA"><span class="ico"></span> 웹도서대출</a>
						</div>
					</div>
				</li>
	
</ul>
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