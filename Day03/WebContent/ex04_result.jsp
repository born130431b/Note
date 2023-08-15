<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
	<h1>자바 빈즈 클래스로 요청 데이터 처리</h1>
	<hr><br>
	
	<jsp:useBean id="join" class="Day03.join"/>
	<%-- 위는 자바코드로 치면 Join join = new join(); --%>

	<jsp:setProperty property="*" name="join"/>
	<%--
		property는 파라미터로 전송된 데이터를 join이라는 개체의 맴버변수에 모두 대입 
		이때, 파라미터 이름과, 맴버 변수의 이름이 같아야지만 동작한다.
	--%>
	
	<% request.setCharacterEncoding("utf-8"); %>
	<ul>
		<li><%=join.getId() %></li>
		<li><%=join.getPw() %></li>
		<li><%=join.getName() %></li>
		<li><%=join.getEmail() %></li>
		<li><%=join.hobbys() %></li>
	
	</ul>

</body>
</html>