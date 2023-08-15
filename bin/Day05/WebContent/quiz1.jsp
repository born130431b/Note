<%@page import="database.IDOLDTO"%>
<%@page import="database.DAO2"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>
	<h1>IDOL 테이블 정보를 모두 가져와서 출력해보세요</h1>
	<hr><br>
	
	<%
		DAO2 dao = new DAO2();
	
		ArrayList<IDOLDTO> list = dao.selectAll();
	
	%>



	<table>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>ID</th>
			<th>PW</th>		
		</tr>
		
		
		<%for(IDOLDTO dto : list) {%>
		
		
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPw() %></td>
		</tr>
		<% } %>
	</table>





</body>
</html>