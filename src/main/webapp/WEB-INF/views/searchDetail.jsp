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
		$("#resetBtn").click(fnReset);
		$("input[type=text]").keypress(fnSearchEnter);
		$("input[type=text]").focus(fnFocus);
		$("select[name=searchSort]").click(fnSearchSortChange);
		$("select[name=searchOrder]").hide();
		$("#searchBtn").click(fnSearch);
		$("#searchLibrary").change(fnSearchLibraryChange);
		$("#searchRoom").change(fnSearchRoomChange);
		$(".languageContents ul li a").on("click", fnInputMultiLang);
		var form = document.searchForm;
		form.searchKeyword1.focus();
		activeElementName = $(":focus").attr("name");
	});

	function fnInputMultiLang(){
		var form = document.searchForm;
		if(activeElementName == "" ){
			alert("입력창에 커서를 놓으세요.");
		}else{
			if(activeElementName == "searchPublishStartYear" || activeElementName == "searchPublishEndYear"){
				form.elements[activeElementName].focus();
				alert("숫자만 입력가능합니다.");
			}else{
				form.elements[activeElementName].focus();
				form.elements[activeElementName].value = form.elements[activeElementName].value + $(this).text().trim();
			}
		}
		return false;
	}

	function fnReset(){
		var form = document.searchForm;
		form.searchKey1.value = "TITLE";
		form.searchKey2.value = "AUTHOR";
		form.searchKey3.value = "PUBLISHER";
		form.searchKey4.value = "KEYWORD";
		form.searchKey5.value = "ISBN";
		form.searchKeyword1.value = "";
		form.searchKeyword2.value = "";
		form.searchKeyword3.value = "";
		form.searchKeyword4.value = "";
		form.searchKeyword5.value = "";
		form.searchPublishStartYear.value = "";
		form.searchPublishEndYear.value = "";
		form.searchLibrary.value = "ALL";
		form.searchRoom.value = "ALL";
		form.searchSort.value = "KEY";
		form.searchOrder.value = "DESC";
		form.searchTitle.focus();
		return false;
	}

	function fnFocus(){
		activeElementName = $(this).attr("name");
		return false;
	}

	function fnSearchSortChange(){
		switch($(this).val()){
			case "SIMILAR":
				$("select[name=searchOrder]").hide();
				break;
			default:
				$("select[name=searchOrder]").show();
			break;
		}
	}

	function fnSearch(){
		var form = document.searchForm;
		if(isEmpty(form.searchKeyword1.value)
			&& isEmpty(form.searchKeyword2.value)
			&& isEmpty(form.searchKeyword3.value)
			&& isEmpty(form.searchKeyword4.value)
			&& isEmpty(form.searchKeyword5.value)
			&& isEmpty(form.searchPublishStartYear.value)
			&& isEmpty(form.searchPublishEndYear.value)){
				alert("검색어를 입력하거나 항목을 선택하세요.")
				form.searchKeyword1.focus();
				return false;
			}

			var publishYear = form.searchPublishStartYear.value + form.searchPublishEndYear.value;
			if(publishYear != ""){
				if(form.searchPublishStartYear.value == ""){
					alert("발행시작연도를 입력하세요.");
					form.searchPublishStartYear.focus();
					return false;
				}
				var regExp = /\d{4}/;
				if(!regExp.test(form.searchPublishStartYear.value)){
					alert("발행시작연도를 4자리로 입력하세요.")
					form.searchPublishStartYear.focus();
					return false;
				}
				if(form.searchPublishEndYear.value == ""){
					alert("발행종료연도를 입력하세요.");
					form.searchPublishEndYear.focus();
					return false;
				}
				if(!regExp.test(form.searchPublishEndYear.value)){
					alert("발행종료연도를 4자리로 입력하세요.")
					form.searchPublishEndYear.focus();
					return false;
				}
		}
		form.action="/yslib/menu/10513/program/30002/plusSearchResultList.do"
		form.submit();
		return false;
	}

	function fnSearchLibraryChange(){
		var form = document.searchForm;
		form.searchRoom.value = "ALL";
	}

	function fnSearchRoomChange(){
		var form = document.searchForm;
		form.searchLibrary.value = "ALL";
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<form name="paramForm" id="paramForm" method="get">
	

<!--  default param -->
<input type="hidden" name="currentPageNo" value="1">










<input type="hidden" name="searchCategory" value="">
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
					<a href="#sns1" id="sns1" onclick="javascript:fnShareFaceBook('plusSearchDetail.html'); return false;" title="페이스북에 공유하기" class="snsFacebook"><span class="blind">페이스북</span></a>
					<a href="#sns2" id="sns2" onclick="javascript:fnShareTwitter('plusSearchDetail.html'); return false;" title="트위터에 공유하기" class="snsTwitter"><span class="blind">트위터</span></a>
					<a href="#sns3" id="sns3" onclick="javascript:fnShareNaver('plusSearchDetail.html'); return false;" title="네이버 블로그에 공유하기" class="snsBlog"><span class="blind">네이버 블로그</span></a>
					<a href="#sns4" id="sns4" onclick="javascript:fnShareKakaoStory('plusSearchDetail.html'); return false;" title="카카오스토리에 공유하기" class="snsStory"><span class="blind">카카오스토리</span></a>
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
													</select>
													<input type="text" id="searchKeyword1" name="searchKeyword1" title="검색어 입력" class="form-ele full" />
													<select id="searchOperator1" name="searchOperator1" title="검색조건 선택" class="form-ele fix">
														<option value="AND">AND</option>
														<option value="OR">OR</option>
														<option value="NOT">NOT</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="fnInputBox">
													<select id="searchKey2" name="searchKey2" title="검색 항목 선택" class="form-ele fix">
														<option value="TITLE">서명</option>
														<option value="AUTHOR" selected="selected">저자</option>
														<option value="PUBLISHER">발행자</option>
													</select>
													<input type="text" id="searchKeyword2" name="searchKeyword2" title="검색어 입력" class="form-ele full" />
													<select id="searchOperator2" name="searchOperator2" title="검색조건 선택" class="form-ele fix">
														<option value="AND">AND</option>
														<option value="OR">OR</option>
														<option value="NOT">NOT</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="fnInputBox">
													<select id="searchKey3" name="searchKey3" title="검색 항목 선택" class="form-ele fix">
														<option value="TITLE">서명</option>
														<option value="AUTHOR">저자</option>
														<option value="PUBLISHER" selected="selected">발행자</option>
													</select>
													<input type="text" id="searchKeyword3" name="searchKeyword3" title="검색어 입력" class="form-ele full" />
													<select id="searchOperator3" name="searchOperator3" title="검색조건 선택" class="form-ele fix">
														<option value="AND">AND</option>
														<option value="OR">OR</option>
														<option value="NOT">NOT</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<th scope="row"><label for="searchKey5">표준부호</label></th>
											<td>
												<div class="fnInputBox">
													<select id="searchKey5" name="searchKey5" title="검색 항목 선택" class="form-ele fix">
														<option value="ISBN" selected="selected">ISBN</option>
														<option value="ISSN">ISSN</option>
													</select>
													<input type="text" id="searchKeyword5" name="searchKeyword5" title="검색어 입력" class="form-ele full eng-mode" />
													<select id="searchOperator5" name="searchOperator5" title="검색조건 선택" class="form-ele fix">
														<option value="AND">AND</option>
														<option value="OR">OR</option>
														<option value="NOT">NOT</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="searchBtnArea">
									<div class="ta_c">
										<a href="#btn" id="resetBtn" class="btn reset">초기화</a>
										<a href="#btn" id="searchBtn" class="btn search themeBtn">자료검색</a>
									</div>
								</div>
							</div>
						</div>
						<div class="resultFilter clearfix">
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
							


















<select name="searchRecordCount" id="searchRecordCount" class="resultSelect" title="출력 건수 선택">
	
		<option value="10" selected="selected">10건</option>
	
		<option value="20">20건</option>
	
		<option value="30">30건</option>
	
		<option value="40">40건</option>
	
		<option value="50">50건</option>
	
</select>
							<a href="#btn" id="sortBtn" class="btnGo">확인</a>
						</div>
						
							

















<script type="text/javascript">
	$(function(){
		$("#imageViewBtn").click(fnImageView);
		$("#textViewBtn").click(fnTextView);
	});

	function fnImageView(){
		var form = document.paramForm;
		form.viewStatus.value = "IMAGE";
		switch(form.searchType.value){
			case "SIMPLE":
			case "DETAIL":
				form.action = "/yslib/menu/10513/program/30002/plusSearchResultList.do";
				break;
			case "KDC":
				form.action = "/yslib/menu/10513/program/30002/plusSearchKdcResultList.do";
				break;
			case "NEW":
				form.action = "/yslib/menu/10513/program/30002/plusSearchNewList.do";
				break;
			case "ULIB":
				form.action = "/yslib/menu/10513/program/30002/plusSearchULibraryResultList.do";
				break;
		}
		form.submit();
		return false;
	}

	function fnTextView(){
		var form = document.paramForm;
		form.viewStatus.value = "TEXT";
		switch(form.searchType.value){
			case "SIMPLE":
			case "DETAIL":
				form.action = "/yslib/menu/10513/program/30002/plusSearchResultList.do";
				break;
			case "KDC":
				form.action = "/yslib/menu/10513/program/30002/plusSearchKdcResultList.do";
				break;
			case "NEW":
				form.action = "/yslib/menu/10513/program/30002/plusSearchNewList.do";
				break;
			case "ULIB":
				form.action = "/yslib/menu/10513/program/30002/plusSearchULibraryResultList.do";
				break;
		}
		form.submit();
		return false;
	}
</script>
<div class="mode">
	<span class="btnToggle">
		<a href="#btn" title="표지형으로 보기" id="imageViewBtn" class="btnTogImage choiced"><span class="blind">표지형</span></a>
		<a href="#btn" title="목록형으로 보기" id="textViewBtn" class="btnTogText "><span class="blind">목록형</span></a>
	</span>
</div>
						
					</div>
<ul class="resultList imageType">
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
					</form>
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