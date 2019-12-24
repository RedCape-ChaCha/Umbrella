<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹 소켓</title>
<style type="text/css">

	.receive_msg{
		padding: 3px;
		overflow: auto;
		overflow-x: hidden;
		position: relative;
		border: 1px solid red;
	}

	.receiveTxt{
		width:250px; 
		height: 30px;
		float:right; 
		margin:2px; 
		position: absolute;
  		border: 1px solid blue;
 		top:-10px;
 		bottom: 0;
  		left: 400px;
 		right: 0;
	}
	
</style>

   <% 
   	String grId = (String)session.getAttribute("gr_id"); 
    String mem_id = (String)session.getAttribute("mem_id"); 
   %>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
      var ws = null ;
      var url = null ;
      var nick = null ; 
      
      $(document).ready(function() {
          nick = $("#nickName").val();
          $(".receive_msg").html('');
          $(".chat_div").show();
          $(".chat").focus();
          
          ws = new WebSocket("ws://192.168.1.38:8090/Umbrella/wsChat.do");
          
          ws.onopen = function() {
             ws.send("웹도서 대출 신청을 받는 중입니다.");
          };
          
          ws.onmessage = function(event) {
          	var msg = event.data;
          	$(".receive_msg").append($("<div class = 'receiveTxt'>").append($("<span class = 'receiver_img'>").html(msg))).append("<br><br>");
          }
          
          ws.onclose = function(event) {
             alert("채팅방이 삭제됩니다."); 
          }
      
         $(".chat_btn").bind("click",function() {
            if($(".chat").val() == '' ) {
               alert("내용을 입력하세요");
               return ;
            }else {
               ws.send(nick+" : "+$(".chat").val());
               $(".chat").val('');
               $(".chat").focus();
            }
         });
      });
      
      
      function roomClose(){
    	  alert("채팅종료");
      	  $.ajax({
      		  type: "GET",
      		  url: "./socketOut.do",
      		  async: false
      	  });	
      }
      
      function disconnect() {
         ws.close();
         ws = null ;
      } 
      
      function viewList(grId){
    	  $(".memList").children().remove();
    	  $.ajax({
    		 type: "POST",
    		 url: "./viewChatList.do",
    		 data: "mem_id="+$("#nickName"),
    		 async: false,
    		 
    		 success: function(result){
    			 for(var k in result.list){
 					if(result.list[k]==grId){
						$(".memList").prepend("<img class = 'mem_icon' src = 'images/chat_member.png' alt = '접속자아이콘'><p style = 'font-size : 13px;padding : 5px;border-bottom: 0.5px solid #B4B4B4;'>"+k+"</p>"); 
					}
    			 }
    		 }
    	  });
      }      
      function goSocket() {
    		var url="./socketOpenA.do?mem_id=admin&gr_id=admin";
    		httpRequest=new XMLHttpRequest();
    		httpRequest.onreadystatechange=function(){
    			if (httpRequest.readyState==4) {
    				if(httpRequest.status==200){
    					ws.send("nick:admin"+"메세지");
    					roomClose();
    				}else{
    					alert("error");
    				}
    			}
    		}
    		httpRequest.open("GET", url, true);
    		httpRequest.send();
    	}
</script>
</head>
<body onbeforeunload="roomClose()">
 아이프레임 테스트
	      <div class ="receive_msg" >
	      </div>
</body>
</html>