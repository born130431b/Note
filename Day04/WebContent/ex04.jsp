<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
	<h1>pageScope</h1>
	<hr><br>
	
	<%--
		JSP에는 웹에서 처리된 데이터를 저장할 수 있는 4가지 내장객체가있다 
		
		1. pageContext : 페이지 내에서만 유지가 됨. 페이지가 바뀌면 저장된 데이터가 사라짐
		2. request	   : 페이지 내에서만 유지가 됨. 단, 포워드시 데이터가 유지됨!!!
		3. session	   : 웹브라우저가 꺼질때 까지 유지됨 주로 로그인 유지로 사용된
		4. application : 웹 서버가 꺼질때 까지 유지 됨.
	
	 --%>
	 
	 <%
	 	pageContext.setAttribute("test1", "페이지 컨텍스"); //(이름, 값)
	 	request.setAttribute("test2", "리퀘스트");
	 	session.setAttribute("test3", "세션");
	 	application.setAttribute("test4", "어플리케이션");
	 	
	 	//setAttribute 메서드는 내장객체에 값을 저장하는 메서드
	 %>
	 <h2>현재 페이지</h2>

	<ul>
		<li>test1 : <%=pageContext.getAttribute("test1") %></li>
		<li>test2 : <%=request.getAttribute("test2") %></li>
		<li>test3 : <%=session.getAttribute("test3") %></li>
		<li>test4 : <%=application.getAttribute("test4") %></li>
		
		<%--  getAttribute 는 저장해둔 값을 가져오는 메서드 --%>
	</ul>
	
	<a href="ex04_redirect.jsp"> <button> 다른페이지로 </button> </a>

	<form action="">
		<input type="hidden" name="forward" value="yes">
		<input type'="submit" value="포워드">
	
	</form>
	<%
		String forward = request.getParameter("forward");
	
		if("yes".equals(forward)){
			RequestDispatcher rd;
			rd = request.getRequestDispatcher("ex04_redirect.jsp");
			rd.forward(request, response);
		}
	
	%>

</body>
</html>






