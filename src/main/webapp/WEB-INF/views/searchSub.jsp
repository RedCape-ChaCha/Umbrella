<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
<link rel="stylesheet" type="text/css" href="./booksearch/css/search.css" />
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
				eval("initMenu(1,2,0,0,0)");
			});
		</script>
	

<script type="text/javascript">
var siteCd = "yslib";
</script>

<script type="text/javascript">
	window.onload=function(){
	 $.getJSON("./booksearch/json/subdata.json",function(key,val){
		 for (var i = 0; i < key.length; i++) {
			key
		}
					 $("#jsonkeylist").append("<ol id=\"kdcDepth2List_0\" class=\"kdcDepth2List clearfix\">\r\n" + 
								"									\r\n" + 
								"										<li>\r\n" + 
								"											<dl>\r\n" + 
								"												<dt><a href=\"#btn\" id=\"00\" title=\"00 총류\">00 총류</a></dt>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"000\" title=\"000 총류\">000 총류</a></dd>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"001\" title=\"001 지식,학문일반\">001 지식,학문일반</a></dd>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"003\" title=\"003 시스템\">003 시스템</a></dd>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"004\" title=\"004 컴퓨터 과학\">004 컴퓨터 과학</a></dd>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"005\" title=\"005 프로그래밍, 프로그램, 데이터\">005 프로그래밍, 프로그램, 데이터</a></dd>\r\n" + 
								"												\r\n" + 
								"													<dd><a href=\"#btn\" id=\"007\" title=\"007 연구일반 및 방법론\">007 연구일반 및 방법론</a></dd>\r\n" + 
								"												\r\n" + 
								"											</dl>\r\n" + 
								"										</li>\r\n"+ 
								"								</ol>");
	 });
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
	<div class="snsFarm">
	</div>
</div>
				<div id="contents" class="contentArea">
					<!--Real Contents Start-->
<form id="searchForm" name="searchForm" method="post">

						<div class="kdcSearch">
							<ul id="kdcDepth1List" class="kdcDepth1List clearfix">
								
									<li class="kdc0">
										<a href="#btn" id="0" class="choiced">
										<span class="ico"></span>
										</a>
										<span class="txt">총류</span>
									</li>
								
									<li class="kdc1">
										<a href="#btn" id="1" ><span class="ico"></span></a>
										<span class="txt">철학</span>
									</li>
								
									<li class="kdc2">
										<a href="#btn" id="2" ><span class="ico"></span></a>
										<span class="txt">종교</span>
									</li>
								
									<li class="kdc3">
										<a href="#btn" id="3" ><span class="ico"></span></a>
										<span class="txt">사회과학</span>
									</li>
								
									<li class="kdc4">
										<a href="#btn" id="4" ><span class="ico"></span></a>
										<span class="txt">자연과학</span>
									</li>
								
									<li class="kdc5">
										<a href="#btn" id="5" ><span class="ico"></span></a>
										<span class="txt">기술과학</span>
									</li>
								
									<li class="kdc6">
										<a href="#btn" id="6" ><span class="ico"></span></a>
										<span class="txt">예술</span>
									</li>
								
									<li class="kdc7">
										<a href="#btn" id="7" ><span class="ico"></span></a>
										<span class="txt">언어</span>
									</li>
								
									<li class="kdc8">
										<a href="#btn" id="8" ><span class="ico"></span></a>
										<span class="txt">문학</span>
									</li>
								
									<li class="kdc9">
										<a href="#btn" id="9" ><span class="ico"></span></a>
										<span class="txt">역사</span>
									</li>
								
							</ul>
							<div id="jsonkeylist"></div>
								
							
						</div>
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

<iframe name="hiddenFrame" id="hiddenFrame" title="빈프레임" class="blind"></iframe>

</div>
<!-- //wrap -->
</body>

</html>