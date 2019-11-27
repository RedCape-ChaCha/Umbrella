(function($){
	$.fn.fnCheckImageLoad = function(){
		if(((navigator.appName == 'Netscape' && navigator.userAgent.toLowerCase().indexOf('trident') != -1) || (navigator.userAgent.toLowerCase().indexOf("msie") != -1))){
			$(this).imagesLoaded().progress( function( instance, image ) {
				if(image.isLoaded){
					if(image.img.src.indexOf("/include/") == -1){
						$.post("/cmmn/image/getImageBicubic.do", {"imgUrl": $(image.img).attr("src"), "width": $(image.img).width(), "height": $(image.img).height()}, function(data){
							image.img.src = data.imgUrl;
						}, "json").fail(function() {
							fnImageLoadError(image.img);
						});
					}
				}else{
					fnImageLoadError(image.img);
				}
			});
		}else{
			$(this).on("error", function(){
				fnImageLoadError(this);
			});
		}
	};
}(jQuery));

function fnCheckAll(){
	if(this.checked){
		$("input[name=check]").each(function(){
			$(this).prop("checked", true);
		});
	}else{
		$("input[name=check]").each(function(){
			$(this).prop("checked", false);
		});
	}
}


//관심도서등록
function fnBasketRegist(speciesKey, bookKey, publishFormCode){
	$.ajax({
		type:"POST",
		url: "/basket/basketRegistProc.do",
		data : {"speciesKey" : speciesKey, "bookKey" : bookKey, "publishFormCode" : publishFormCode },
		dataType : 'json',
		success: function(data){
			alert(data.msg);
		},
		error : function(request, status, error) {
			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
		}
	});
}

//관심도서배치등록
function fnBasketRegistBatch(){
	if($("input[name=check]:checked").size() == 0){
		alert("자료를 선택하세요.");
		return false;
	}

	var jsonArr = [];
	$("input[name=check]:checked").each(function(){
		var data = $(this).val().split("^");
		jsonArr.push({
			speciesKey: data[0],
			bookKey: data[1],
			publishFormCode: data[2]
		});
	});

	$.ajax({
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		type:"POST",
		url: "/basket/basketRegistBatchProc.do",
		data : jQuery.stringify(jsonArr),
		dataType : 'json',
		success: function(data){
			alert(data.msg);
		},
		error : function(request, status, error) {
			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
		}
	});

	return false;
}


//대출예약신청
function fnLoanReservationApply(regCode, regNo, manageCode, publishFormCode) {
	if(confirm("도서예약을 신청하시겠습니까?")){
		$.ajax({
			type:"POST",
			url: "/loan/reservationApplyProc.do",
	        data : {"regCode" : regCode, "regNo" : regNo, "manageCode" : manageCode, "publishFormCode" : publishFormCode},
			dataType : 'json',
			success: function(data){
				alert(data.msg);
			},
			error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}
}

//텍스트출력
function fnExportTextBook() {
	if($("input[name=check]:checked").size() == 0){
		alert("자료를 선택하세요.");
		return false;
	}

	var form = document.searchForm;
	form.action = "/kolaseek/search/exportTextBookList.do";
	form.submit();

	return false;
}

//엑셀출력
function fnExportExcelBook(){
	if($("input[name=check]:checked").size() == 0){
		alert("자료를 선택하세요.");
		return false;
	}

	var form = document.searchForm;
	form.action = "/kolaseek/search/exportExcelBookList.do";
	form.submit();

	return false;
}

//책이음상호대차신청팝업
/*function fnLibraryOneApplyPop(siteCd, libcode, specieskey, localkey, regno){
	var url = "/libraryoneApply/" + siteCd + "/libraryOneApplyPop.do?libcode=" + libcode + "&specieskey=" + specieskey + "&localkey=" + localkey + "&regno=" + regno;
	var objwin = window.open(url, "libraryOneLillApplyPop", "resizable=no, status=no, scrollbars=no, toolbar=no, menubar=no, width=500px, height=640px");
	objwin.focus();
}*/

//책두레상호대차신청팝업
function fnDooraeApplyPop(siteCd, manageCode, regNo){
	var url = "/"+siteCd+"/doorae/dooraeLillApplyPop.do?manageCode=" + manageCode + "&regNo=" + regNo;
    var objwin = window.open(url, "dooraeLillApplyPop", "resizable=no, status=no, scrollbars=no, toolbar=no, menubar=no, width=500px, height=610px");
    objwin.focus();
}

//U도서관신청팝업
function fnUnmannedApplyPop(siteCd, manageCode, regNo){
	var url = "/"+siteCd+"/doorae/uLibraryLillApplyPop.do?manageCode=" + manageCode + "&regNo=" + regNo;
    var objwin = window.open(url, "uLibraryLillApplyPop", "resizable=no, status=no, scrollbars=no, toolbar=no, menubar=no, width=500px, height=610px");
    objwin.focus();
}

//청구기호출력팝업
function fnCallNoPrintPop(siteCd, bookKey, publishFormCode, printType){
	var url = "/kolaseek/popup/callNoPrintPop.do?publishFormCode="+publishFormCode+"&bookKey="+bookKey+"&siteCd="+siteCd;
	var height = ", height=420px";
	if(printType == "LABEL"){
		var height = ", height=200px";
	}
    var objwin = window.open(url, "callNoPrintPop", "resizable=no, status=no, scrollbars=no, toolbar=no, menubar=no, width=400px" + height);
    objwin.focus();
}

function fnImageLoadError(img) {
	img.src = "/include/booksearch/image/kdc/noimg.png";
}
