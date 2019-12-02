<%@page import="com.rainbow.um.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원페이지</title>
</head>
<%
	Object obj =  session.getAttribute("LDto");
	UserDto ldto = (UserDto)obj;
%>
<body>
${LDto.user_email}님 안녕하세요
<a href="./mypage.do?user_email=${LDto.user_email}">마이페이지</a>
</body>
</html>