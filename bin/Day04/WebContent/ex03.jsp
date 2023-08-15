<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
	<h1>리다이렉트</h1>
	<hr><br>
	
	<fieldset>
		<legend>Redirect</legend>
		<form action="ex03_redirect.jsp">
			<input name="name" placeholder="이름" required>
			<input type="submit" value="전송">		
		</form>
	</fieldset>
	
	<fieldset>
		<legend>forward</legend>
		<form action="ex03_forward.jsp">
			<input name="name" placeholder="이름" required>
			<input type="submit" value="전송">		
		</form>
	</fieldset>


	<%--
		리다이렉트 : 방향 재지정, 응답(response)에 다른 페이지의 주소를 클라이언트에 전달
		ㄴ> 클라이언트는 재접속할 주소를 받고 직접 접근한다. 이때 새로접속하는 페이지에 request가 새로 발생
		ㄴ> request가 새로 발생하면 이전에 있던 parameter값은 모두 사라진다
		ㄴ> 내부 웹 페이지가 아니더라도 이동 가능
	
		포워드: 클라이언트에게 재접속할 페이지를 알려주지 않고 서버 내부에서 방향 재지정이 되는 것
		ㄴ> request이 새로 발생하지 않고 페이지가 바뀜
		ㄴ> request가 유지되기 때문에 parameter값이 모두 유지됨
		ㄴ> 오로지, 내부 웹 서버 페이지만 접근 가능
		
	 --%>


</body>
</html>