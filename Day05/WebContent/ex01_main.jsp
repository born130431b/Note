<%@page import="dya05.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_main.jsp</title>
</head>
<body>
	<%
		Member login = (Member) session.getAttribute("login");
	%>


	<h1>Main 페이지</h1>
	<hr><br>

	<%=login == null ? "로그인 상태 아님" : login.getNickName() + "님 로그인" %>
	<hr><br>
	
	
	<% if(login == null) {%>
	<a href="ex01.jsp"><button>로그인 페이지</button></a>
	<%} %>
	
	<% if(login != null) {%>
	<a href="ex01_logout.jsp"><button>로그아웃</button></a>
	<%} %>

</body>
</html>