/*
*
* newsticker 플러그인
*
* 2017 - 10 - 27 작업
*
* (주)제이넷 퍼블리싱팀 최성훈   
*
*/
(function($){
    
    var defOption = {
        //롤링 간격 설정
        itemHeight: 24,
        //보이는 개수 설정
        showItems: 1,
        //롤링 주기 설정
        duration: 3000,
        //롤링 시간 설정
        animateTime : 300,
        //버튼 설정
        prevButton: "#btnDwon",
        nextButton: "#btnUp",
        //자동반복 설정
        autoStart : true
    }
    
    $.fn.newsTicker = function(options){

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
        
        var itemHeight = setting.itemHeight;
        var showItems = setting.showItems;
        var showItems = setting.showItems;
        var duration = setting.duration;
        var animateTime = setting.animateTime;
        var $prevButton = $(setting.prevButton);
        var $nextButton = $(setting.nextButton);
        var autoStart = setting.autoStart;

        //타이머
        var timer = 0;
        var slideNum = 0;
        var $obj = obj.children();
        var $list = $obj.children();
        var length = $list.length;
        //console.log(obj);
        //console.log($thumb);
        
        obj.css({height : itemHeight + "px", "overflow" : "hidden"});
        
        function move(num){
            timer = 1;
            $obj.children().eq(0).after($list.eq(num));
            $obj.css("margin-top",0);
            $obj.stop().animate({"margin-top":-itemHeight * showItems + "px"},animateTime,function(){
                $obj.append($obj.children().eq(0));
                $obj.css("margin-top",0);
                timer = 0;
            });
        }
        
        function reverse(num){
            timer = 1;
            //console.log(num);
            $obj.prepend($list.eq(num));
            $obj.css("margin-top",-itemHeight * showItems + "px");
            $obj.stop().animate({"margin-top" : 0}, animateTime, function(){
                timer = 0;
            });
        }
        
        function auto(){
            slideNum++;
            if(slideNum >= length) slideNum = 0;
            move(slideNum);
        }
        
        setting.play = function(){
            return setting.play.set = setInterval(auto,duration);
        }
        
        setting.stop = function(){
            return clearInterval(setting.play.set);
        }
        
        $list.children("a").bind({
            focusin : function(){
                setting.stop();
            },
            mouseover : function(){
                setting.stop();
            },
            focusout : function(){
                setting.play();
            },
            mouseleave : function(){
                setting.play();
            }
        })
        
        $nextButton.bind({
            click : function(e){
                e.preventDefault();
                if(timer == 0){
                    setting.stop();
                    slideNum++;
                    if(slideNum >= length) slideNum = 0;
                    move(slideNum);
                    setting.play();
                }
            }
        });
        
        $prevButton.bind({
            click : function(e){
                e.preventDefault();
                if(timer == 0){
                    setting.stop();
                    slideNum--;
                    if(slideNum == -1) slideNum = length-1;
                    reverse(slideNum);
                    setting.play();
                }
            }
        });
        
        if(autoStart){
            setting.play();
        }
        
    }
    
})(jQuery);
