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
<title>공지사항</title>
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
<script src="./ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	$(function(){
		var ckeditor_config = {
			resize_enabled : false, // 에디터 리사이즈 여부
			toolbarCanCollapse : false// 에디터 툴바 숨기기 기능 여부
			};
		eval("initMenu(2,1,0,0,0)");
	
		CKEDITOR.replace('ckeditor',{
			width : "100%",
			height: "300px",
			filebrowserUploadUrl : "./imgUpload.do"
		});
		CKEDITOR.config.toolbarCanCollapse=true;
		CKEDITOR.config.toolbarStartupExpanded = false;
		CKEDITOR.config.readOnly=true;
		$("#listBtn").click(function() {
			location.href="./noList.do";
		});

	});
</script>
	

<script type="text/javascript">
var siteCd = "yslib";
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
	</div>
</div>
				<div id="contents" class="contentArea">
					<!-- 게시글 상세화면 -->
					<div class="boardWrap">
						<table class="board-view">
							<caption>게시물 상세화면</caption>
							<colgroup>
							<col style="width:15%">
							<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td>${nodto.board_title}</td>
								</tr>
								<tr>
									<th scope="row">작성일</th>
									<td>
										<fmt:parseDate value="${nodto.board_regdate}" var="noticeDate" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${noticeDate}" pattern="yyyy.MM.dd"/>
									</td>
								</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											
										</td>
									</tr>
								
								<tr>
									<td colspan="2" class="content">
										${nodto.board_content}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //게시글 상세화면 -->

					<div class="btnGroup">
						<input type="button" id="listBtn" class="btn cncl" value="목록">
					</div>
					
				
				</div>
			</div>
		</div>
	</div>
	<!-- //container -->
	

<!-- footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<!-- //footer -->

<iframe name="hiddenFrame" id="hiddenFrame" title="빈프레임" class="blind"></iframe>

</div>
<!-- //wrap -->
</body>

</html>