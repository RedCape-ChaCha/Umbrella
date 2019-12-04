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
	eval("initMenu(2,1,0,0,0)");
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

					<div class="summaryDesc">
						<div class="innerBox">
							<h4 class="tit themeFC">신청 시 유의사항</h4>
							<ol class="dot-list">
								<li>접수시작 전에 접속한 경우에는 접수시간이 되면 반드시 새로고침(F5) 버튼을 눌러주세요.</li>
								
								<li>신청 및 취소는 로그인 후 가능하며 반드시 참석자 본인의 아이디로 로그인해야 합니다.</li>
								<!-- <li>한 대의 기기에서 두 개 이상의 아이디로 동시접속은 불가합니다.</li> -->
							</ol>
						</div>
					</div>
					<!-- 게시판 검색 -->
					<form name="searchForm" id="searchForm" method="get">
					<input type="hidden" name="searchCategory" value="" />
					<fieldset>
						<legend class="blind">문화행사 검색 영역</legend>
						<div class="pageSearch">
							<span class="item">
							</span>
							<span class="item">
							</span>
							<div class="schForm">
								<input type="text" name="searchKeyword" id="searchKeyword" value="" title="검색어 입력" class="schKwd" placeholder="검색어 입력" />
								<a href="#link" id="searchBtn" class="btn input search themeBtn2">검색</a>
							</div>
						</div>
					</fieldset>
					</form>
					<div class="lectureWrap">
						<ul class="lecture-list">
								<c:choose>
									<c:when test="${empty noLists}">
										<li>
											--- 작성된 글이 없습니다 ---
										</li>
									</c:when>
									<c:otherwise>
										<c:forEach var="d" items="${noLists}">
											<div class="lectureWrap">
												<ul class="lecture-list">
													<li>
														<p class="title">
															<span>${d.board_seq}</span>
															<a href="./noDetail.do?board_seq=${d.board_seq}" >${d.board_title}</a>
														</p>
														<ul class="info">
															<li class="applicant">
																<span>
																	<fmt:parseDate value="${d.board_regdate}" var="noticeDate" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate value="${noticeDate}" pattern="yyyy.MM.dd"/>
																</span>
															</li>
														</ul>
													</li>
												</ul>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
						</ul>
					</div>
					
					<!-- //게시판 목록 -->
					<!-- 페이징 -->
					<div class="pagingWrap">
							<p class="paging">
								<a href="./noList.do?nowPage=1" class="btn-paging first"><span class="blind">맨 첫 페이지로 가기</span></a>
								<a href="./noList.do?nowPage=${npg.nowPage-3}" class="btn-paging prev"><span class="blind">이전 10개 보기</span></a>
								<c:forEach var="i" begin="${npg.startPage }" end="${npg.endPage }" step="1">
									<a href="./noList.do?nowPage=${i}"><span class="current">${i}</span></a>
								</c:forEach>
								<a href="./noList.do?nowPage=${npg.nowPage+3}" class="btn-paging next"><span class="blind">다음 10개 보기</span></a>
								<a href="./noList.do?nowPage=${npg.totalPage}" class="btn-paging last"><span class="blind">맨 마지막 페이지로 가기</span></a>
							</p>
<%-- 							<c:if test="${user_grade eq 'A'}"> --%>
								<button class="btn write themeBtn" onclick="noticeRegForm()">글쓰기</button>							
<%-- 							</c:if> --%>
						
							
							
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

<iframe name="hiddenFrame" id="hiddenFrame" title="빈프레임" class="blind"></iframe>

</div>
<!-- //wrap -->
</body>

</html>