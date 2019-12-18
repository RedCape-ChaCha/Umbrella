<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
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
		/* 		$("input[type=text]").keypress();
		 $("input[type=text]").focus(); 
		 $("select[name=searchSort]").click();
		 $("select[name=searchOrder]").hide();*/
		$("#resultA").hide(); 
	});
	

	function searchDetail() {
		var keyword =document.getElementById("searchKeyword").value;
		var key =document.getElementById("searchKey").options[document.getElementById("searchKey").selectedIndex].value;
		var Btext=document.getElementById("Btext");
		if(keyword==""||keyword==null){
			alert("검색어를 입력해 주세요");
		}else{
			if(Btext.value!=""||Btext.value!=null){
				Btext.setAttribute("value","");
			}
			fnSearchKdc("./bookSelectStorageA.do?"+key+"="+keyword);
			Btext.setAttribute("value",key+"="+keyword);
		}
	}
	function searchAddDetail() {
		var keyword =document.getElementById("searchKeyword").value;
		var key =document.getElementById("searchKey").options[document.getElementById("searchKey").selectedIndex].value;
		var Btext=document.getElementById("Btext");
		if(keyword==""||keyword==null){
			alert("검색어를 입력해 주세요");
		}else if(Btext.value.split("=")[0]==key){
			alert("같은 키워드의 상세검색은 지원되지 않습니다");
		}else{
			fnSearchKdc("./bookSelectStorageA.do?"+key+"="+keyword+"&"+Btext.value);
		}
	}

	function fnSearchKdc(val){
		var url=val;
		httpRequest=new XMLHttpRequest();
		httpRequest.onreadystatechange=function(){
			if (httpRequest.readyState==4) {
				if(httpRequest.status==200){
					if(httpRequest.responseText.length>0){
						var data=JSON.parse(httpRequest.responseText);
						var result=document.getElementById("resultA");
						if(data.lists.length>0){
							result.innerHTML+="<ul class=\"resultList imageType\" id=\"resultList1\"></ul>";
							var res=document.getElementById("resultList1");
							res.innerHTML="";
							for (var i = 0; i < data.lists.length; i++) {
							res.innerHTML+="<li>\n" + 
							"					<dl class=\"bookDataWrap\">\n" + 
							"						<div class=\"thumb\">\n" + 
							"							<a href=\"#link\" onclick=\"javascript:fnSearchResultDetail(661088,1311141,'BO'); return false;\" class=\"cover\">\n" + 
							"								<em class=\"tag\"></em>\n" + 
							"								<span class=\"img\"><img class=\"bookCoverImg\" src=\""+data.lists[i].book_img+"\" alt=\""+data.lists[i].book_name+"\"></span>\n" + 
							"							</a>\n" + 
							"						</div>\n" + 
							"						<dt class=\"tit\">\n" + 
							"							<span class=\"cate\">도서</span>\n" + 
							"							<a href=\"#link\" onclick=\"javascript:fnSearchResultDetail(661088,1311141,'BO'); return false;\">"+data.lists[i].book_name+"</a>\n" + 
							"						</dt>\n" + 
							"						<dd class=\"author\">\n" + 
							"							<span>저자 : "+data.lists[i].book_writer+"</span>\n" + 
							"							<span>발행자: "+data.lists[i].book_publisher+"</span>\n" + 
							"						</dd>\n" + 
							"						<dd class=\"data\">\n" + 
							"								<span>ISBN: 8971994207</span>\n" + 
							"								<span>\n" + 
							"									청구기호: "+data.lists[i].book_number+ 
							"								</span>\n" + 
							"						</dd>\n" + 
							"						<dd class=\"site\">\n" + 
							"						</dd>\n" + 
							"					</dl>\n" + 
							"					<div class=\"bookStateBar clearfix\">\n" + 
							"						<p class=\"txt\">\n" + 
							"						</p>\n" + 
							"						<div class=\"stateArea\">\n" + 
							"											<span class=\"state typeC\"><span class=\"ico\"></span> 도서예약</span>\n" + 
							"								<a href=\"#wishbook\"  class=\"state typeA\"><span class=\"ico\"></span> 웹도서대출</a>\n" + 
							"						</div>\n" + 
							"					</div>\n" + 
							"				</li>";
							if(i!=0&&i%9==0){
								result.innerHTML+="<ul class=\"resultList imageType\" id=\"resultList"+(Math.ceil(i/10)+1)+"\"  style=\"display: none;\"></ul>";
								res=document.getElementById("resultList"+(Math.ceil(i/10)+1));
								res.innerHTML="";
							}
							
							}
							result.innerHTML+="<div class=\"pagingWrap\">\n" + 
							"							<p class=\"paging\"id=\"pagingNum\">\n" + 
							"							</p>\n" + 
							"          </div>";
									var num=document.getElementById("pagingNum");
										num.innerHTML="";
										num.innerHTML+="<a  class=\"btn-paging first\" onclick=\"pageMove(1)\"></a>\n" + 
										"<a  class=\"btn-paging prev\"></a>\n";
									for (var j = 0; j < Math.ceil(data.lists.length/10); j++) {
										if(j==1){
											num.innerHTML+="<a onclick=\"pageMove("+j+")\"><span class=\"current\">"+(j+1)+"</span></a>\n";
										}else{
											num.innerHTML+="<a onclick=\"pageMove("+j+")\"><span>"+(j+1)+"</span></a>\n";
										}	
									}
									num.innerHTML+="<a  class=\"btn-paging next\" ></a>\n" + 
													"<a  class=\"btn-paging last\" onclick=\"pageMove("+Math.ceil(data.lists.length/10)+")\"></a>\n";
						}else{
							result.innerHTML+="<ul class=\"resultList imageType\" id=\"resultList1\"></ul>";
							var res=document.getElementById("resultList1");
							res.innerHTML="";
							res.innerHTML+="<li style=\"text-align: center;\">\r\r---해당 되는 도서가 없습니다---</li>";
						}
					}
				}else{
					alert("error");
				}
			}
		}
		httpRequest.open("post", url, true);
		httpRequest.send();
		$("#result").hide();
		$("#resultA").show();
		return false;
	}
	
