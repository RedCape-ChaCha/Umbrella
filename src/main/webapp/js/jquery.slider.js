(function($){
	var defOption = {
		type : "slide", //slide, fade 타입 설정 - slide, fade, rolling
		mode : false, //popup인지 설정 - 자동 재생, 멈춤 버튼 show/hide 작동 btnView입력시 둘다 show 
		setTime : 3000, //자동 반복 시간
		animateTime : 400, //넘기는 시간
		usePager : true, //슬라이드 페이징 출력 유무
		useArrow : true, //이전,다음 버튼 출력 유무
		usePlay : true, //멈춤,재생 버튼 출력 유무
		autoStart : true, //자동 재생 유무
		slideWay : "right", //슬라이드 방향 - left, right, top, bottom
		widthType : "normal", //풀페이지 적용 유무 - normal, full
		//선택자 설정
		mbtnWrapSelector : "pagerWrap",
		mbtnSelector : "pager",
		mbtnOnSelector : "on",
		btnArrowWrapSelector : "arrowWrap",
		btnPrevSelector : "btnSlidePrev",
		btnNextSelector : "btnSlideNext",
		btnPlayWrapSelector : "pp-controls",
		btnPlaySelector : "btnSlidePlay",
		btnPauseSelector : "btnSlidePause",
		//버튼 내용물
		mbtnOffCont : "",
		mbtnOnCont : "",
		btnPrevCont : "",
		btnNextCont : "",
		btnPlayCont : "",
		btnPauseCont : "",
		//마우스 오버시 멈춤
		hoverStop : true,
		//슬라이드 이미지 위에 여러 컷의 이미지 등장 효과
		multiImg : false,
		multiImgSelectors : "",
		//이미지 비율설정
		resolution : false, //800x600 형식으로 입력
		//최상위 이미지의 z-index값 조절
		topZindex : 100,
		wrapper : "", //기존(slide목록의 부모 요소)에서 다른 원하는 영역으로 설정
		rollingCount : 1, //롤링개수 숫자 or "page" page의 경우 화면상 보이는 개수씩 넘어간다
		tabSlideSelector : "", //슬라이더에서 탭키를 사용할 경우 컨텐츠 영역 공통 class명 
		//리스트 타입 관련 기능 *목록형 / 썸네일형 변경기능
		listTypeChange : false, //true시 활성화
		listType : "thumb", //thumb, list 리스트 타입 변경시 현재 리스트 타입 
		listPageLength : 1, //페이지 마다 표시되는 개수 설정
		listTypeWrapSelector : "listTypeWrap",
		btnListTypeSelector : "btnListType",
		slideWrapSelector : "popupList", //이 class명에 + .thumb / .list로 타입 구분
		//현재 페이지 위치 표시
		numbering : false, //true시 활성화
		numberingSelector : "nowpage",
		slideType : "img" //text일 경우, 슬라이드 거리를 슬라이딩 할때마다 구하게끔 ex) 슬라이드가 텍스트로 구성되었을때 사용 가능하게끔 처리
	}
	$.fn.slider = function(options){
		var obj = this;
		
		//옵션 세팅
		var setting = {};
		for(var optionName in defOption){
			setting[optionName] = (options && (options[optionName] != undefined || options[optionName] != null)) ? options[optionName] : defOption[optionName];
		}
		
		var type = setting.type;
		var mode = setting.mode;
		var setTime = setting.setTime;
		var animateTime = setting.animateTime;
		var usePager = setting.usePager;
		var useArrow = setting.useArrow;
		var usePlay = setting.usePlay;
		var autoStart = setting.autoStart;
		var slideWay = setting.slideWay;
		var widthType = setting.widthType;
		var mbtnWrapSelector = setting.mbtnWrapSelector;
		var mbtnSelector = setting.mbtnSelector;
		var mbtnOnSelector = setting.mbtnOnSelector;
		var btnArrowWrapSelector = setting.btnArrowWrapSelector;
		var btnPrevSelector = setting.btnPrevSelector;
		var btnNextSelector = setting.btnNextSelector;
		var btnPlayWrapSelector = setting.btnPlayWrapSelector;
		var btnPlaySelector = setting.btnPlaySelector;
		var btnPauseSelector = setting.btnPauseSelector;
		var mbtnOffCont = setting.mbtnOffCont;
		var mbtnOnCont = setting.mbtnOnCont;
		var btnPrevCont = setting.btnPrevCont;
		var btnNextCont = setting.btnNextCont;
		var btnPlayCont = setting.btnPlayCont;
		var btnPauseCont = setting.btnPauseCont;
		var hoverStop = setting.hoverStop;
		var multiImg = setting.multiImg;
		var multiImgSelectors = setting.multiImgSelectors;
		var resolution = setting.resolution;
		var topZindex = setting.topZindex;
		var wrapper = setting.wrapper;
		var rollingCount = setting.rollingCount;
		var tabSlideSelector = setting.tabSlideSelector;
		var listTypeChange = setting.listTypeChange;
		var listType = setting.listType;
		var listPageLength = setting.listPageLength;
		var listTypeWrapSelector = setting.listTypeWrapSelector;
		var btnListTypeSelector = setting.btnListTypeSelector;
		var slideWrapSelector = setting.slideWrapSelector;
		var numbering = setting.numbering;
		var numberingSelector = setting.numberingSelector;
		var slideType = setting.slideType;
		
		//슬라이더 초기 세팅
		var slider = {slide:{},multiImg:{}};
		var $wrap = (wrapper) ? $(wrapper) : obj.parent();
		var slideNum = 0;
		var $slide = obj.children();
		var slideLength = $slide.length;
		var autoPlay = (autoStart) ? "play" : "stop";
		var slideWrapWidth = obj.width();
		var slideWidth = $slide[0].clientWidth;
		var slideHeight = $slide[0].scrollHeight;
		var multiLength = 0;
		var rollingLength = 0;
		var rollingSize = 0;
		var mobileChk = ($wrap.width() <= 1024) ? true : false;
		
		//버튼 관련
		var $btnPlayWrap = $wrap.find("." + btnPlayWrapSelector);
		var $btnPlay = $wrap.find("." + btnPlaySelector);
		var $btnPause = $wrap.find("." + btnPauseSelector);
		var $btnArrowWrap = $wrap.find("." + btnArrowWrapSelector);
		var $btnPrev = $wrap.find("." + btnPrevSelector);
		var $btnNext = $wrap.find("." + btnNextSelector);
		var $btnWrap = $wrap.find("." + mbtnWrapSelector);
		var $btn = $btnWrap.children("." + mbtnSelector);
		var $listTypeWrap = $wrap.find("." + listTypeWrapSelector);
		var $btnListType = $wrap.find("." + btnListTypeSelector);
		var $numbering = $wrap.find("." + numberingSelector);
		
		//easing효과
		var easing = (multiImg) ? "easeInOutCubic" : "swing";
		
		//타이머
		var timer = 0;
		
		//방향체크
		var wayChk = (slideWay == "left" || slideWay == "right") ? true : false;
		
		//슬라이드 위치 구하기 위한 함수
		function prevNum(num){
			var prevNum = 0;
			if(type == "rolling"){
				prevNum = (num <= 0) ? 0 : num-1;
			}else{
				prevNum = (num == 0) ? slideLength-1 : num-1;	
			}
			return prevNum;
		}
		
		function prevNum2(num){
			switch(num){
				default : num -= 2; break;
				case 0 : num = slideLength - 2; break;
				case 1 : num = slideLength - 1; break;

			}
			return num;
		}
		
		function nextNum(num){
			var nextNum = 0;
			if(type == "rolling"){
				nextNum = (num >= rollingLength) ? rollingLength : num+1;
			}else{
				nextNum = (num == slideLength-1) ? 0 : num+1;	
			}
			return nextNum;
		}
		
		function nextNum2(num){
			switch(num){
				default : num += 2; break;
				case slideLength - 1 : num = 1; break;
				case slideLength - 2 : num = 0; break;
			}
			return num;
		}
		
		//세팅 함수
		function fnResolutionSet(){
			resolution = resolution.split("x");
			var reX = resolution[0];
			var reY = resolution[1];
			
			//해상도 설정과 실제 적용한 이미지 사이즈가 다를 경우
			(slideWrapWidth < reX || slideWrapWidth > reX || slideHeight < reY || slideHeight > reY) ? resize(reX,reY) : size(reX,reY);
			
			function size(x, y){
				obj.css({width:x + "px",height:y + "px"});
			}
			function resize(x, y){
				//해상도에 따른 비율
				var rePercent = ($wrap.width() / reX).toFixed(3);
				obj.css({width:rePercent * x + "px",height:rePercent * y + "px"});
			}
			$(window).resize(function(){
				slideWrapWidth = obj.width();
				resize(reX,reY); 
			});
		}
		
		function fnTypeSet(){
			if(type == "rolling"){
				if(slideType != "text"){
					obj.css("width",slideWidth * slideLength + "px");
					$slide.css("width",slideWidth);
					var rollingWrapWidth = obj.parent().width();
					rollingSize = Math.round(rollingWrapWidth / slideWidth);
					//page기능 사용 할 경우 화면에 출력되는 만큼의 리스트 롤링
					//페이징 개수 설정
					rollingLength = (rollingCount != "page") ? rollingCount : rollingSize;
					var size = (slideLength < rollingSize) ? 0 : slideLength - rollingSize; 
					rollingLength = Math.ceil((size) / rollingLength);
					//동작에 넘기는 개수 설정 page기능 사용시 화면 출력 개수만큼
					if(rollingCount == "page") rollingCount = rollingSize;
					//console.log(rollingWrapWidth/slideWidth);
					//console.log(rollingSize, rollingLength);
				}else{
					var width = 0;
					var rollingWrapWidth = obj.parent().width();
					for(var i=0;i<slideLength;i++){
						width += $slide[i].clientWidth + 1;
					}
					obj.css("width",width + "px");
					if(width > rollingWrapWidth){
						var width2 = 0;
						var def = width - rollingWrapWidth;
						for(var j=0;j<slideLength;j++){
							width2 += $slide[j].clientWidth;
							if(def - width2 < 0){
								rollingLength = j+1;
								break;
							}
						}
					}
				}
			}else{
				//첫번째 이미지를 맨 위로
				$slide.css("left","100%");
				$slide.eq(0).addClass("current").css({"left":0 + "%","z-index":topZindex});
			}
			
			//풀페이지 슬라이더일 경우
			if(widthType == "full"){
				$slide.each(function(){
					var $this = $(this);
					var $img = $this.find(".slide");
					var src = $img.attr("src");
					$img.remove();
					$this.css({"background":"url("+src+") center 0 no-repeat"});
				})
			}
		}
		
		function fnBtnPlaySet(){
			//재생,멈춤 버튼과 버튼 감싸놓은 코딩이 다 없을 경우
			if(!$btnPlayWrap[0] && !$btnPlay[0] && !$btnPause[0]){
				$wrap.prepend("<div class='" + btnPlayWrapSelector + "'>");
				$btnPlayWrap = $wrap.children("." + btnPlayWrapSelector);
				appendPlayBtn($btnPlayWrap);
			}
			//버튼 감싸놓은 코딩만 있을 경우
			else if($btnPlayWrap[0] && !$btnPlay[0] && !$btnPause[0]){
				appendPlayBtn($btnPlayWrap);
			}
			if(mode != "btnView"){
				(autoPlay == "play") ? $btnPlay.hide() : $btnPause.hide();
			}
			function appendPlayBtn($btnPlayWrap){
				$btnPlayWrap.append("<a href='#' class='" + btnPauseSelector+ "' title='슬라이드 멈추기'>"+ btnPauseCont +"</a>"
								+ "<a href='#' class='" + btnPlaySelector + "' title='자동으로 슬라이드 넘기기'>" + btnPlayCont + "</a>");
				$btnPlay = $btnPlayWrap.children("." + btnPlaySelector);
				$btnPause = $btnPlayWrap.children("." + btnPauseSelector);
			}
			//재생버튼 클릭 이벤트
			$btnPlay.on('click',function(e){
				slider.stop();
				autoPlay = "play";
				if(mode != "btnView"){
					$btnPlay.hide();
					$btnPause.show();
				}
				slider.play();
				return false;
			});

			//멈춤버튼 클릭 이벤트
			$btnPause.on('click',function(e){
				autoPlay = "stop";
				if(mode != "btnView"){
					$btnPlay.show();
					$btnPause.hide();
				}
				slider.stop();
				return false;
			});
		}
				
		function fnArrowSet(){
			//이전,다음 버튼과 버튼 감싸놓은 코딩이 다 없을 경우
			if(!$btnArrowWrap[0] && !$btnPrev[0] && !$btnNext[0]){
				$wrap.append("<div class='" + btnArrowWrapSelector + "'>");
				$btnArrowWrap = $wrap.children("." + btnArrowWrapSelector);
				appendArrowBtn($btnArrowWrap);
			}
			//버튼 감싸놓은 코딩만 있을 경우
			else if($btnArrowWrap[0] && !$btnPrev[0] && !$btnNext[0]){
				appendArrowBtn($btnArrowWrap);
			}
			function appendArrowBtn($btnArrowWrap){
				$btnArrowWrap.append("<a href='#' class='arrow " + btnPrevSelector + "' title='이전 슬라이드 보기'>" + btnPrevCont + "</a>"
							   + "<a href='#' class='arrow " + btnNextSelector + "' title='다음 슬라이드 보기'>" + btnNextCont + "</a>");
				$btnPrev = $btnArrowWrap.children("." + btnPrevSelector);
				$btnNext = $btnArrowWrap.children("." + btnNextSelector);
			}
			
			//이전 버튼 클릭 이벤트
			$btnPrev.on('click',function(e){
				e.preventDefault();
				if(timer == 0 && slideLength > 1){ 
					if(autoPlay == "play") slider.stop();
					slideWay = (wayChk) ? "left" : "bottom";
					slideNum = prevNum(slideNum);   
					slider.slide.movePrev(slideNum);
					//console.log(num);
					if(autoPlay == "play" && (!listTypeChange || (listTypeChange && listType == "thumb"))) slider.play();
				}
				return false;
			});

			//다음 버튼 클릭 이벤트
			$btnNext.on('click',function(e){
				e.preventDefault();
				if(timer == 0 && slideLength > 1){
					if(autoPlay == "play") slider.stop();
					slideWay = (wayChk) ? "right" : "top";
					slideNum = nextNum(slideNum);	
					slider.slide.moveNext(slideNum);
					if(autoPlay == "play" && (!listTypeChange || (listTypeChange && listType == "thumb"))) slider.play();
				}
				return false;
			});
		}
		
		function fnPagerSet(){
			if(!$btnWrap[0]){
				$wrap.append("<div class='"+ mbtnWrapSelector +"'></div>");
				$btnWrap = $wrap.children("." + mbtnWrapSelector);
			}
			var btnLength = (type == "rolling") ? (rollingLength+1) : slideLength;
			for(var i=0;i<btnLength;i++){
				$btnWrap.append("<a href='#' class='" + mbtnSelector + "'>" + mbtnOffCont + "<span class='blind'>" + (i+1) + "번째 슬라이드로 이동</span></a>");
			}
			$btn = $btnWrap.children("." + mbtnSelector);
			$btn.eq(0).html(mbtnOnCont).addClass(mbtnOnSelector);
			
			//pager 외에 다른 버튼이 있다면 제외
			var btnLengthChk = $btnWrap.children().length - $btn.length;
			//슬라이드 버튼 클릭 이벤트
			$btn.on('click',function(e){
				if(timer == 0){
					if(autoPlay == "play") slider.stop();
					var checkNum = $(this).index();
					if(btnLengthChk > 0) checkNum -= btnLengthChk;
					var defNum = slideNum;
					//console.log(checkNum);
					if(checkNum > slideNum){
						slideNum = checkNum;
						slider.slide.moveNext(checkNum, defNum);
					}else if(checkNum < slideNum){
						slideNum = checkNum;
						slider.slide.movePrev(checkNum, defNum);
					}
					if(autoPlay == "play") slider.play();
				}
				return false;
			});
		}
		
		function fnMultiImgSet(){
			$slide.css({"overflow":"hidden"});
			multiImgSelectors = multiImgSelectors.split(",");
			multiLength = multiImgSelectors.length;
			$slide.each(function(e){
				for(var i=0;i<multiLength;i++){
					var $this = $slide.eq(e).find("."+multiImgSelectors[i]);
					//console.log($this);
					if($this.hasClass(multiImgSelectors[i])){
						var position = $this.attr("data-position").split(",");
						$this.css({"position":"absolute","top":position[1]+"px","left":position[0]+"px"});
					}
				}
			});
		}
		
		function fnMultiImgSet(){
			$slide.css({"overflow":"hidden"});
			multiImgSelectors = multiImgSelectors.split(",");
			multiLength = multiImgSelectors.length;
			$slide.each(function(e){
				for(var i=0;i<multiLength;i++){
					var $this = $slide.eq(e).find("."+multiImgSelectors[i]);
					//console.log($this);
					if($this.hasClass(multiImgSelectors[i])){
						var position = $this.attr("data-position").split(",");
						$this.css({"position":"absolute","top":position[1]+"px","left":position[0]+"px"});
					}
				}
			});
		}
		
		function fnListTypeSet(){
			//코딩 없을경우
			if(!$listTypeWrap[0] && !$btnListType[0]) {
				$wrap.append("<div class='" + listTypeWrapSelector + "'><a href='#' class='btnListType' title='목록 보기'></a></div>");
				$listTypeWrap = $wrap.find("." + listTypeWrapSelector);
				$btnListType = $wrap.find("." + btnListTypeSelector);
			}
			//버튼만 없을경우
			else if($listTypeWrap[0] && !$btnListType[0]){
				$listTypeWrap.append("<a href='#' class='btnListType' title='목록 보기'></a>");
				$btnListType = $wrap.find("." + btnListTypeSelector);
			}
			
			switch(listType){
				case "thumb" : $btnListType.addClass("list").attr("title","목록 보기");
							   $wrap.find("." + slideWrapSelector + ".list").hide();
							   $wrap.find("." + slideWrapSelector + ".list").find("a").off("keydown");
								break;
				case "list" : $btnListType.addClass("thumb").attr("title","썸네일 보기");
							  //$wrap.css("height",$wrap.outerHeight());
							  $wrap.find("." + slideWrapSelector + ".thumb").hide();
							  $slide = $wrap.find("." + slideWrapSelector + ".list").children();
							  slideLength = Math.ceil(slideLength / listPageLength);
							  slider.list(slideNum);
							  listFocusout();
							  if($btnPlayWrap[0]) $btnPlayWrap.hide();
								break;
			}
			
			$btnListType.click(function(){
				slider.stop();
				switch(listType){
					case "thumb" : listType = "list";
								   $btnListType.removeClass("list").addClass("thumb").attr("title","썸네일 보기");
								   $slide = $wrap.find("." + slideWrapSelector + ".list");
							  	   //$wrap.css("height",$wrap.outerHeight());
								   $slide.show();
							  	   $wrap.find("." + slideWrapSelector + ".thumb").hide();
								   $slide = $slide.children();
								   slideLength = Math.ceil($slide.length / listPageLength);
								   slideNum = 0;
								   slider.list(slideNum);	   
							  	   listFocusout();
								   if($btnPlayWrap[0]) $btnPlayWrap.hide();
								   break;
					case "list" : listType = "thumb";
								   $btnListType.removeClass("thumb").addClass("list").attr("title","목록 보기");
								   //$wrap.css("height","inherit");
							  	   $wrap.find("." + slideWrapSelector + ".thumb").show();
								   $wrap.find("." + slideWrapSelector + ".list").hide();
							   	   $slide = $wrap.find("." + slideWrapSelector + ".list").find("a").off("keydown");
								   $slide = $wrap.find("." + slideWrapSelector + ".thumb").children();
								   slideLength = $slide.length;
								   for(var k=0;k<slideLength;k++){
									   if($slide.eq(k).css("z-index") == topZindex) slideNum = k;
								   }
								   if($btnPlayWrap[0]) $btnPlayWrap.show();
								   if(autoPlay == "play") slider.play();
								   break;
				}
				
				if(numbering) slider.numbering(slideNum);
				return false;
			});
			
			//리스트 타입일 경우 페이지 마지막 a에서 탭으로 넘어갈때 다음 페이지로
			function listFocusout(){
				$slide.each(function(e){
					var $this = $(this);
					//페이지 맨 마지막 리스트일 경우
					if((e + 1)%listPageLength == 0){
						$this.children("a").on("keydown", function(ev){
							if(ev.keyCode == 9 && ev.shiftKey == false){
								slideNum = nextNum(slideNum);	
								slider.slide.moveNext(slideNum);
								//페이지 변경 후에 적용 될 수 있도록 시간차를 둔다
								setTimeout(function(){
									$this.next().children("a").focus();
								},10);
							}
						});
					}
					//페이지 맨 처음 리스트일 경우
					else if(e != 0 && e%listPageLength == 0){
						$this.children("a").on("keydown", function(ev){
							if(ev.keyCode == 9 && ev.shiftKey == true){
								slideNum = prevNum(slideNum);	
								slider.slide.movePrev(slideNum);
								//페이지 변경 후에 적용 될 수 있도록 시간차를 둔다
								setTimeout(function(){
									$this.prev().children("a").focus();
								},10);
							}
						});	
					}
				});
			}
		}
		
		function fnNumberingSet(){
			//코딩 없을경우
			if(!$numbering[0]) {
				$wrap.append("<p class='" + numberingSelector + "'></p>");
				$numbering = $wrap.find("." + numberingSelector);
			}
			slider.numbering(slideNum);
		}
		
		//fade 슬라이드
		slider.fade = function(num){
			var $nowSlide = $slide.eq(num);
			var $prevSlide = $slide.eq(prevNum(num));
			$prevSlide.css("z-index",topZindex-1);
			$nowSlide.hide().css("z-index",topZindex);
			$nowSlide.stop().fadeIn(animateTime,function(){
				timer = 0; 
			});
			if(usePager) slider.btnTrans();
		}
		
		//롤링 슬라이드
		slider.rolling = function(num){
			if(slideType == "text") {
				slideWidth = 0;
				for(var i=0;i<num;i++){
					slideWidth += $slide[i].clientWidth + 1;
				}
				obj.stop().animate({"margin-left":(-slideWidth) + "px"},animateTime,easing,function(){
					timer = 0;
				});
			}else{
				obj.stop().animate({"margin-left":(-num * rollingCount * slideWidth) + "px"},animateTime,easing,function(){
					timer = 0;
				});	
			}
			if(numbering) slider.numbering(num);
		}
		
		//기본 슬라이드
		slider.slide.moveNext = function(num, num2){
			//이미지가 1개 이상일 경우 우측에서 슬라이드
			if(slideLength > 1 && timer == 0){
				timer = 1;
				if(!listTypeChange || (listTypeChange && listType == "thumb")){
					//슬라이드
					var prevNumber = (num2 >= 0) ? num2 : prevNum(num);
					var $prevSlide = $slide.eq(prevNumber);
					var $nowSlide = $slide.eq(num);
					if(type == "slide"){
						//멀티이미지 효과
						if(multiImg) slider.multiImg.next($nowSlide,$prevSlide);

						$slide.removeClass("current").css("z-index","inherit");
						$prevSlide.css("z-index",topZindex-1);
						$nowSlide.addClass("current").css("z-index",topZindex);

						if(wayChk){
							$prevSlide.css("left",0).stop().animate({
								"left"  : "-100%"
							},animateTime,easing);
							$nowSlide.css("left","100%").stop().animate({
								 "left":0 + "%"
							},animateTime,easing,function(){
								 timer = 0; 
							});
						}else{
							$prevSlide.css("top",0).stop().animate({
								"top"  : "100%"
							},animateTime,easing);
							$nowSlide.css("top","-100%").stop().animate({
								 "top":0 + "%"
							},animateTime,easing,function(){
								 timer = 0; 
							});
						}
					}else if(type == "fade"){
						slider.fade(slideNum); 
						timer = 0;
					}else if(type == "rolling"){
						slider.rolling(num);
					}
				}else if(listTypeChange && listType == "list"){
					slider.list(num);
					timer = 0;
				}
				if(usePager) slider.btnTrans();
				if(numbering) slider.numbering(num);
			}
		}
		
		//기본 슬라이드 - 이전 슬라이드로
		slider.slide.movePrev = function(num, num2){
			//이미지가 1개 이상일 경우 좌측에서 슬라이드
			if(slideLength > 1 && timer == 0){
				timer = 1;
				if(!listTypeChange || (listTypeChange && listType == "thumb")){
					//슬라이드
					var nextNumber = (num2 >= 0) ? num2 : nextNum(num);
					var $prevSlide = $slide.eq(nextNumber);
					var $nowSlide = $slide.eq(num);
					if(type == "slide"){ 
						//멀티이미지 효과
						if(multiImg) slider.multiImg.prev($nowSlide,$prevSlide);

						$slide.removeClass("current").css("z-index","inherit");
						$prevSlide.css("z-index",topZindex-1);
						$nowSlide.addClass("current").css("z-index",topZindex);

						if(wayChk){
							$prevSlide.css("left",0 + "%").stop().animate({
								"left"  : "100%"
							},animateTime,easing);
							$nowSlide.css("left","-100%").stop().animate({
								 "left":0 + "%"
							},animateTime,easing,function(){
								 timer = 0; 
							});
						}else{
							$prevSlide.css("top",0 + "%").stop().animate({
								"top"  : "-100%"
							},animateTime,easing);
							$nowSlide.css("top","100%").stop().animate({
								 "top":0 + "%"
							},animateTime,easing,function(){
								 timer = 0; 
							});
						}
					}else if(type == "fade"){
					   slider.fade(slideNum);
					   timer = 0;
					}else if(type == "rolling"){
					   slider.rolling(num);
					}
				}else if(listTypeChange && listType == "list"){
					slider.list(num);
					timer = 0;
				}
				if(usePager) slider.btnTrans();
				if(numbering) slider.numbering(num);
			}
		}
		
		//터치 스와이프 이벤트
		slider.slide.swipe = function(){
			obj.attr({"ondragstart":"return false"});
			//시작점
			var startNum = 0;
			var startX = 0;
			//진행중
			var moveX = 0;
			var moveX2 = 0;
			//끝
			var endX = 0;
			
			var touchTimer = 0;
			var touchTimer2 = 0;
			var $leftSlide = "";
			var $rightSlide = "";
			var $centerSlide = "";
			var prevPercent = 0;
			var percent = 0;
			var touchTimeChk = 0;

			obj.on({
				touchstart : function(e){
					touchTimeChk = new Date().getTime();
					if(timer == 0){
						timer = 2;
						//console.log(timer);
						startNum = slideNum;
						if(autoPlay == "play") slider.stop();
						startX = (wayChk) ? e.originalEvent.changedTouches[0].clientX :e.originalEvent.changedTouches[0].clientY;
					}
				},
				touchmove : function(e){
					e.preventDefault();
					e.stopPropagation();
					if(timer == 2){
						moveX = (wayChk) ? e.originalEvent.changedTouches[0].clientX : e.originalEvent.changedTouches[0].clientY;
						var def = moveX - startX;
						percent = (wayChk) ? def / slideWidth * 100 : def / slideHeight * 100;
						//왼쪽으로 스와이프
						if(def < 0){
							if(percent / -1 > 100) percent = -100;
							//왼쪽으로 처음 움직였을때
							if(touchTimer == 0){
								touchTimer = 1;
								touchTimer2 = 0;
								slideNum = nextNum(slideNum);
								touchLeftSet(slideNum);
								slideSet($leftSlide,$rightSlide);
							}
							//왼쪽으로 갔다가 오른쪽으로 이동할때
							if(prevPercent != 0 && prevPercent < percent && touchTimer2 == 0){
								touchTimer2 = 1;
								slideNum = prevNum2(slideNum);
								if(slideLength < 3) $leftSlide.remove();
								touchRightSet(slideNum);
							}
						}
						//오른쪽으로 스와이프
						else{
							if(percent > 100) percent = 100;
							//console.log(pct);
							//처음 오른쪽으로 이동할때
							if(touchTimer == 0){
								touchTimer = 1;
								touchTimer2 = 0;
								slideNum = prevNum(slideNum);
								touchRightSet(slideNum);	
								slideSet($leftSlide,$rightSlide);
							}

							//오른쪽으로 갔다 왼쪽으로 이동할때
							if(prevPercent != 0 && prevPercent > percent && touchTimer2 == 0){
								touchTimer2 = 1;
								slideNum = nextNum2(slideNum);
								if(slideLength < 3) $rightSlide.remove();
								touchLeftSet(slideNum);
							}
						}
						
						touchMove();
						
						prevPercent = percent;
						moveX2 = moveX;
					}
					return false;
				},
				touchend : function(e){
					//클릭인지 스와이프인지 구분
					var touchEndTime = new Date().getTime();
					var touchChk = ((touchEndTime - touchTimeChk > 200) && touchTimer == 1) ? true : false; 
					if(timer == 2 && (touchChk || touchTimer == 1)){
						endX = (wayChk) ? e.originalEvent.changedTouches[0].clientX : e.originalEvent.changedTouches[0].clientY;
						timer = 1;
						//console.log(timer);
						touchTimer = 0;
						touchTimer2 = 0;
						prevPercent = 0;
						var endChk = endX - startX;
						//console.log(slideNum);
						//console.log(e);
						//왼쪽으로 스와이프 끝났을때
						if(endChk < 0){
							(startNum == slideLength - 1) ? slideNum = 0 : slideNum = startNum + 1;
							//console.log(obj.children().eq(slide_total-2));
							$rightSlide.css("z-index",topZindex);
							if(wayChk){
								$leftSlide.stop().animate({ "left"  : "-200%" },animateTime/2,"linear");
								$centerSlide.stop().animate({ "left"  : "-100%" },animateTime/2,"linear");
								$rightSlide.stop().animate({ "left" : 0 + "%" },animateTime/2,"linear",function(){
									slideCallback();
								});
							}else{
								$leftSlide.stop().animate({ "top"  : "-200%" },animateTime/2,"linear");
								$centerSlide.stop().animate({ "top"  : "-100%" },animateTime/2,"linear");
								$rightSlide.stop().animate({ "top" : 0 + "%" },animateTime/2,"linear",function(){
									slideCallback();
								});
							}
							//멀티이미지 효과
							if(multiImg) slider.multiImg.next($rightSlide,$centerSlide);
						}
						//오른쪽으로 스와이프 끝났을때
						else{
							(startNum == 0) ? slideNum = slideLength - 1 : slideNum = startNum - 1;
							$leftSlide.css("z-index",topZindex);
							if(wayChk){
								$rightSlide.stop().animate({ "left"  : "200%" },animateTime/2,"linear");
								$centerSlide.stop().animate({ "left"  : "100%" },animateTime/2,"linear");
								$leftSlide.stop().animate({ "left" : 0 + "%" },animateTime/2,"linear",function(){
									slideCallback();
								});
							}else{
								$rightSlide.stop().animate({ "top"  : "200%" },animateTime/2,"linear");
								$centerSlide.stop().animate({ "top"  : "100%" },animateTime/2,"linear");
								$leftSlide.stop().animate({ "top" : 0 + "%" },animateTime/2,"linear",function(){
									slideCallback();
								});
							}
							//멀티이미지 효과
							if(multiImg) slider.multiImg.prev($leftSlide,$centerSlide);
						}
						if(usePager) slider.btnTrans();
						if(numbering) slider.numbering(slideNum);
						if(autoPlay == "play") slider.play();
					}
				}
			})

			function touchLeftSet(slideNum){
				var leftNum = prevNum2(slideNum);
				var centerNum = prevNum(slideNum);
				if(slideLength > 2){
					$leftSlide = $slide.eq(leftNum);
				}else{
					$leftSlide = $slide.eq(slideNum).clone().addClass("clone");
					obj.append($leftSlide);
				}
				$centerSlide = $slide.eq(centerNum);
				$rightSlide = $slide.eq(slideNum);
				$slide.css("z-index","inherit");
				$leftSlide.css("z-index",topZindex-1);
				$centerSlide.css("z-index",topZindex-1);
				$rightSlide.css("z-index",topZindex);
			}

			function touchRightSet(slideNum){
				var rightNum = nextNum2(slideNum);
				var centerNum = nextNum(slideNum);
				$leftSlide = $slide.eq(slideNum);
				$centerSlide = $slide.eq(centerNum);
				if(slideLength > 2){
					$rightSlide = $slide.eq(rightNum);
				}else{
					$rightSlide = $slide.eq(slideNum).clone().addClass("clone");
					obj.append($rightSlide);
				}
				$slide.css("z-index","inherit");
				$rightSlide.css("z-index",topZindex-1);
				$centerSlide.css("z-index",topZindex-1);
				$leftSlide.css("z-index",topZindex);
			}
			
			function slideSet(left,right){
				if(wayChk){
					left.css("left","-100%");
					right.css("left","100%");
				}else{
					left.css("top","-100%");
					right.css("top","100%");
				}
			}

			function touchMove(){
				if(wayChk){
					$leftSlide.stop().animate({ "left"  : -100 + percent + "%" },1,"linear");
					$centerSlide.stop().animate({ "left" : percent + "%" },1,"linear");
					$rightSlide.stop().animate({ "left" : 100 + percent + "%" },1,"linear");
				}else{
					$leftSlide.stop().animate({ "top"  : -100 + percent + "%" },1,"linear");
					$centerSlide.stop().animate({ "top" : percent + "%" },1,"linear");
					$rightSlide.stop().animate({ "top" : 100 + percent + "%" },1,"linear");
				}
			}
			
			//슬라이드가 2개 이하일때 터치이벤트를 위해 복사된 슬라이드를 체크 후 삭제
			function cloneChk(obj){
				if(obj.hasClass("clone")){
					obj.remove();
				}
			}
			
			//터치 이벤트 종료할 때 초기화
			function slideCallback(){
				cloneChk($leftSlide);
				cloneChk($rightSlide);
				$slide.css({"top":0 + "%","left":100 + "%"});
				$slide.eq(slideNum).css({"top":0 + "%","left":0 + "%"});
				timer = 0;
			}
		}
		
		//롤링 슬라이드 터치 스와이프 이벤트
		slider.rolling.swipe = function(){
			var $rollingObj = obj.parent(); 
			$rollingObj.attr({"ondragstart":"return false"});
				
			//시작점
			var startX = 0;
			//진행중
			var moveX = 0;
			
			var startMl = 0;
			var rollingPx = 0;

			$rollingObj.on({
				touchstart : function(e){
					timer = 1;
					if(autoPlay == "play") slider.stop();
					startX = e.originalEvent.changedTouches[0].clientX;
					startMl = obj.css("margin-left").replace("px","")/1;
				},
				touchmove : function(e){
					e.preventDefault();
					e.stopPropagation();
					moveX = e.originalEvent.changedTouches[0].clientX;
					var def = moveX - startX;
					rollingPx = def + startMl;
					obj.stop().animate({"margin-left":rollingPx + "px"},1,"linear");	
					return false;
				},
				touchend : function(e){
					var endMl = obj.css("margin-left").replace("px","")/1;
					if(endMl >= 0){
						slideNum = 0;
						slider.rolling(slideNum);
					}else if(endMl*-1 > slideWidth*(slideLength-rollingSize)){
						slideNum = Math.ceil((slideLength-rollingSize) / rollingCount);
						obj.stop().animate({"margin-left":-slideWidth*(slideLength-rollingSize) + "px"},animateTime,function(){
							timer = 0;
						});
					}else{
						var nowNum = Math.round((endMl*-1)/slideWidth);
						slideNum = nowNum-1;
						obj.stop().animate({"margin-left":-nowNum*slideWidth + "px"},animateTime,function(){
							timer = 0;
						});
					}
					if(autoPlay == "play") slider.play();
				}
			})
		}
		
		//리스트 페이지 슬라이드
		slider.list = function(num){
			$slide.hide();
			var length = $slide.length;
			for(var i=0;i<length;i++){
				if((i >= (num * listPageLength)) && (i < (num * listPageLength + listPageLength))) $slide.eq(i).show();
			}
		}
		
		//넘버링 변경
		slider.numbering = function(num){
			$numbering.html("<strong>" + (slideNum + 1) + "</strong> / " + slideLength);
		}
		
		slider.multiImg.prev = function(nowSlide, nextSlide, tabChk){
			var delay = (tabChk) ? 0 : 500;
			var animateTime = (tabChk) ? 0 : 300;
			for(var i=0;i<multiLength;i++){
				var $this = nowSlide.find("."+multiImgSelectors[i]);
				if($this.hasClass(multiImgSelectors[i])){
					var position = $this.attr("data-position").split(",");
					$this.css({"left":-$this.width()+"px"}).stop().delay(delay).animate({"left":position[0]+"px"},animateTime+((animateTime*i)),"easeOutQuart");
				}
				var $this2 = nextSlide.find("."+multiImgSelectors[i]);
				if($this2.hasClass(multiImgSelectors[i])){
					$this2.stop().animate({"left":"100%"},animateTime+((animateTime*i)),"easeInOutQuart");
				}
			}
		}
		
		slider.multiImg.next = function(nowSlide, prevSlide, tabChk){
			var delay = (tabChk) ? 0 : 500;
			var animateTime = (tabChk) ? 0 : 300;
			for(var i=0;i<multiLength;i++){
				var $this = nowSlide.find("."+multiImgSelectors[i]);
				if($this.hasClass(multiImgSelectors[i])){
					var position = $this.attr("data-position").split(",");
					$this.css({"left":"100%"}).stop().delay(delay).animate({"left":position[0]+"px"},animateTime+((animateTime*i)),"easeOutQuart");
				}
				var $this2 = prevSlide.find("."+multiImgSelectors[i]);
				if($this2.hasClass(multiImgSelectors[i])){
					$this2.stop().animate({"left":-$this2.width()+"px"},animateTime+((animateTime*i)),"easeInOutQuart");
				}
			}
		}
		
		//버튼 변경
		slider.btnTrans = function(){
			$btn.removeClass(mbtnOnSelector);
			if(mbtnOffCont) $btn.html(mbtnOffCont);
			$btn.eq(slideNum).addClass(mbtnOnSelector);
			if(mbtnOnCont) $btn.html(mbtnOnCont);
		}
		
		//자동반복 시작
		slider.play = function(){
			slider.play.set = setInterval(function(){
				if(slideWay == "right" || slideWay == "top"){
					slideNum = nextNum(slideNum);
					slider.slide.moveNext(slideNum);
				}else{
					slideNum = prevNum(slideNum);
					slider.slide.movePrev(slideNum);
				}	
			},setTime);
		}
		
		//자동반복 멈춤
		slider.stop = function(){
			clearInterval(slider.play.set);
		}
		
		//슬라이드에 포커스가 생길 경우
		$slide.find("a").on({
			focusin : function(){
				if(autoPlay == "play") slider.stop();
				var num = (tabSlideSelector) ? $(this).parents("." + tabSlideSelector).index() : $(this).parents("li").index();
				if(type == "slide" && listType != "list"){
					$slide.css({"z-index":"inherit","top":0 + "%","left":"-100%"});
					$slide.eq(num).css({"z-index":topZindex,"left":0 + "%"});
					if(multiImg){
						if(num > slideNum){
							slider.multiImg.next($slide.eq(num),$slide.eq(prevNum(num)),true);
						}else{
							slider.multiImg.prev($slide.eq(num),$slide.eq(nextNum(num)),true);
						}   
					}
					slideNum = num;
					if(usePager) slider.btnTrans();
					if(numbering) slider.numbering(num);	
				}else if(type == "rolling"){
					if(autoPlay == "play") slider.stop();
				}
			},
			keydown : function(){
				if(autoPlay == "play") slider.play();
			}
		});
		
		//슬라이더 세팅
		if(resolution) fnResolutionSet(); //슬라이더를 비율에 맞춰
		if(type) fnTypeSet(); //슬라이더 세팅
		if(usePlay) fnBtnPlaySet(); //play/pause 버튼 세팅
		if(useArrow) fnArrowSet(); //화살표 버튼 세팅
		if(usePager) fnPagerSet(); //pager 세팅
		if(multiImg) fnMultiImgSet(); //멀티 이미지 기본 위치 세팅
		if(listTypeChange) fnListTypeSet(); //리스트 타입 변경 세팅		
		if(numbering) fnNumberingSet(); //넘버링 세팅
		
		//이벤트 추가 적용
		if(autoStart) slider.play(); //자동반복 적용
		//마우스 오버시 멈춤
		if(hoverStop){
			obj.hover(function(){
				if(autoPlay == "play") slider.stop();
			},function(){
				if(autoPlay == "play") slider.play();
			})
		}
		if(type == "slide" && slideLength > 1 && mobileChk && listType != "list") slider.slide.swipe(); //기본 슬라이드 터치 스와이프 적용
		if(type == "rolling" && slideLength > 1 && mobileChk) slider.rolling.swipe(); //롤링 슬라이드 터치 스와이프 적용
	}
	
	//배너추가
	$.fn.banner = function(){
		var $this = this;
		var $listWrap = $this.find(".bannerList");
		var $list = $listWrap.children();
		var $prev = $this.find(".btnSlidePrev");
		var $next = $this.find(".btnSlideNext");
		var $pause = $this.find(".btnSlidePause");
		var $play = $this.find(".btnSlidePlay");
		var timer = 0;
		var length = $list.length;
		var wrapWidth = 0;
		var type = "txt" //txt or img로 사용
		$play.hide();
		$pause.show();
        autoPlay = "play";
		
		for(var w=0;w<length;w++){
			wrapWidth += $list.eq(w).outerWidth() + 1;
		}
		if(type == "img") $list.css("width",$list.eq(0).outerWidth());
		$listWrap.css("width",wrapWidth + $list.eq(0).outerWidth() + $list.eq(length-1).outerWidth() + 2 + "px");

		//배너에 포커스가 생길 경우
        $list.find("a").on({
            focusin : function(){
                if(autoPlay == "play") stop();
            },
            keydown : function(){
                if(autoPlay == "stop") play();
            }
        });
		
		function prev(){
			if(timer == 0){
				timer = 1;
				var $last = $listWrap.children().eq(length-1).clone();
				$listWrap.prepend($listWrap.children().eq(length-1));
				$listWrap.append($last);
				$listWrap.css("margin-left",-$last.outerWidth() + "px").stop().animate({"margin-left":0},400,function(){
					$last.remove();
					timer = 0;
				});
			}
		}
		
		function next(){
			if(timer == 0){
				timer = 1;
				var $first = $listWrap.children().eq(0).clone();
				$listWrap.append($listWrap.children().eq(0));
				$listWrap.prepend($first);
				$listWrap.stop().animate({"margin-left":-$first.outerWidth() + "px"},400,function(){
					$first.remove();
					$listWrap.css("margin-left",0);
					timer = 0;
				});
			}
		}
		
		var auto = setInterval(next,2000);
		
		var stop = function(){
            autoPlay = "stop";
			clearInterval(auto);
		}
		var play = function(){
            autoPlay = "play";
			auto = setInterval(next,2000);
		}
		
		$next.click(function(){
            if(autoPlay == "stop"){
                stop();
                next();
            }else if(autoPlay == "play"){
                stop();
                next();
                play();
            }
			return false;
		});
		
		$prev.click(function(){
            if(autoPlay == "stop"){
                stop();
                prev();
            }else if(autoPlay == "play"){
                stop();
                prev();
                play();
            }
			return false;
		});
					
		$pause.click(function(){
			stop();
			$pause.hide();
			$play.show();
			return false;
		});
		
		$play.click(function(){
			play();
			$pause.show();
			$play.hide();
			return false;
		});
	}
})(jQuery);