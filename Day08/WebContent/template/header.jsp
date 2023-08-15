<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header>
        <div id="logo">
            <a href="main.jsp">HOME</a>
        </div>
        <div id="menu">
            <p><a href="board.jsp">게시판</a></p>
            <p>
            	<a href="${login == null ? 'login.jsp' : 'logout.jsp' }">
            		${login == null ? '로그인' : '로그아웃' }
            	</a>
            </p>
            <p><a href="register.jsp">회원가입</a></p>
        </div>        
    </header>
    <hr><br>
</body>
</html>