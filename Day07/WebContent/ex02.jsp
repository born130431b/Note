<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
	<h1>EL 태그로 파라미터 처리</h1>
	<hr><br>
	
	<fieldset>
		<legend>전송 폼</legend>

	<form>
		<p><input placeholder="이름" name="name" ></p>
		<p><input placeholder="나이" name="age" ></p>
		<p><input type="submit" value="전송"></p>
	</form>

	</fieldset>
	<hr>

	<fieldset>
		<legend>결과창 - 1. 표현식으로 처리시 &lt;%= %></legend>
		
		<h3>
			이름 : <%=request.getParameter("name") %> <br>
			나이 : <%=request.getParameter("age") %> <br><br>
			
			나이 + 5 : <%=request.getParameter("age") + 5 %><br>
<%-- 			나이 + 5 : <%=Integer.valueOf(request.getParameter("age")) + 5 %> <br>
		--%>
		</h3>
		
	</fieldset>
	
	<hr>
	
	<fieldset>
		<legend>결과창 - 2. EL 태그로 처리시 $\{ }</legend>
		
		<h3>
			이름 : ${param.name } <br> <%-- EL은 null값을 력하지 않는다 --%>
			나이 : ${param.age }<br><br>
			
			나이 + 5 : ${param.age + 5}<br> <%-- 파라미터 타입에 따라서 자동으로 형번환을 지원한다!! --%>
		
		</h3>
		
	</fieldset>













</body>
</html>





