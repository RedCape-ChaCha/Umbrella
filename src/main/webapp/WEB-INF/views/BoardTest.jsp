<%@page import="com.rainbow.um.common.PageModule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테스트 페이지</title>
<style type="text/css">
	table{
		border: 1px solid black;
	}
	
</style>
</head>
<script type="text/javascript">
	
</script>
<body>
${user_number}회원?
<div id="qnaList" style="border: 1px solid red;">
	<table>
			<tr>
				<th>SEQ</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
			<c:choose>
				<c:when test="${empty lists}">
					<tr>
						<td colspan="3">--- 작성된 글이 없습니다 ---</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="d" items="${lists}">
						<tr>
							<td>${d.qna_seq}</td>
							<td>
								<a href="./Detail.do?seq=${d.qna_seq}">${d.qna_title}</a>
							</td>
							<td>${d.qna_regdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>		
	</table>
	<div>
		<a href="#" onclick="pageFirst()">&laquo;</a>
		<a href="#" onclick="pagePre(${pg.startPage})">&lsaquo;</a>
		<!-- 페이지 숫자 -->
		<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }" step="1">
			<a href="./testBoard.do?nowPage=${i}">${i}</a>
		</c:forEach>
		<a onclick="pageNext(${pg.endPage})" href="#">&rsaquo;</a>
		<a onclick="pageLast(${pg.totalPage})" href="#">&raquo;</a>
	</div>
</div>


<div id="qnaIn" style="border: 1px solid red;">
	<form action="./qnaInsert.do" method="post">
		<h2>QnA 작성 테스트</h2>
		유저 아이디 : <input type="text" name="user_number" value="${user_number}"><br>
		제 목 : <input type="text" name="qna_title"><br>
		내 용 : <br>
		<textarea rows="10" cols="100" id="ckedior" name="qna_content"></textarea><br>
		<input type="submit" value="qna글 작성">
	</form>
</div>



<div id="replyIn" style="border: 1px solid red;">
	<form action="./repInsert.do" method="post">
		<h2>QnA 답글 작성 테스트</h2>
		유저 아이디 : <input type="text" name="user_number" value="2"><br>
		QnA 번호 : <input type="text" name="qna_seq" value="1"><br>
		내 용 : <br>
		<textarea rows="10" cols="100" id="ckedior" name="rep_content"></textarea><br>
		<input type="submit" value="답글 작성">
	</form>
</div>









	
</body>
</html>