function initMenu(n1,n2,n3,n4,n5){
	var n1 = n1-1;
	var n2 = n2-1;
	var n3 = n3-1;
	var n4 = n4-1;
	var n5 = n5-1;
	var page = (n1 < 0) ? "main" : "sub";

	//wrap
	var $wrap = $("#wrap");

	//gnb 정보
	var $gnb = $("#gnb");

	//해당 뎁스의 gnb정보
	var gnbData = gnbDataPush($gnb);
	var depth2Data = getNavi([n1]);
	var depth3Data = getNavi([n1,n2]);
	var depth4Data = getNavi([n1,n2,n3]);
	var depth5Data = getNavi([n1,n2,n3,n4]);
	//현재위치
	var nowGnbData = getNavi([n1,n2,n3,n4,n5],true);

	//반응형 체크
	var defWidth = 1024;
	var mobileChk = ($wrap.width() < defWidth) ? true : false;

	//선언
	var $gnbList = $gnb.children();
	var $gnbBg = $("#submenuArea");
	var $gnbListFirst = $gnbList.eq(0).children("a");
	var $gnbListLast = $gnbList.eq($gnbList.length-3); //회원정보, 이용안내 제외
	var $blackBg = $("#blackBG");
	var $searchBox = $("#topSearchForm");
	var $mobileOpen = $("#mobileIndexOpen");
	var $mobileClose = $("#mobileIndexClose a");
	var $searchBtn = $('#btnSearchTop');
    var $searchClose = $('#searchTopClose');
	var $tab = "";
	var $contents = $("#contens");
	var $naviTit = $(".naviandtitle > h3");
	var tabNumChk = 0;
	var prevViewNum = 0;
	var mobileGnbTimer = 0;
	var searchTimer = 0;
	var btnTotalTimer = 0;
	var snsTimer = 0;
	var resizeTimer2 = 0;
	var docTitle = document.title;
	var $btnTotal = $(".btnTotal > a");
	var $snsBtn = $(".snsShortcut");

	//*** 레이아웃 설정 시작 ***//

	//모바일 메뉴 생성
	if(mobileChk){
		resizeTimer2 = 1;
		gnbMobile($gnb);
	}else{
		resizeTimer2 = 2;
		gnbPc($gnb);
	}

	//메인페이지
	if(page == "main"){

	}
	//서브페이지
	else{

		//타이틀 태그 변경
		nowPageTit({
			"basicTit" : docTitle //기본 출력되는 이름
		});

		//현재 GNB에 클래스 부여
		if(n1 >= 0) gnbData[n1]["obj"].parent().addClass("fbC");
		if(n2 >= 0) depth2Data[n2]["obj"].addClass("current");
		if(n3 >= 0) depth3Data[n3]["obj"].addClass("current");

		//서브 타이틀
		$naviTit.text(nowGnbData["text"]);

		//네비게이션
		$naviTit.siblings(".navi").html(navi({
			"homeIcon" : "<a href='" + $("#logo > a").attr("href") + "'><span class='blind'>홈으로 가기</span></a>",
			"hideTemplate" : ["<span>","</span>"],
			"nowCont" : ["<strong>","</strong>"]
		}));

		if(!mobileChk){

			//LNB 생성
			$("#lnbNav > h2").html(gnbData[n1]["obj"].html());
			//2뎁스, 하위메뉴 출력
			$("#lnb").html(makeList(depth2Data,false,n2,n3));

		}

		//MkTab class를 가지고 있다면 탭 생성
		if(nowGnbData["class"] && nowGnbData["class"].indexOf("MkTab") > -1){
			var tabData = "";
			if(depth5Data){
				tabData = depth5Data;
			}else if(depth4Data){
				tabData = depth4Data;
			}else if(depth3Data){
				tabData = depth3Data;
			}else{
				console.log("잘못된 탭 생성입니다.");
			}
			makeTab({
				"tabData" : tabData,
				"$tabWrap" : $(".tabNav"),
				"$tab" : $(".tnb")
			});
		} //-- 탭생성 끝 --//

		//사이트맵 추가
		$("#sitemap").html(makeList(gnbData,true,n1,n2,n3));

		//게시판 caption 추가
		//주소에 bbsList.do, bbsList.do, bbsWrite.do (게시판) 일 경우
		var thisHref = location.href;
		if(thisHref.indexOf("bbsPostList.do") >= 0 || thisHref.indexOf("bbsPostDetail.do") >= 0 || thisHref.indexOf("bbsPostRegist.do") >= 0 || thisHref.indexOf("bbsPostUpdate.do") >= 0){
			captionOverWrite(thisHref);
		}

		function captionOverWrite(href){
			//게시판 테이블이 board-list, board-view class를 가지기 때문에 이걸로 구분
			$("table").each(function(){
				var $this = $(this);
				var $iR = $this.find("td.content").find("img");
				if($iR.attr("alt") >= 0){
				   $iR.attr("alt","하단내용참조");
				}
				//board를 포함하는 table이라면 caption 추가
				if($this.attr("class") && $this.attr("class").indexOf("board") >= 0){
					var $caption = $this.find("caption");
					var str = "";
					$this.find("th").each(function(e){
						if(e != 0) str += ", ";
						str += $(this).text();
					});
					var str_strong,str_p;
					if(href.indexOf("bbsPostList.do") >= 0){
						str_strong = nowGnbData["text"] + " 게시글 목록";
						str_p = str + " 제공 표";
					}else if(href.indexOf("bbsPostDetail.do") >= 0){
						str_strong = nowGnbData["text"] + " 게시글 상세정보";
						str_p = str + " 제공 표";
					}else if(href.indexOf("bbsPostRegist.do") >= 0){
						str_strong = nowGnbData["text"] + " 입력 양식";
						str_p = nowGnbData["text"] + " 게시판의 글 쓰기 내용을 " + str + "의 항목별로 해당하는 내용을 필수항목과 선택항목으로 구분하여 입력 가능합니다.";
					}else if(href.indexOf("bbsPostUpdate.do") >= 0){
						str_strong = nowGnbData["text"] + " 양식 수정";
						str_p = nowGnbData["text"] + " 게시판의 글 쓰기 내용을 " + str + "의 항목별로 해당하는 이미 입력된 내용을 수정 할 수 있습니다.";
					}
					$caption.html("");
					$caption.append("<strong>" + str_strong + "</strong>");
					$caption.append("<p>" + str_p + "</p>");
				}
			});
		}

		//컨텐츠 내용이 없을 때 준비중입니다 안내
		var contentsInfo = $('#contents').html();
		if(contentsInfo && contentsInfo.length < 400) {
			$('.contents').append("<p style='text-align:center'><img src='/include/image/common/waiting.jpg' alt='죄송합니다. 현재 서비스를 준비중입니다.'></p>");
		}

	} //-- 서브 끝 --//

	//** 메인,서브 공통 시작 **//

	//페이지 상관없이 탭 사용 할 수 있게끔
	if(!nowGnbData["class"] || nowGnbData["class"].indexOf("MkTab") < 0){
		$(".tabNav").each(function(){
			var $this = $(this);
			var $tab = $this.children(".tnb");
			var $tabList = $tab.children();
			if($tabList.size() > 1){
				$this.show();
				tabChange($tab,mobileChk);
				tabNumChk = 1;
			}
		});
	}

	// 검색창 열기/닫기
	$searchBtn.click(function(e){
		e.preventDefault();
		if(searchTimer == 0){
			searchTimer = 1;
			$blackBg.css("z-index",666).stop().fadeIn(300);
			$searchBox.stop().fadeIn(300);
            $searchBtn.hide();
            $searchClose.show();
        	$mobileClose.click();
		}else{
			$blackBg.stop().fadeOut(300).css("z-index","");
			$searchBox.stop().fadeOut(300);
			searchTimer = 0;
            $searchBtn.show();
            $searchClose.hide();
        	$mobileClose.click();
		}
	});

    $searchClose.click(function(e){
        e.preventDefault();
        $searchBtn.click();
    });

    $blackBg.click(function(e){
        e.preventDefault();
        $mobileClose.click();
        if(mobileGnbTimer == 0) $searchClose.click();
    });

	//상단으로 이동
	$("#btnTopScroll").click(function(){
		$("body,html").animate({scrollTop:0},300);
		return false;
	});
	$(window).scroll(function(){
		var scT = $(this).scrollTop();
		if (scT > 1) {
			$("#btnTopScroll").css("display","block");
			if(searchTimer == 1){
				$searchClose.click();
				$blackBg.stop().fadeOut(300)
			}
		}else {
			$("#btnTopScroll").css("display","none");
		}
	});

	//--- 레이아웃 설정 끝 ---//

	//** 이벤트 등록 시작 **//

	//gnb 마우스 오버/포커스 이벤트
	function gnbPc($gnb){

		//초기화
		$("#siteMenu").append($snsBtn);
		$gnb.find("a").off();
		$gnb.find(".open").removeClass("open");
		$gnb.find(".subMain").remove();
		$gnb.find(".link").each(function(){
			var $this = $(this);
			var href = $this.attr("data-href");
			$this.attr("href",href).removeAttr("data-href").removeClass("link");
		});
		$gnb.parent().attr("id","gnbNav");
		$gnb.attr("id","gnb");

		$gnbList.on({
			mouseover : function(){
				var $this = $(this);
				$this.addClass("fbl").siblings().removeClass("fbl");
				gnbShow();
			},
			mouseleave : function(){
				gnbHide();
			}
		});

		$gnbList.children("a").on({
			focusin : function(){
				var $this = $(this).parent();
				$this.addClass("fbl").siblings().removeClass("fbl");
				gnbShow();
			}
		});

		if($gnbListLast.children("ul").children().length > 1){
			$gnbListLast = $gnbListLast.children("ul").children();
			$gnbListLast = $gnbListLast.eq($gnbListLast.length-1).children("a");
		}else{
			$gnbListLast = $gnbListLast.children("a");
		}

		$gnbListFirst.keydown(function(e){
			//shift + tab 눌렸을때
			var key = e.keyCode;
			if(key == 9 && e.shiftKey == true) gnbHide();
		});

		$gnbListLast.on({
			keydown : function(e){
				//tab키
				var key = e.keyCode;
				if(key == 9 && e.shiftKey == false) gnbHide();
			},
			focusin : function(){
				gnbShow();
			}
		});

		//전체메뉴보기 버튼이 존제할 때 버튼과 메뉴 나타냄 처리 부분
		 $btnTotal.click(function(){
			var $this = $(this);
			$gnbBg.removeClass("divide");
			if($gnbBg.css("display") == "block"){
				gnbHide();
			}else{
				$this.addClass("on");
				gnbShow();
			}
			return false;
		});

		function gnbShow(){
			$gnb.css("overflow","visible");
			$gnbList.children("ul").show();
			$gnbBg.show();
		}

		function gnbHide(){
			$gnb.css("overflow","hidden");
			$gnbList.children("ul").hide();
			$gnbList.removeClass("fbl");
			$gnbBg.hide();
		}

		$(window).scroll(function(){
			var top = $("html").scrollTop() || $("body").scrollTop();
			var tpHight = $(".topPopupWrap").height();
			var tpLength = $(".topPopupWrap").length;
			
			if(tpLength == 1) {
				if(top >= 186){
					$gnb.parent().addClass("fixed");
				}else {
					$gnb.parent().removeClass("fixed");
				}
			} if(tpLength == 2) {
				if(top >= 245){
					$gnb.parent().addClass("fixed");
				}else {
					$gnb.parent().removeClass("fixed");
				}
			} else {
				if(top >= 128){
					$gnb.parent().addClass("fixed");
				}else {
					$gnb.parent().removeClass("fixed");
				}
			}
			
		});
	}

	//모바일 메뉴 2,3뎁스 열기/닫기 이벤트를 위한 링크 정리, 이벤트 등록
	function gnbMobile($mobileGnb){

		//초기화
		$gnbList.off();
		$gnbList.children("a").off();

		var $mobileWrap = $gnb.parent();
		$mobileWrap.attr("id","gnbNavM");
		$gnb.attr("id","gnbM");

		//모바일 메뉴 열기/닫기, 검색창 열기/닫기
		$mobileGnb.find("li").each(function(){
			var $this = $(this);
			if($this.children().length > 1){
				var $btn = $this.children("a");
				var $list = $this.children("ul");
				var href = $btn.attr("href");
				if(!$list.hasClass("MkTab")){
					$btn.attr({"href":"#link","data-href":href}).addClass("link");
					$btn.click(function(){
                        var $siblings = $this.siblings("li");
                        $siblings.find("ul").stop().slideUp(100,function(){
                            $siblings.removeClass("open").find("li").removeClass("open");
                        });
                        if(!$this.hasClass("open")){
                            $this.addClass("open");
                            $list.stop().slideDown(100);
                        }else{
                            $list.stop().slideUp(100,function(){
                                $this.removeClass("open");
                            });
                        }
                        if(!$this.hasClass("fbC")){
                            $this.addClass("fbC");
                            $siblings.removeClass("fbC");
                        }
                        return false;
                    });
				}
			}
		});

		$mobileOpen.click(function(e) {
			e.preventDefault();
			mobileGnbTimer = 1;
			if(searchTimer == 0) $blackBg.stop().fadeIn(300);
			if(searchTimer == 1){
				$searchClose.click();
				$blackBg.stop().fadeIn(300)
			}
			$mobileWrap.show().stop().animate({"left":0},300);
		});

		$mobileClose.click(function(e){
			e.preventDefault();
			if(searchTimer == 0) $blackBg.stop().fadeOut(300);
			$mobileWrap.stop().animate({"left":-$mobileWrap.width() + "px"},300,function(){
				$mobileWrap.hide();
				mobileGnbTimer = 0;
			});
		});
		$("#footer").append($snsBtn);
	}

	//celljustify 균등
	$(".celljustify").each(function(index, element) {
		var elem1 = $(this).children("li");
		elem1.css("width",100/elem1.length+"%");
		elem1.eq(0).css("width","auto");
	});

	//sns 공유하기 애니메이션
	var btnSnsGroup = $("#snsGroup");
	var btnRight = $(".snsFarm .snsBtnArea").width();
	$(".snsFarm #sns").click(function(e){
		e.preventDefault();
		if(snsTimer == 0){
			snsTimer = 1;
			btnSnsGroup.css("display","inline-block");
			btnSnsGroup.stop().animate({right:btnRight + "px", opacity:1},"fast");
		}else{
			btnSnsGroup.stop().animate({right:-btnRight + "px", opacity:0},"slow",function(){
				snsTimer = 0;
				btnSnsGroup.css("display","none");
			});
		}
	})

	//FAQ에서 질문열림 처리 함수 sendview() 이건 컨텐츠에서 호출되는 함수
	window.sendview = function(value){
		if(prevViewNum != ""){
			var prevCont = document.getElementById("answer_" + prevViewNum);
			prevCont.style.display = "none";
			prevCont.parentNode.className = "";
		}
		var cont = document.getElementById("answer_" + value);
		cont.style.display = "";
		cont.parentNode.className = "on";
		prevViewNum = value;
	}

	$(window).resize(function(){
		var width = $("#wrap").width();
		//모바일
		if(width < defWidth && (resizeTimer2 == 0 || resizeTimer2 == 2)){
			if(tabNumChk == 1){
				$(".tabNav").each(function(){
					var $this = $(this);
					$tab = $this.children(".tnb");
					var $tabList = $tab.children();
					if($tabList.size() > 1){
						tabChange($tab,true);
					}
				});
			}else{
				if($tab) tabChange($tab,true);
			}
			gnbMobile($gnb);
			resizeTimer2 = 1;
		}
		//pc
		else if(width >= defWidth && (resizeTimer2 == 0 || resizeTimer2 == 1)){
			if(tabNumChk == 1){
				$(".tabNav").each(function(){
					var $this = $(this);
					$tab = $this.children(".tnb");
					var $tabList = $tab.children();
					if($tabList.size() > 1){
						tabChange($tab,false);
					}
				});
			}else{
				if($tab) tabChange($tab,false);
			}
			gnbPc($gnb);
			resizeTimer2 = 2;
		}
	});

	//-- 이벤트 등록 끝 --//

	//탭 생성
	function makeTab(obj){
		var $tabWrap = obj["$tabWrap"];
		$tab = obj["$tab"];
		var obj = obj["tabData"];
		var tab = "";
		var tabLength = obj.length;
		for(var i=0;i<tabLength;i++){
			var tag = obj[i]["obj"];
			if(nowGnbData["obj"][0].outerHTML == tag[0].outerHTML){
				(i == tabLength - 1) ? tab += "<li class='ttabLast choiced'>" : tab += "<li class='choiced'>";
			}else{
				(i == tabLength - 1) ? tab += "<li class='ttabLast'>" : tab += "<li>";
			}
			tab += tag[0].outerHTML + "</li>\n";
		}
		//console.log(tab);
		$tab.html(tab);
		$tabWrap.show();

		//탭 on/off 이벤트
		$tab.find("a").on("mouseover focusin",function(){
			var $this = $(this).parent();
			$this.addClass("on").siblings().removeClass("on");
		});
		$tab.find("a").on("mouseleave focusout",function(){
			var $this = $(this).parent();
			$this.removeClass("on");
		});
		$tab.find("a").on("click",function(){
			var $this = $(this).parent();
			$this.addClass("choiced").siblings().removeClass("choiced");
		});

		//탭 개수에 따른 너비 조절, 모바일 처리
		tabChange($tab,mobileChk);
	}

	//탭 pc/모바일 변경
	function tabChange($tab,mobileChk){
		var $tabList = $tab.children();
		var $virtSelect = $tab.siblings(".virtSelect");
		if(mobileChk){
			if(!$virtSelect[0]) {
				$tab.parent().prepend("<div class='virtSelect'><a href='#script'>탭메뉴</a></div>");
				$virtSelect = $tab.siblings(".virtSelect");
			}
			$virtSelect.children("a").html($tab.find(".choiced").children("a").html());
			$tab.addClass("changedSel");
			$tab.hide();
			$virtSelect.show();
			//버츄얼 셀렉트 박스
			var virtTimer = 0;
			$virtSelect.children("a").click(function(){
				if(virtTimer == 0){
					virtTimer = 1;
					$tab.show();
				}else{
					$tab.hide();
					virtTimer = 0;
				}
				return false;
			})
		}
		//pc일 경우
		else{
			$tab.show();
			$tab.removeClass("changedSel");
			$virtSelect.hide();
			var tabLength = $tabList.size();
			if(tabLength > 5) tabLength = 5;
			var tabMargin = 0;
			if(tabLength > 1){
				tabMargin = $tabList.eq(1).css("margin").split("px");
				if(tabMargin[1]/1 > 0 || tabMargin[3]/1 > 0){
					tabMargin = (tabMargin[1]/1 + tabMargin[3]/1) * (tabLength - 1);
				}else{
					tabMargin = 0;
				}
			}
			//실제 적용될 탭 너비
			var minWidth = ($tab.width() - tabMargin) / tabLength;
			modify();
			//분할한 탭 너비와 실제 탭의 너비를 비교해 더 긴 탭이 있을 경우엔 탭 한줄 최대 개수를 낮추고 다시 정리한다. *걸리는게 없을때까지 반복하게끔 처리
			function modify(){
				for(var i=0;i<$tabList.size();i++){
					var width = $tabList.eq(i).width();
					if(width > minWidth){
						minWidthModify();
						modify();
						return false;
					}
				}
			}
			function minWidthModify(){
				tabLength--;
				minWidth = ($tab.width() - tabMargin) / tabLength;
			}
			$tabList.css("min-width",minWidth + "px");
		}
	}

	//depthData에 따른 리스트 출력, chk로 하위 뎁스 전체 보임 여부, chkNum와 chkNum2,chkNum3로 현재위치 지정
	function makeList(depthData,chk,chkNum,chkNum2,chkNum3){
		var list = "";
		var lnbLength = depthData.length;
		for(var i=0;i<lnbLength;i++){
			var tag = depthData[i]["obj"].clone();
			list += "<li>" + tag[0].outerHTML;
			var keyLength = 0;
			var childDepth = depthData[i]["childDepth"];
			if(childDepth.length >= 1 && ((childDepth[0] && childDepth[0]["class"] == "MkSub") || chk) && chk != "nav"){
				if(chkNum == i || chk){
					list += "\n<ul class='submenu'>\n";
				}else{
					list += "\n<ul class='submenu' style='display:none;'>\n";
				}
				var depthDownDataLength = childDepth.length;
				for(var j=0;j<depthDownDataLength;j++){
					var tag2 = childDepth[j]["obj"].clone();
					list += "<li>" + tag2[0].outerHTML;
					if(chkNum3){
						var keyLength2 = 0;
						var childDepth2 = childDepth[j]["childDepth"];
						for(var name in childDepth2){ keyLength2++; }
						if(keyLength2 > 1 && ((childDepth[0] && childDepth[0]["class"] == "MkSub") || chk)){
							if(chkNum2 == j || chk){
								list += "\n<ul>\n";
							}else{
								list += "\n<ul style='display:none;'>\n";
							}
							var depthDownDataLength2 = childDepth2.length;
							for(var k=0;k<depthDownDataLength2;k++){
								var tag3 = childDepth2[k]["obj"].clone();
								list += "<li>" + tag3[0].outerHTML + "</li>\n";
							}

							list += "</ul>\n";
						}
					}
					list += "</li>\n";
				}
				list += "</ul>\n";
			}
			list += "</li>\n";
		}
		//console.log(list);
		return list;
	}

	//타이틀 변경 주소 지정값이 있을 경우엔 해당하는걸로 아니면 현재 페이지 이름
	function nowPageTit(obj){
		var nowUrl = location.href;
		var basicTit = obj["basicTit"];
		document.title = nowGnbData["text"] + " : " + basicTit;
		for(var url in obj){
			if(nowUrl.indexOf(url) > -1){
				document.title = obj[url] + " : " + basicTit;
				return false;
			}
		}
		return false;
	}

	//서브타이틀 하단 네비게이션 출력
	function navi(obj){
		var homeIcon = obj["homeIcon"];
		var hideTemplate = obj["hideTemplate"];
		var nowCont = obj["nowCont"];
		var num = 0;
		var pageNum = [n1,n2,n3,n4,n5];
		var str = [];
		var result = "";
		var length = pageNum.length;
		for(var i=0;i<length;i++){
			if(pageNum[i] >= 0){
				switch(i){
					case 0 : str[num] = gnbData[pageNum[i]]["obj"].html(); break;
					case 1 : str[num] = depth2Data[pageNum[i]]["obj"].html(); break;
					case 2 : str[num] = depth3Data[pageNum[i]]["obj"].html(); break;
					case 3 : str[num] = depth4Data[pageNum[i]]["obj"].html(); break;
					case 4 : str[num] = depth5Data[pageNum[i]]["obj"].html(); break;
				}
				num++;
			}else{
				break;
			}
		}
		result += homeIcon;
		str[num-1] = nowCont[0] + str[num-1] + nowCont[1];
		result += hideTemplate[0];
		for(var j=0;j<num;j++){
			result += " > " + str[j];
		}
		result += hideTemplate[1];

		return result;
	}

	//gnb 정보 저장
	function gnbDataPush(obj){
		var depthChk = 0;
		var depthData = [];
		var depth = obj.children();
		dataPush(depth, depthData);
		function dataPush(depth, depthData){
			var length = depth.length;
			for(var i=0;i<length;i++){
				var $this = depth.eq(i).children("a");
				depthData[i] = data($this);
				var downDepth = $this.siblings().children();
				if(downDepth.length > 0){
					dataPush(downDepth, depthData[i]["childDepth"]);
				}
			}
		}
		function data($this){
			return {
				"obj" : $this,
				"text" : $this.text(),
				"href" : $this.attr("href"),
				"class" : $this.parent().parent().attr("class"), //MkTab인지 구분
				"childDepth" : []
			};
		}
		return depthData;
	}

	//해당하는 네비게이션 정보 추출
	//array = 페이지번호, nowChk = 현재위치가 필요한지 체크
	function getNavi(array, nowChk){
		var data = gnbData;
		var length = array.length;
		var num = 0;
		for(var i=0;i<length;i++){
			if(array[i] >= 0){
				if(nowChk){
					data = (array[i+1] >= 0) ? data[array[i]]["childDepth"] : data[array[i]];
				}else{
					data = data[array[i]]["childDepth"];
				}
			}else{
				break;
			}
		}
		if(!nowChk && data.length < 1){
			//console.log("해당하는 " + (length+1) + "뎁스가 없습니다.");
			return false;
		}
		return data;
	}



}
