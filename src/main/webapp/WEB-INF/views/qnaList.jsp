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
<!--Forced tab Show Que-->
				<div id="contents" class="contentArea">
					<!--Real Contents Start-->
					<div class="boardWrap">
						<table class="board-list">
							<caption>게시물 목록</caption>
							<colgroup>
								<col class="no mobileHide">
								<col>
								<col class="date mobileHide">							
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="mobileHide">번호</th>
									<th scope="col">제목</th>
									<th scope="col" class="mobileHide">작성일</th>
								</tr>
							</thead>		
							<tbody>
							    <c:choose>
							    	<c:when test="${empty qnalists}">
							    		<tr>
							    			<td class="title" colspan="3">
												-- 작성된 글이 없습니다 --
							    			</td>
							    		</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="d" items="${qnalists}">
											<tr>
												<td class="mobileHide">${d.qna_seq}</td>
												<td class="title">
													<a href="./qnaDetail.do?qna_seq=${d.qna_seq}">${d.qna_title}</a>
												</td>
												<td class="mobileHide">
												<fmt:parseDate value="${d.qna_regdate}" var="qnaDate" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate value="${qnaDate}" pattern="yyyy.MM.dd"/>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
							    </c:choose>
							</tbody>
						</table>
					</div>
					<!-- //게시판 목록 -->
					<!-- 페이징 -->
					
					<div class="pagingWrap">
							<p class="paging">
								<a href="./qnaList.do?nowPage=1" class="btn-paging first"><span class="blind">맨 첫 페이지로 가기</span></a>
								<a href="./qnaList.do?nowPage=${qpg.nowPage-3}" class="btn-paging prev"><span class="blind">이전 10개 보기</span></a>
								<c:forEach var="i" begin="${qpg.startPage }" end="${qpg.endPage }" step="1">
									<a href="./qnaList.do?nowPage=${i}"><span class="<c:out value="${qpg.nowPage == i?'current':''}"/>"> ${i} </span></a>
								</c:forEach>
								<a href="./qnaList.do?nowPage=${qpg.nowPage+3}" class="btn-paging next"><span class="blind">다음 10개 보기</span></a>
								<a href="./qnaList.do?nowPage=${qpg.totalPage}" class="btn-paging last"><span class="blind">맨 마지막 페이지로 가기</span></a>
							</p>
							<c:if test="${user_grade eq 'U'}">
								<button class="btn write themeBtn" onclick="qnaRegForm()">글쓰기</button>							
							</c:if>
		
					</div>
					<!-- //페이징 -->
					<!-- End Of the Real Contents-->
					<script type="text/javascript">
						function qnaRegForm() {
							location.href="./qnaRegForm.do";
						}
					</script>
					
					
					
					
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