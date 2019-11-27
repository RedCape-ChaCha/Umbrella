(function($){    
    var defOption = {
        //탭 컨텐츠 선택자
        tabContSelector : "#tabCont", //선택자를 넣으면 그 자식 컨텐츠에 순서대로, false일 경우 탭버튼의 href값에 적혀진 컨텐츠에 연결된다.
        //첫번째 보일 탭
        firstTab : 0,
        //on 이벤트 이름
        onEventName : "on",

        themeClass : "themeFC themeBD"
    }
    
    $.fn.tabList = function(options){

        var obj = this;
        
        //기본 옵션 세팅
        var setting = {};
        for(var name in defOption){
            setting[name] = defOption[name];
        }
        
        //수정 옵션 덮어쓰기
        if(options){
            for(var name in options){
                setting[name] = options[name];
            }
        }
        
        var tabContSelector = setting.tabContSelector;
        var firstTab = setting.firstTab;
        var onEventName = setting.onEventName;
        var themeClass = setting.themeClass;
        var $tabList = obj.children();
        
        if(tabContSelector){
            var $tabContList = $(tabContSelector).children(); 
            $tabContList.hide();
            $tabContList.eq(0).show();
        }else{
            $tabList.each(function(e){
                var $this = $(this);
                if(e != firstTab){
                    var href = $this.children("a").attr("href");
                    if(href.indexOf("#") >= 0){
                        $(href).hide();
                    }
                }
            })
        }
        
        $tabList.eq(0).addClass(onEventName);
        $tabList.eq(0).children("a").addClass(themeClass);
        
        $tabList.each(function(){
            var $this = $(this).children("a");
            var href = $this.attr("href");
            if(href.indexOf("#") >= 0){
               $this.click(function(){
                var $this = $(this).parent();
                var $index = $this.index();
                $tabList.removeClass(onEventName);
                $tabList.children().removeClass(themeClass);
                $this.addClass(onEventName);
                $this.children("a").addClass(themeClass);
                if(tabContSelector){
                    $tabContList.hide();
                    $tabContList.eq($index).show();
                }else{
                    $tabList.each(function(e){
                        var $this = $(this);
                        var href = $this.children("a").attr("href");
                        if(e == $index){
                            if(href.indexOf("#") >= 0) $(href).show();
                        }else{
                            if(href.indexOf("#") >= 0) $(href).hide();
                        }
                    });
                }
                return false;
               });
            }
        });
        
    }
    
})(jQuery);
