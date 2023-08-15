<%@page import="dya05.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_loginPro.jsp</title>
</head>
<body>
	
	<%!
		Member[] members = new Member[]{
			new Member("one","1","일"),
			new Member("two","2","이"),
			new Member("three","3","삼")
		};
	
		public Member loginPro(Member user){
			for(int i = 0; i < members.length; i++){
				if(members[i].equals(user)){
					return members[i];
				}
			} return null;
		}
	
	%>
	
	<jsp:useBean id="user" class="dya05.Member"/>
	<jsp:setProperty property="*" name="user"/>
	
	
	<%
		Member login = loginPro(user);
	
		if(login != null){
			session.setAttribute("login", login);
			// 로그인 성공 후 세션에 객체 정보를 저장 후
			response.sendRedirect("ex01_main.jsp");
			// main 페이지로 리다이렉트를 걸어준다
		}else{
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("location.href = 'ex01.jsp'");
			out.print("</script>");
		}
	
	%>



</body>
</html>