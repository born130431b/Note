<!--  
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex11.jsp</title>
</head>
<body>
	<h1>Java의 API를 import 하기</h1>
	

	
	<%@page import="java.text.SimpleDateFormat, java.util.Date" %>
	<%
		Date date = new Date();
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd (hh:mm:ss)");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 mm월 dd일 (hh시간 mm분 ss초)");
		String current = sdf.format(date);
		
		out.print("현재 시간 : " + date + "<br>");
		out.print("현재 시간 : " + current);
		
		
	
	%>
	
	
	
	
	
</body>
</html>