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
	
	

	

<script type="text/javascript">
	$(function(){
	eval("initMenu(1,3,0,0,0)");
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
					<!--Real Contents Start-->

					<!-- 게시판 검색 -->
					<div class="boardWrap">
						<table class="board-list">
							<caption>대출베스트 목록</caption>
							<colgroup>
								<col class="no mobileHide">
								<col>
								<col class="date mobileHide">							
								<col class="date mobileHide">							
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="mobileHide">번호</th>
									<th scope="col">제목</th>
									<th scope="col" class="mobileHide">작성일</th>
									<th scope="col" class="mobileHide">조회수</th>
								</tr>
							</thead>		
							<tbody>
							    <c:choose>
							    	<c:when test="${empty bobLists}">
							    		<tr>
							    			<td class="title" colspan="3">
												-- 작성된 글이 없습니다 --
							    			</td>
							    		</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="d" items="${bobLists}">
											<tr>
												<td class="mobileHide">${d.board_seq}</td>
												<td class="title">
													<a href="./bobDetail.do?board_seq=${d.board_seq}" >${d.board_title}</a>
												</td>
												<td class="mobileHide">
												<fmt:parseDate value="${d.board_regdate}" var="bobDate" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate value="${bobDate}" pattern="yyyy.MM.dd"/>
												</td>
												<td class="mobileHide">
													${d.bob_count }
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
								<a href="./bobList.do?nowPage=1" class="btn-paging first"><span class="blind">맨 첫 페이지로 가기</span></a>
								<a href="./bobList.do?nowPage=${bpg.nowPage-3}" class="btn-paging prev"><span class="blind">이전 10개 보기</span></a>
								<c:forEach var="i" begin="${bpg.startPage }" end="${bpg.endPage }" step="1">
									<a href="./bobList.do?nowPage=${i}"><span class="<c:out value="${bpg.nowPage == i?'current':''}"/>"> ${i} </span></a>
								</c:forEach>
								<a href="./bobList.do?nowPage=${bpg.nowPage+3}" class="btn-paging next"><span class="blind">다음 10개 보기</span></a>
								<a href="./bobList.do?nowPage=${bpg.totalPage}" class="btn-paging last"><span class="blind">맨 마지막 페이지로 가기</span></a>
							</p>
					</div>
					<!-- //페이징 -->
					<!-- End Of the Real Contents-->
					<script type="text/javascript">
						function noticeRegForm() {
							location.href="./noticeRegForm.do";
						}
					</script>
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