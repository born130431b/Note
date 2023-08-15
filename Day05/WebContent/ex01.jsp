<%@page import="dya05.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
	<h1>세션 객체</h1>
	<hr><br>
	
	<h3>세션 객체는 직접 삭제하지 않으면 웹브라우저가 꺼질때 까지 유지된다 <br>
	따라서 로그인을 유지하는 용도로 가장 많이 사용됨<br>
	
		※ http는 기본적으로 비연결지향 프로토콜<br>
		웹서버에 자원을 요청(request)하면 해당 자원을 응답(response)하고 연결을 끊어 버린다.<br>
		<br>
		하지만 웹이 발전하면서 연결을 유지해야 하는 경우가 생기게 됨<br>
		1. 세션: 서버에 데이터가 저장된다. 보안성↑ 속도↓<br>
		ㄴ> 민감한 정보인 로그인 같은 연결 유지를 할때 사용된다.<br>
		<br>
		2. 쿠키: 클라이언트 연결 정보가 저장된다. 보안성 ↓ 속도↑<br>
		ㄴ> 장바구니, 몇일 간 페이지를 띄우지 않기, 자동 로그인 혹은 로그인 정보 유지
	</h3>
	<br><hr><br>
		
	<% 
	
	Member login = (Member) session.getAttribute("login");

	if(login == null) {%>
	
	<fieldset>
		<legend>로그인 폼</legend>
		
		<form action="ex01_loginPro.jsp">
			<p><input name="id" placeholder="id"></p>
			<p><input name="pw" placeholder="pw" type="password"></p>
		
			<p>
				<input type="submit" value="로그인">
				<input type="reset" value="초기화">
			</p>
		
		
		</form>
	
	</fieldset>
	<%} 
	else {out.print("<script>");
	out.print("alert('이미 로그인 되어있는 상태입니다.');");
	out.print("location.href = 'ex01_main.jsp'");
	out.print("</script>");}
	%>


</body>
</html>




