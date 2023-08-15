<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex08.jsp</title>
</head>
<body>
	<h1>제어문</h1>
	<hr><br>
	
	<fieldset>
		<legend>입력 폼</legend>
	
		<form>
			<p><input name="name" placeholder="이름"></p>
			<p><input name="age" placeholder="나이"></p>
			<p><input type="submit" value="전송"></p>
		</form>
	</fieldset>
	<hr><br>

	
	<c:if test="${param.age >= 20 }">
		<h3>${param.name }님은 성인입니다.</h3>
	</c:if>

	<c:if test="${param.age < 20 }">
		<h3>${param.name }님은 미성년자 입니다.</h3>
	</c:if>




</body>
</html>






