<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0">

<title>스마트 도서관</title>
<link rel="shortcut icon"
	href="../include/image/common/ico_sns_favicon.png">
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
<link rel="stylesheet" type="text/css"
	href="./booksearch/css/search.css" />
<script type="text/javascript" src="./booksearch/js/multilang2.js"></script>
<script type="text/javascript"
	src="./booksearch/js/jquery-ui-draggable.min.js"></script>



<script type="text/javascript">
	$(function() {
		eval("initMenu(1,1,0,0,0)");
	});
</script>


<script type="text/javascript">
	var siteCd = "yslib";
</script>
<script type="text/javascript">
	var activeElementName = "";
	$(function() {
		$("#resultA").hide(); 
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
						<div class="snsFarm"></div>
					</div>
					<div id="contents" class="contentArea">
					<!--Real Contents Start-->
					<div class="resultView">
						<!-- 도서 기본 정보-->
						<div class="resultViewDetail">
							<div class="tit clearfix">
								<span class="cate">도서 자료</span>
								<h4>${dto.book_name}</h4>
							</div>
							<div class="resultBookInfo">
								<div class="thumb">
									<div class="cover">
										<em class="tag"><img src="/include/booksearch/image/kdc/tag8.png" alt="문학"></em>
										<span class="img"><img class="bookCoverImg" src="https://s3.ap-northeast-2.amazonaws.com/rainbow.study/bookimg/${dto.book_img}" alt="${dto.book_name}"></span>
									</div>
								</div>
								<div class="bookDataWrap">
									<table class="bookInfoTbl">
										<caption>${dto.book_name}</caption>
										<colgroup>
										<col style="width:90px;">
										<col>
										</colgroup>
										<tbody>
												<tr>
													<th scope="row">저자사항</th>
													<td> ${dto.book_writer}</td>
												</tr>
												<tr>
													<th scope="row">출판사</th>
													<td> ${dto.book_publisher}</td>
												</tr>
												<tr>
													<th scope="row">분류기호</th>
													<td> ${dto.book_number} </td>
												</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="resultBookDesc">
						</div>
						<!-- //도서 기본 정보 -->
						<!-- 소장정보 -->
						<h5 class="bookTitle">소장정보</h5>
<div class="tblWrap mobileHide2">
	<table class="tbl hasLibrary">
		<caption>${dto.book_name}</caption>
		<colgroup>
				<col class="col_check" style="width:45px">
			<col class="col_state">
			<col class="col_callno">
			<col class="col_standardno">
			<col class="col_return">
			<col class="col_room">
				<col class="col_annex">
				<col class="col_reservation">
				<col class="col_doorae">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">대출상태</th>
				<th scope="col">청구기호</th>
				<th scope="col">자료등록일</th>
				<th scope="col">보관 상태</th>
				<th scope="col">도서예약</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="bdto" items="${lists}" varStatus="status">
					<tr>
						<td>${status.count}</td>
					<td>
					<c:choose>
					<c:when test="${bdto.condition_borrow eq 'N'}">
						대출가능
					</c:when>
					<c:otherwise>
						대출불가
					</c:otherwise>
					</c:choose>
					</td>
					<td>
						${bdto.book_aseq}
					</td>
					<td>
					${bdto.book_date}
					</td>
					<td>
					<c:choose>
					<c:when test="${bdto.condition_storage eq 'N'}">
						보관 양호
					</c:when>
					<c:otherwise>
						파기
					</c:otherwise>
					</c:choose>
					</td>
					
						<td>
										<c:choose>
					<c:when test="${bdto.condition_borrow eq 'N'}">
									<span class="tblBtn tB04">예약불가</span>
					</c:when>
					<c:otherwise>
									<span class="tblBtn tB04">예약가능</span>
					</c:otherwise>
					</c:choose>
						</td>
				</tr>
				</c:forEach>			
		</tbody>
	</table>
</div>
						
						
						<div class="btnGroup">
						<a href="javascript:history.back()" id="listBtn" class="btn white">목록으로</a>
						</div>
						<!-- //소장정보 -->
						<!-- 도서통계정보 -->
						<!-- //도서통계정보 -->
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