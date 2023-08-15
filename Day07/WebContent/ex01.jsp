<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
	<h1>EL : Expression Language (표현 언어)</h1>
	<hr><br>
	
	<ol>
		<li>표현식 &lt;%= %>를 대체하기 위해 등장한 문법이다.</li>
		<li>기존 표현식은 Attribute 속성에 접근하기 불편하다 -> 형변환이 필요</li>
		<li>뿐만 아니라 파라미터 값이나, 배열, 리스트, 맵 등의 컬렉션에 접근방식도 제공</li>
		<li>Attribute에 저장한 값을 참조할때, pageContext -> request -> session -> application순으로 탐색</li>
		<li>JSP2.0이상 스펙에서 기본제공 되므로 따로 추가 할 필요없이 바로 사용 가능</li>
		<li>JSTL과 사용하면 효과가 극대화 된다!!!</li>
		
	</ol>




</body>
</html>