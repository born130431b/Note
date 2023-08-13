<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginform.jsp</title>
</head>
<body>
	<H1>로그인 성공!!!!</H1>
	
	<fieldset>
		<legend>로그인 성공입니다아~~</legend>
		<input name="site" type="radio" value="https://www.naver.com" > 네이버 보기
		<input name="site" type="radio" value="https://www.youtube.com" > 유투브 보기
		<input name="site" type="radio" value="https://www.facebook.com" > 페이스북보기
		<p><input type="submit" value="선택" ><p>
	</fieldset>
		<%String id = request.getParameter("id"); %>
	<h3><%=id %>님 로그인 성공!</h3>
	
</body>
</html>