function pageMove(val) {
	var pagediv=document.getElementById("resultA");
	var ndList=pagediv.getElementsByTagName("ul");
	for (var i = 0; i < ndList.length; i++) {
			if(i==val){
			ndList[i].style.display="block";	
			}else{
			ndList[i].style.display="none";
			}
	}
}
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

						<!--Forced tab Show Que-->
						<div class="tabNav">
							<div class="virtSelect">
								<a href="#script">탭메뉴</a>
							</div>
							<ul class="tnb clearfix">
								<li></li>
							</ul>
						</div>
						<!--Forced tab Show Que-->
						<!--Real Contents Start-->
							<c:if test="${bdto ne null }">
							<input type="hidden" name="Bdto" value="${bdto}"> 
							</c:if>
							<input type="hidden" name="Btext" id="Btext" value=""> 
							
							<div class="detailSearchFrom" >
								<div class="detailSearch">
									<div class="searchFormArea">
										<table class="detailSearchTbl">
											<caption>상세검색 양식 작성</caption>
											<colgroup>
												<col style="width: 70px" />
												<col />
											</colgroup>
											<tr>
												<th scope="row" rowspan="4">검색항목</th>
												<td>
													<div class="fnInputBox">
														<select id="searchKey" name="searchKey" title="검색 항목 선택"
															class="form-ele fix">
															<option value="book_name" selected="selected">서명</option>
															<option value="book_writer">저자</option>
															<option value="book_publisher">발행자</option>
															<option value="isbn">ISBN</option>
														</select> 
														<input type="text" id="searchKeyword"name="searchKeyword" title="검색어 입력"class="form-ele full" />
													</div>
												</td>
											</tr>
										</table>
										<div class="ta_c" style="margin-top: 10px;">
											<a href="#btn" id="searchBtn" class="btn search themeBtn" onclick="searchDetail()">자료검색</a>
											<a href="#btn" id="resetBtn" class="btn reset" onclick="searchAddDetail()">결과내 재검색</a>
											<a href="#btn" id="resetBtn" class="btn search themeBtn" onclick="searchAddDetail()">네이버 검색</a>
										</div>
									</div>
								</div>
							</div>
						<c:if test="${lists ne null }">
							<div id="result">
								<div class="resultFilter clearfix" style="margin-top: 10px;">
									<div class="sort">
										<select name="searchSort" id="searchSort" class="resultSelect"
											title="정렬방식 선택">
											<option value="SIMILAR" selected="selected">정확도순</option>
											<option value="KEY">등록일</option>
											<option value="TITLE">서명</option>
											<option value="AUTHOR">저자</option>
											<option value="PUBLISHER">발행자</option>
											<option value="PUBLISHYEAR">발행연도</option>
										</select> <select name="searchOrder" id="searchOrder"
											class="resultSelect" title="정렬순서 선택" style="display: none">
											<option value="DESC" selected="selected">내림차순</option>
											<option value="ASC">오름차순</option>
										</select>
									</div>
									<select name="searchRecordCount" id="searchRecordCount"
										class="resultSelect" title="출력 건수 선택">
										<option value="10" selected="selected">10건</option>
										<option value="20">20건</option>
										<option value="30">30건</option>
										<option value="40">40건</option>
										<option value="50">50건</option>
									</select> <a href="#btn" id="sortBtn" class="btnGo">확인</a>
								</div>
								<ul class="resultList imageType" id="resultList">


								</ul>
							</div>
						</c:if>
							<div id="resultA">
								<div class="resultFilter clearfix" style="margin-top: 10px;">
									<div class="sort">
										<select name="searchSort" id="searchSort" class="resultSelect"
											title="정렬방식 선택">
											<option value="SIMILAR" selected="selected">정확도순</option>
											<option value="KEY">등록일</option>
											<option value="TITLE">서명</option>
											<option value="AUTHOR">저자</option>
											<option value="PUBLISHER">발행자</option>
											<option value="PUBLISHYEAR">발행연도</option>
										</select> <select name="searchOrder" id="searchOrder"
											class="resultSelect" title="정렬순서 선택" style="display: none">
											<option value="DESC" selected="selected">내림차순</option>
											<option value="ASC">오름차순</option>
										</select>
									</div>
									<select name="searchRecordCount" id="searchRecordCount"
										class="resultSelect" title="출력 건수 선택">
										<option value="10" selected="selected">10건</option>
										<option value="20">20건</option>
										<option value="30">30건</option>
										<option value="40">40건</option>
										<option value="50">50건</option>
									</select> <a href="#btn" id="sortBtn" class="btnGo">확인</a>
								</div>

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