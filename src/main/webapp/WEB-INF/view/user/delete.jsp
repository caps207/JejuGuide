<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<table>
	<tr><td>아이디</td><td>${user.id}</td></tr>
	<tr><td>이름</td><td>${user.name}</td></tr>
	<tr><td>생년월일</td><td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td></tr>
</table>
<form action="delete.shop" method="post" name="deleteform">
	<input type="hidden" name="id" value="${param.id}">
	비밀번호<input type="password" name="password">
	<a href="javascript:deleteform.submit()">[회원탈퇴]</a>
</form>
</body>
</html>