<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 결과 페이지 </h1>
	<hr><br>
	
	<%
	
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");

	int n1Int = Integer.valueOf(n1);
	int n2Int = Integer.parseInt(n2);
	
	// 기본자료형		Wrqpper Class
	// boolean		Boolean
	// byte			Byte
	// char			Character
	// short		Short
	// int			Integer
	// long			Long
	// flaot		Float
	// double		Double
	%>
	
	<p>n1 + n2 = : <%=n1Int + n2Int %></p>
	
	
</body>
</html>