<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
	<h1>리다이렉션 테스트</h1>
	<hr><br>
	
	<fieldset>
		<legend>redirect</legend>
	
		<form action="ex02_result.jsp">
		<input name="site" type="radio" value="https://www.naver.com">네이버
		<input name="site" type="radio" value="https://www.google.com">구글
		<input name="site" type="radio" value="https://www.youtube.com">유튜브
		<input name="site" type="radio" value="ex01.jsp">ex01.jsp
		
		<input type="submit" value="클릭">
		</form>
	</fieldset>


</body>
</html>