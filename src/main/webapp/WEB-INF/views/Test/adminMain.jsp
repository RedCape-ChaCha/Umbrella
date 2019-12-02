<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
<%
	Object obj =  session.getAttribute("LDto");
	UserDto ldto = (UserDto)obj;
%>
	<a href="./alluserlist.do">회원목록확인</a>
	<a href="./logout.do">로그아웃</a> 
</body>
</html>