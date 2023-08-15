<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
	
	<%--
		클라이언트가 서버에 요청(request)를 하면 서버는 요청에 맞는 응답(response)를 클라이언트에 돌려준다
		
		서버에서 요청페이지가 없거나 해당 페이지에서 요청어리가 불가능한 경우가 있을 수 있는데
		서버가 "여기서는 처리가 불가능하니 다른 페이지로 가보세요~" 하는 메세지 전달이 가능
		
		이러한 응답 방식을 redirect라고 한다.
	 --%>
	
	<%
		response.sendRedirect("https://www.naver.com");
	
	
	%>




</body>
</html>