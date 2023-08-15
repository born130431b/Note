<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
	<h1> input의 여러가지 양식</h1>
	<hr><br>
	
	<fieldset>
		<legend>input 방식</legend>
	
		<form action="ex03_result.jsp">
			<!--  text : 가장 기본 옵션, 생략 가능, 일반 텍스트를 전송 -->
			<p><input name="id" type="text" placeholder="*name" required></p>
			
			<!-- password : 패스워드를 입력, 텍스트를 가려준다 -->
			<p><input name="pw" type="password" placeholder="*패스워드" required></p>
			
			<p><input name="email" type="email" placeholder="이메일" > </p>
			
			<p><input name="age" type="number" step="1" max="100" min="0" placeholder="나이" >
			
			<p><input name="file" type="file"></p>
			
			<p><input name="color" type="color"> </p>
			
			<p><input name="date" type="date"> </p>
			
			<p>
				<!-- 여러가기중 한가지를 선택하는 태그, 이때 name이 같아야 한다. -->
				<input name="gender" type="radio" value="남">남
				<input name="gender" type="radio" value="여">여
				
			</p>
			
			<p>
			<!-- 여러가지를 선택하는 태그, 이때 name이 같아야함 -->
				<input name="hobby" type="checkbox" value="프로그래밍 "> 프로그래밍
				<input name="hobby" type="checkbox" value="시스템"> 시스템
				<input name="hobby" type="checkbox" value="네트워크 "> 네트워크
				<input name="hobby" type="checkbox" value="보안 "> 보안
			</p>
			
			<p> 
				<select name="major">
					<option value="컴퓨터공학과">컴퓨터공학과</option>
					<option value="정보통신학과">정보통신학과</option>
					<option value="기계공학과">기계공학과</option>
					<option value="호텔경영학과">호텔경영학과</option>
					<option value="호텔경영학과">국어국문학과</option>
					<option value="시각디자인학과">시각디자인학과</option>
				</select>
			</p>
			
			<p>
			<!-- submit : form에 작성된 내용을 서버에 전송 -->
			<input type="submit" value="전송">
			
			<!-- reset : 작성됨 내용을 모두 저장 -->
			<input type="reset" value="초기화">
			
			
			
			</p>
		
		
		</form>
	
	
	
	</fieldset>
	
	
	
	
	
</body>
</html>