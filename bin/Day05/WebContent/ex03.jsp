<%@page import="database.TESTDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exx03.jsp</title>
</head>
<body>
	<h1>DAO를 활용한 DB입출력</h1>
	<hr><br>
	
	<ul>
		<li>DAO(Database Access Object)<br>
			데이터 베이스에 접근하기위한 클래스<br>
			 매번 jsp 페이지마다  DB에 접속하기 위해서 설정을 적기가 힘들고 번거롭다.<br>
			 그, 접속 설정을 클래스로 구현해두고 필요한 기능을 매서드로 구현해서 사용하는 방식
		</li>
		<li>DTO(Data Transfer Object)<br>
			데이터를 주고 받기 위한 클래스
		</li>
	
	</ul>

	<br><hr><br>


	<%
		DAO dao = new DAO();
	
		ArrayList<TESTDTO> list = dao.selectAll();
	%>


	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>이름</th>
			<th>나이</th>
			<th>신장</th>
			<th>가입 날짜</th>
		</tr>
		<%for(TESTDTO dto : list) {%>
		<tr>
			<th><%=dto.getUserid() %></th>
			<th><%=dto.getUserpw() %></th>
			<th><%=dto.getName() %></th>
			<th><%=dto.getAge() %></th>
			<th><%=dto.getHeight() %></th>
			<th><%=dto.getJoinDate() %></th>
		</tr>
		<%} %>
	</table>







</body>
</html>