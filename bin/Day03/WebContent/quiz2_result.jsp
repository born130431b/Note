<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과 페이지</h1>
	<hr><br>
	
	<h3>getParameter</h3>
	
	<%
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String[] hobby = request.getParameterValues("hobby");	
		
		out.print("<ul>");
		
		out.println("<li>" + id + "</li>");
		out.println("<li>" + pw + "</li>");
		out.println("<li>" + name + "</li>");
		out.println("<li>" + email + "</li>");
		
		out.println("<li>");
		
		for (int i = 0; i < hobby.length; i++) {
			out.print(hobby[i] + " ");
		}
		out.print("</li>");
		
		out.print("</ul>");
	%>
	
		
	<br><hr><br>
	
	<h3>getParameterMap</h3>
	<%
		Map<String, String[]> map = request.getParameterMap();
		Set<String> keys = map.keySet();
		
		out.print("<ul>");
		
		for (String key : keys) {
			out.print("<li>");
			for (String value : map.get(key)) {
				out.print(value + " ");	
			}
			out.print("</li>");
		}
		out.print("</ul>");
	
	
	
	%>
	
</body>
</html>