<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<!-- <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="./css/sweetalert.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.min.css"> -->
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
<script src="./ckeditor/ckeditor.js"></script>	
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('ckeditor',{
			width : "100%",
			height: "300px",
			filebrowserUploadUrl : "./imgUpload.do"		
	});
	$("#listBtn").click(function() {
		location.href="./login.qnaList.do";
	});
	
	});
</script>	
<script type="text/javascript">
	$(function(){
	eval("initMenu(3,4,0,0,0)");
	
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
</div>
					
<!--Forced tab Show Que-->
<div class="tabNav">
	<div class="virtSelect"><a href="#script">탭메뉴</a></div>
	<ul class="tnb clearfix">
		<li></li>
	</ul>
</div>
				<div id="contents" class="contentArea">
<!--Forced tab Show Que-->
					<!--Real Contents Start-->
					<h5 class="htitle">Q&A</h5>
					<form action="./login.qnaInsert.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="user_number" value="${LDto.user_number}">
						<div class="boardWrap">
							<table class="board-view">
								<caption>개인문의</caption>
								<colgroup>
									<col style="width:15%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">작성자</th>
										<td><input type="text" name="user_email" value="${LDto.user_email}" readonly="readonly"></td>
									</tr>
									<tr>
										<th scope="row"><label for="title">제목</label></th>
										<td><input type="text" id="title" name="qna_title" class="form-ele full" required="required"></td>
									</tr>
									<tr>
										<td colspan="2" class="textarea">
											<textarea name="qna_content" title="질문 내용 입력" id="ckeditor" required="required"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					<div class="btnGroup">
						<input type="button" id="listBtn" class="btn cncl" value="취소">
						<input type="submit" id="registBtn" class="btn themeBtn" value="등록">
					</div>
					</form>
					<!-- //게시글 등록 -->
					
					
					
					<!-- End Of the Real Contents-->
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
