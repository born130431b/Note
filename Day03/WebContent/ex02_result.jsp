<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_result.jsp</title>
</head>
<body>
	<h1>결과 페이지</h1>
	<hr><br>
	
	<%
		request.setCharacterEncoding("utf-8");
		// POST방식은 body부분에 내용이 작성되면서 인코딩이 발생
		// 이때 결과페이지에서 인코딩을 맞추지 않으면 글자가 깨질 수 있다.
		// 따라서, 파라미터를 받기전에 윗 구문을 작성해야함
	
		String name= request.getParameter("name");
		String age = request.getParameter("age");
		String height = request.getParameter("height");
		String address = request.getParameter("address");
	
	%>
	<ul>
		<li>이름: <%=name %></li>
		<li>나이: <%=age %></li>
		<li>신장: <%=height %></li>
		<li>주소: <%=address %></li>
	</ul>
	
	
	
	
</body>
</html>