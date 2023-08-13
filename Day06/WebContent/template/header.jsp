	<%@page import="day06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
		// 세션정보 (= 로그인 정보)가 있나 확인 후 세션을 꺼낸다
		MemberDTO login = (MemberDTO) session.getAttribute("login");	
	%>


    <header>
        <div id="logo">
            <a href="main.jsp">HOME</a>
        </div>
        <div id="menu">
            <p><a href="board.jsp">게시판</a></p>
            <% if (login == null){ %>
            <p><a href="login.jsp">로그인</a></p>
            <%} else {%>
            <p><a href="logout.jsp">로그아웃</a></p>
            <%} %>
            <p><a href="register.jsp">회원가입</a></p>
        </div>        
    </header>
    <hr><br>
</body>
</html>