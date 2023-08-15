<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_result.jsp</title>
</head>
<body>
	<h1>결과 처리 페이지</h1>
	<hr><br>
	
	<%
		// 모든 웹은 [요청]과 [응답]을 통해서 서버와 클라이언트가데이터를 주고 받는다.
		// 이때, 요청은 request라고하고 응갑은 response라고 한다.
		
		// JSP에서는 이미 '내장 각체' 라고해서 요청과 응답처리에 대한 객체가 만들어져있어 바로 사용가능
		
		String id = request.getParameter("id");		// <input name="id"
		String pw = request.getParameter("pw");		// <input name="pw"
	%>
	
	<p>ID : <%=id %></p>
	<p>PW : <%=pw %></p>
	
	<%--
		사용자가 빈값을 전송하면 "빈 문자열이 전송됨" 
		해달 결과페이지를 실행해서 바로 띄우면 파라미터가 없기 때문에 null값이 반환된다
	--%>
	
	
</body>
</html>