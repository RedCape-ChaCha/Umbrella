<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<script type="text/javascript">
	$(function(){
		var $topPopupClose = $(".topPopupClose");
		$topPopupClose.on("click",function(){
			var $area = $(this).parents(".topPopupWrap");
			var hgt = $area.height();
			$area.css({"margin-top": "-" + hgt + "px","z-index":0});
			return false;
		});
	});
</script>
	<ul class="skip">
		<li><a href="#contents">본문 바로가기</a></li>
		<li><a href="#gnb">주메뉴 바로가기</a></li>
	</ul>
<header id="header">
			<a href="#back" id="blackBG"><span class="blind">이전으로 돌아가기</span></a>



			<div id="snb">
				<div class="siteUtilGroup">
					<div id="libraryShortcut" class="libSite dropdown"></div>
					<div id="siteMenu" class="siteMenu clearfix">
						<ul class="clearfix">
							<li class="login"><a
								href="./loginForm.do">로그인</a></li>
							<li class="joinus"><a
								href="./regist.do">회원가입</a></li>

						</ul>
					</div>
				</div>
			</div>

			<script type="text/javascript">
	$(function(){
		$(".dropdown > a").click(function(){
			var $dropdownNav = $(this).siblings("ul");
			if($dropdownNav.css("display") == "none"){
				$(".dropdown > ul").hide();
				$dropdownNav.show();
			}else{
				$dropdownNav.hide();
			}
			return false;
		});
		
	});
</script>

			<div class="headerInner clearfix">
				<h1 id="logo">
					<a href="./init.do"><img
						src="./image/" alt="로고이미지"></a>
				</h1>
				<a href="#open" id="mobileIndexOpen"><span class="blind">메뉴
						열기</span></a>
			</div>
			<nav id="gnbNav" class="clearfix">
				<div id="mobileIndexClose">
					역삼도서관 전체메뉴<a href="#close"><span class="blind">메뉴 닫기</span></a>
				</div>
				<ul id="gnb" class="clearfix">
					<li id="gnb1"><a
						href="./serch.do"> <em>자료검색</em>
					</a>
						<ul>
							<li id="gnb1_1"><a
								href="./serch.do">통합검색</a>
							</li>
							<li id="gnb1_2"><a
								href="./searchSub.do">주제별검색</a></li>
							<li id="gnb1_3"><a
								href="./bobList.do">대출베스트</a></li>
						</ul></li>
					<li id="gnb2"><a href="./noList.do">
							<em>참여마당</em>
					</a>
						<ul>
							<li id="gnb2_1"><a
								href="./noList.do">공지사항</a></li>
							<li id="gnb2_2"><a
								href="#">FAQ</a></li>
						</ul></li>
					<li id="gnb3"><a
						href="./myInfo.do"> <em>내서재</em>
					</a>
						<ul>
							<li id="gnb3_1"><a	href="menu/10560/program/30016/mypage/myInfo.html">기본정보</a></li>
							<li id="gnb3_2"><a	href="menu/10562/program/30018/mypage/loanStatusList.html">도서이용정보</a>
							</li>
							<li id="gnb3_3"><a	href="menu/10566/program/30017/mypage/basketList.html">관심자료목록</a>
							</li>
							<li id="gnb3_4"><a	href="./qnaList.do">Q&A</a>
								</li>
						</ul></li>
					<li id="gnb7"><a href="menu/10576/program/30024/memberLogin.html"> <em>회원정보</em>
					</a>
						<ul>
							<li id="gnb7_1"><a href="menu/10576/program/30024/memberLogin.html">로그인</a></li>
							<li id="gnb7_2"><a href="menu/10578/program/30046/memberFindId.html">아이디찾기</a>
								<ul class="MkTab">
									<li id="gnb7_2_1"><a href="menu/10578/program/30046/memberFindId.html">개인정보로 찾기</a>
									</li>
									<li id="gnb7_2_2"><a href="menu/10579/program/30025/memberFindIdCertify.html">본인인증으로
											찾기</a></li>
								</ul></li>
							<li id="gnb7_3"><a href="menu/10581/program/30047/memberFindPwd.html">비밀번호재발급</a>
								<ul class="MkTab">
									<li id="gnb7_3_1"><a href="menu/10581/program/30047/memberFindPwd.html">개인정보로
											찾기</a></li>
									<li id="gnb7_3_2"><a href="menu/10582/program/30026/memberFindPwdCertify.html">본인인증으로
											찾기</a></li>
								</ul></li>
						</ul></li>
					<li id="gnb8"><a href="menu/10584/program/30027/siteMap.html">
							<em>홈페이지 이용안내</em>
					</a>
						<ul>
							<li id="gnb8_1"><a
								href="menu/10584/program/30027/siteMap.html">사이트맵</a></li>
							<li id="gnb8_2"><a
								href="menu/10585/contents/40010/contents.html">이용약관</a></li>
							<li id="gnb8_3"><a
								href="menu/10586/contents/40011/contents.html">개인정보처리방침</a></li>
							<li id="gnb8_4"><a
								href="menu/10587/contents/40012/contents.html">영상정보처리기기방침</a></li>
							<li id="gnb8_5"><a
								href="menu/10588/contents/40013/contents.html">이메일무단수집거부</a></li>
						</ul></li>
				</ul>
			</nav>
			<div id="submenuArea">
				<div id="submenuLink">
					<p class="catchphrase">
						직장인을 위한 24시간<strong>스마트 도서관</strong>
					</p>
				</div>
			</div>


			<script type="text/javascript">

	$(function(){
		var tph = $(".topPopupWrap").height();
		var tpl = $(".topPopupWrap").length;
		var total_h = tph * tpl;
		if(tpl > 0){
			$("#blackBG").css('top',127+total_h+'px');
		}
	});
</script>
		</header>