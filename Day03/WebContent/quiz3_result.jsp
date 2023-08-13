<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz3.jsp</title>
</head>
<body>
	<h1>결과 페이지</h1>
	<hr><br>
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="join" class="quiz.join"/>
	<jsp:setProperty property="*" name="join"/>
	
	<ul>
		<li><%=join.getId() %></li>
		<li><%=join.getPw() %></li>
		<li><%=join.getName() %></li>
		<li><%=join.getEmail() %></li>
		<li><%=join.getAge() %></li>
		<li><%=join.getHeight() %></li>
		<li><%=join.hobbys() %></li>
	
	</ul>
	
	
	
</body>
</html>