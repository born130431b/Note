<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
	<h1>전송 방식 - GET vs POST</h1>
	<hr><br>
	
	<ol>
		<li>GET : 파라미터를 URL 뒤에 붙여서 전송하는 방식(양이적고 빠르게하려면 get)</li>
		<li>POST : 파라미터를 HTTP라고 하는 패킷의 몸체(body)부분에 작성해서 전송하는 방식<br>즉 주소창에 파라미터가 노출되지 않음(게시판처럼 양이많은것도 post사용)</li>
	
	</ol>
	
	
	<form action="ex02_result.jsp" method="POST">
		<p><input name="name" placeholder="이름">	</p>
		<p><input name="age" placeholder="나이"></p>
		<p><input name="height" placeholder="신장"></p>
		<p><input name="address" placeholder="주소"></p>
		
		<p>
			<input type="submit" value="전송">
			<input type="reset" value="초기화" >		
		</p>		
		
		
	</form>
	
	
	
</body>
</html>