<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginform.jsp</title>
</head>
<body>

	<%--
		로그인 폼 : loginform.jsp -> ID, PW를 입력받는다
		
		로그인 처리 : loginPro.jsp -> 폼에서 전달된 ID,PW를 받아서 로그인 성공 여부를 처리
		ㄴ> 계정은 빈즈 클래스로 3개정도 만들어서 처리한다
		
		빈즈클래스 : login.java -> ID, PW를 가진 클래스
		
		로그인 성공 : loginSucess.jsp -> 처리페이지에서 로그인 성공시 이페이지로 redirect 시킨다.
		ㄴ> 로그인 성공이라고 출력
		
		로그인 실패 : loginFail.jsp -> 처리 페이지에서 로그인 실패시 이 페이지로 리다이렉트 시킨다.
		ㄴ> 로그인 실패라고 출력 
		
		
		포워드 후 추가 문제
		로그인 처리: loginPro.jsp에서 로그인 성공시 loginsucess.jsp로 포워드
				실패시, loginFail.jsp로 리다이렉트
				
		로그인 성공 : '아이디'님 로그인 성공 출력
			
	 --%>

	<h1>로그인 페이지</h1>
	
	<fieldset>
		<legend>로그인</legend>
		<form action="loginPro.jsp">
		
		<p><input name="id" placeholder="ID" required></p>
		<p><input name="pw" placeholder="PassWord" type="password" required></p>
		 
		 <p>
		 	<input type="submit" value="로그인">
		 	<input type="reset" value="초기화">
		 </p>
		
		
		</form>
		
	</fieldset>










</body>
</html>