<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex12.jsp</title>
<link rel="stylesheet" href="CSS/style.css" type="text/css">

</head>
<body>
	<h1>반복을 이용한 테이블 출력</h1>
	<hr><br>
	
	<table>
		<tr>
			<th>no.</th>
			<th>이름</th>
			<th>번호</th>
		</tr>
		
		<% 
			for (int i = 1; i <=10; i++) {%>
		
			<tr>
				<td><%=i %></td>
				<td>홍길동</td>
				<td><%=i + 1000 %></td>
			
			</tr>
		
		<% } %>
		
	</table>
</body>
</html>