<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10.jsp</title>
</head>
<body>
	<h1>선언부 변수와 스크립틀릿 변수 차이</h1>
	<hr><br>
	
	<%! // 선언부나 스크립틀릿 안에선 자바의 주석 사용 가능
		int n1 = 10;		// 맴버변수 : 객체가 생성되고 객체가 제거될때 까지 존재
						// ㄴ> 서버가 실행되고 서버가 종료될 때 까지 존재
	%>
	
	<%
		int n2 = 10;	// 지역 변수 : 메서드가 호출되고 메서드가 종료될때 까지 존재
						// ㄴ> 페이지가 호출되고 페이지가 바뀔때 까지 존재
	%>
	
	<h3>F5를 눌러 새로고침을 해보세요~~</h3>
	<h3>n1 = <%=n1++ %></h3>
	<h3>n2 = <%=n2++ %></h3>
	
	
	
	
	
	
	
</body>
</html>