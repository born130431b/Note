<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_logout.jsp</title>
</head>
<body>
	<%
		session.removeAttribute("login");
		// 세션 객체 저장된 login이라는 정보를 삭제
		// 없다면 아무일도 발생하지 않음
		
		//response.sendRedirect("ex01_main.jsp");
	%>
	<script>
		alert('로그아웃 되었습니다.');
		location.href = 'ex01_main.jsp';
	</script>


</body>
</html>