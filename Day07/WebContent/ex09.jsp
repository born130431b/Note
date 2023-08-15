<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex09.jsp</title>
</head>
<body>
	<h1>다중 조건문 처리</h1>
	<hr><br>
	
	<h3>C:if는 단일 조건을 처리하기 좋지만, 여러 조건을 처리하려면 세부적으로 설정해야한다.</h3>

	<fieldset>
		<legend>성적 입력</legend>
		<form>
			<p><input name="name" placeholder="이름"></p>
			<p><input name="kor" placeholder="국어점수"></p>
			<p><input name="eng" placeholder="영어점수"></p>
			<p><input name="math" placeholder="수학점수"></p>
			<p><input type="submit" value="전송"></p>
		</form>
		
	</fieldset>

	<hr><br>
	
	<c:set var="sum" value="${param.kor + param.eng + param.math }"/>
	
	<c:if test="${not empty param.name }">
		
		<c:choose>
			<c:when test="${sum / 3 >= 90 }">
				<h3>${param.name }님의 점수는 A등급 입니다.</h3>
			</c:when>
			
			<c:when test="${sum / 3 >= 80 }">
				<h3>${param.name }님의 점수는 B등급 입니다.</h3>
			</c:when>
			
			<c:when test="${sum / 3 >= 70 }">
				<h3>${param.name }님의 점수는 C등급 입니다.</h3>
			</c:when>
			
			<c:when test="${sum / 3 >= 60 }">
				<h3>${param.name }님의 점수는 D등급 입니다.</h3>
			</c:when>
		
			<c:otherwise>
				<h3>${param.name }님의 점수는 F등급 입니다.</h3>
			</c:otherwise>
		
		</c:choose>

	</c:if>



</body>
</html>