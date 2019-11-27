(function($) {
	function AutoComplete(_inputBox, _suggestDiv, _suggestList, _btnShow, _btnClose, _btnToggle, _options){

		var options = {
			suggestOn : true // 자동완성 기능 켜기(사용자 지정값)
			, lastKeyword : "" // 마지막으로 요청한 키워드
			, keyword : "" // 검색 키워드
			, hasResult : false // 검색결과를 가지고 있는가
			, isFocused : true // 키워드입력창에 포커스가 위치해 있는가
			, isMouseOver : false // 제시어 영역에 마우스가 포인터가 위치해있는가
			, cursorIndex : -1 // 제시어 키보드 제어시 커서위치
			, sumOfResult : 0 // 자동완성 키워드 개수
			, enterKey : false //엔터키 입력여부
			, isSelectSubmit : false //선택시 제출여부
			, suggestRequestUrl : "" //자동완성 요청 URL
			, submitForm : "" //자동완성 제출 Form
			, submitUrl : "" //자동완성 제출 URL
			, isDisplayed : function(){
				if( options.suggestOn == false ) return false;
				else if( options.isFocused == false ) return false;
				else if( options.hasResult == false ) return false;
				else if( options.keyword   == "" ) return false;
				else return true;
			} // 제시어 표시의 true/false 리턴한다
			, needRequest : function(){
				if( options.suggestOn == false ) return false;
				else if( options.keyword == "") return false;
				else if( options.lastKeyword == options.keyword) return false;
				else return true;
			} // 제시어요청이 필요한가
		};

		//자동완성 처리 시작
		function startSuggest(){
			setTimeout(function() { sendKeyword(_inputBox, _suggestDiv, _suggestList, options); }, 100);//0.5초후에 첫번째 요청을 실행합니다.
		}

		initialize();
		parseOptions(_options);

		//초기화 처리
		function initialize(){
			_inputBox.bind("focusin",function(){		//검색창 포커스시
				options.isFocused = true;
				if(options.isDisplayed()){
					if($(this).val()) _suggestDiv.show();
				}
				return false;
			});

			_inputBox.bind("focusout",function(){	// 검색창 포커스 아웃시
				options.isFocused = false;
				if(this.value.length == 0) {
					options.sumOfResult = 0;
					options.hasResult = false;
				}
				if(!options.isMouseOver){
					_suggestDiv.hide();
				}
				return false;
			});

			_inputBox.bind("click", function(e){	//키워드 선택시
				options.isFocused = true;
				this.style.color = "#000000";
				return false;
			});

			_inputBox.bind("keyup", function(e){	//키워드 입력시
				autocomKeyup(e, 0);
			});

			_inputBox.bind("keydown", function(e){	//키워드 입력시
				autocomKeyup(e, 1);
			});

			_btnShow.bind("click",function(){ //자동완성 보이기 버튼 클릭시
				_suggestDiv.toggle();
				options.suggestOn = true;
				return false;
			});

			_btnClose.bind("click",function(){	//자동완성 닫기 버튼 클릭시
				options.suggestOn = false;
				_suggestDiv.hide();
				return false;
			});

			_btnToggle.bind("click",function(){	//자동완성 기능 끄기 버튼 클릭시
				options.suggestOn = false;
				_suggestDiv.hide();
				return false;
			});

			_suggestDiv.bind("mouseover",function() {	// 자동완성 레이어 마우스 오버시
				options.isMouseOver = true;
			});

			_suggestDiv.bind("mouseout",function() {	//자동완성 레이어 마우스 아웃시
				options.isMouseOver = false;
			});
		}

		//옵션 초기화
		function parseOptions(opts) {
			$.extend(true, options, opts);
		}

		//키 입력 처리
		function autocomKeyup(e, arg){
			var key = e.which || e.keyCode;
			options.enterKey=false;
			switch (key) {
				case 27:	//KEY_ESC
					//this.close();
					break;
				case 13:
					if(options.cursorIndex>=0 && options.cursorIndex<options.sumOfResult){
						_suggestList.find("li > a:eq("+options.cursorIndex+")").click();
						return false;
					}
					_suggestDiv.hide();
					options.enterKey=true;
					break;
				case 38:	//KEY_UP
				case 37:	//KEY_LEFT
					if(options.sumOfResult > 0 && parseInt(arg, 10) == 1) changeSelected(options.cursorIndex-1, options);//changeSelected(-1);
					return;
					break;
				case 40:	//KEY_DOWN
				case 39:	//KEY_RIGHT
					if(options.sumOfResult > 0 && parseInt(arg, 10) == 1) changeSelected(options.cursorIndex+1, options);//changeSelected(1);
					return;
					break;
				default:
					if( parseInt(arg, 10) == 0){
						options.cursorIndex = -1;
						startSuggest();
					}
					break;
			}
		}
	}

	//제시어 선택 처리
	function changeSelected(intPosition, options){
		var lastPos=options.cursorIndex;
		options.cursorIndex=intPosition%options.sumOfResult;
	}

	//제시어를 위한 키워드를 보내고 목록을 배치합니다.
	function sendKeyword(_inputBox, _suggestDiv, _suggestList, options){
		options.keyword = _inputBox.val();

		if(options.keyword.length == 0){
			options.lastKeyword = options.keyword;
			_suggestList.html("");
	 		options.hasResult=false;
	 		options.sumOfResult=0;
	 		_suggestDiv.hide();
	 		return;
		}

		if(options.needRequest()){// 요청이 필요하다면.
			options.lastKeyword = options.keyword;

			if(options.suggestRequestUrl != ""){
				$.ajax({
					type: "POST",
					url: options.suggestRequestUrl,
					data: {"searchKeyword" : options.keyword.replace(/ /gi,'%20') },
					dataType: "json",
					success: function(data){
						_suggestList.html("");

						if (data == "" || data == null) {
					 		options.hasResult=false;
					 		options.sumOfResult=0;
					 		_suggestDiv.hide();
					 		return;
					 	}
				 		options.hasResult = true;
				 		options.sumOfResult = data.length;
				 		var temp1 = "";
						for(var i=0;i<data.length;i++){
							temp1 =  data[i].text;
							temp1 = temp1.replace("<font color=red>","<b class=\"themeFC\">");
							temp1 = temp1.replace("</font>","</b>");
							_suggestList.append("<li><a id=\"atcList" + i + "\" href=\"#link\">" + temp1.toString() + "</a></li>");
						}

						_suggestList.find("li > a").unbind("click").click(function(){
							_suggestDiv.hide();
							changeSelected($(this).parent().index(), options);
							_inputBox.val($(this).text());
							if(options.isSelectSubmit){
								if(options.submitForm != "" && options.submitUrl != ""){
									fnLoadingShow();
									$(options.submitForm).attr("action", options.submitUrl).submit();
								}
							}
							return false;
						});

						if(options.enterKey) {
							_suggestDiv.hide();
							return;
						}

						if(options.isDisplayed()) {
							_suggestDiv.show();
						}
					},
			        error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
				});
			}
		}
	}

	$.autoComplete = function(inputBox, suggestDiv, suggestList, btnShow, btnClose, btnToggle, options) {
		var autoComplete = new AutoComplete($(inputBox), $(suggestDiv), $(suggestList), $(btnShow), $(btnClose), $(btnToggle), options);

		return autoComplete;
	}
})(jQuery);