<%@page import="quiz1.login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<body>

	<%!
		
		login[] members = new login[]{
				new login("root","qwe@123"),
				new login("user","1"),
				new login("itbank","it")
				
		};
	
		public login loginPro(login user){
			
			for(int i = 0; i < members.length; i++){

				if (members[i].equals(user)){
					
					return members[i];
				}
			}
			
			return null;
		}
	
	%>
	
	<h1>로그인 처리 페이지</h1>
	 
	 <jsp:useBean id="user" class="quiz1.login"/>
	 <jsp:setProperty property="*" name="user"/>
	 
	 <%
	 	login login = loginPro(user);
	 
	 if (login != null){
		//responese.sendRedirect("loginSucess.jsp")
		 
		 RequestDispatcher rd = request.getRequestDispatcher("loginsucess.jsp");
		
			rd.forward(request, response);
		 
		 
	  }
	 else {
		 response.sendRedirect("loginFail.jsp");
		 }
	 
	 %>

</body>
</html>