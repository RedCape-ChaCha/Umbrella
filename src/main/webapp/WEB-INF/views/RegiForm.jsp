<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">




</script>
<body>
<form action="./regist.do" method="post">
	<table>
		<tr>
			<th>*이메일</th>
			<td>
				<input type="text" title="n" name="user_email" id="user_email">
				<input type="button" value="중복체크" onclick="idChk()">
				<h3 id="emailMsg"></h3>
			</td>
		</tr>
		<tr>
			<th>*비밀번호</th>
			<td>
				<input type="password" name="user_password" onclick="idConfirm()">
				<input type="password" name="user_password" onclick="idConfirm()">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="user_address" required="required">
				<input type="button" value="우편번호찾기">
				<input type="text" name="user_detail" required="required">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="user_phone" required="required"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="회원가입">
				<input type="button" value="취소" onclick="location.href='./init.do'">
			</th>
		</tr>
	</table>
</form>
</body>
</html>