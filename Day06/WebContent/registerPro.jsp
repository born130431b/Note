<%@page import="day06.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="register" class="day06.MemberDTO"/>
	<jsp:setProperty property="*" name="register"/>
	
	<%
		DAO dao = new DAO();
	
		int row = dao.insertMember(register);
		out.print("<script>");
		if (row == 1){
			// 회원가입 성공
			out.print("alert('회원가입 성공');");
		}else {
			// 회원가입 성공
			out.print("alert('회원가입 실패');");
		}
		out.print("location.href = 'main.jsp'; ");
		out.print("</script>");
	%>
	
	
	
</body>
</html>