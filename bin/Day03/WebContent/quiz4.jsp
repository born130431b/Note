<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz4.jsp</title>
<link rel="stylesheet" href="css/style.css" type="text/css">

</head>
<body>
	
	<h1>회원가입</h1>
    <hr><br>

    <h3>
        문제)<br>
	        입력한 ID, PW를 가지고 로그인 프로세스를 작성해 보자 <br>
    </h3>

    <fieldset>
        <legend>회원가입</legend>

        <form action="quiz4_result.jsp" method="POST">
            <p><input name="id" placeholder="ID" required></p>
            <p><input name="pw" type="password" placeholder="PW" required></p>
      
            <p>
                <input type="submit" value="로그인">
                <input type="reset" value="재작성">
            </p>



        </form>

    </fieldset>


</body>
</html>