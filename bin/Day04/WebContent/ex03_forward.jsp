<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

	<%
		RequestDispatcher rd;	// 디스패쳐 : 전달자
		
		rd = request.getRequestDispatcher("ex03_result.jsp");
	
		rd.forward(request, response);
	
	%>


</body>
</html>