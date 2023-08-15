<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04_redirect</title>
</head>
<body>
	<h2>다른 페이지</h2>

	<ul>
		<li>test1 : <%=pageContext.getAttribute("test1") %></li>
		<li>test2 : <%=request.getAttribute("test2") %></li>
		<li>test3 : <%=session.getAttribute("test3") %></li>
		<li>test4 : <%=application.getAttribute("test4") %></li>
		
		<%--  getAttribute 는 저장해둔 값을 가져오는 메서드 --%>
	</ul>
	

</body>
</html>