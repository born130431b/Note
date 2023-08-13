<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	fieldset {
		display: inline-block;
}
	.number {
	width: 30px}

</style>

</head>
<body>
	<h1>퀴즈 1</h1>
	<hr><br>
	<%-- quiz_result.jsp 입력한 데이터를 전송하고 다한 결과를 체이지에 출력 --%>
	<fieldset>
		<legend>더하기</legend>
		<form action="quiz1_result.jsp">
		<p>
			<input class="number" name="n1">
			+
			<input class="number" name="n2">
			=
			<input type="submit" value="전송">		
		</p>
		</form>
	
	
	</fieldset>
	
	
	
</body>
</html>