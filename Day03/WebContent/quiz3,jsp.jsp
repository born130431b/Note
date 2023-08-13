<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz3.jsp</title>

<link rel="stylesheet" href="css/style.css" type="text/css">

</head>
<body>
	
	<h1>회원가입</h1>
    <hr><br>

    <h3>
        문제)<br>
        form에서 입력받은 내용을 quiz3_result.jsp로 전송 <br>
		해당 페이지에서는 '빈즈 클래스'를 활용해서 전송된 데이터를 받아서 출력해보세요 
    </h3>

    <fieldset>
        <legend>회원가입</legend>

        <form action="quiz3_result.jsp" method="POST">
            <p><input name="id" placeholder="ID" required></p>
            <p><input name="pw" type="password" placeholder="PW" required></p>
            <p><input name="name" placeholder="이름" required ></p>
            <p><input name="email" placeholder="이메일" type="email"></p>
        	<p><input name="age" placeholder="나이" required type="number"></p>
        	<p><input name="height" placeholder="신장" step="0.1" required type="number"></p>
        	
            <p>
                <input name="hobby" type="checkbox" value="게임">게임
                <input name="hobby" type="checkbox" value="영화">영화
                <input name="hobby" type="checkbox" value="독서">독서
                <input name="hobby" type="checkbox" value="요리">요리
            </p>

            <p>
                <input type="submit" value="회원 가입">
                
                <input type="reset" value="다시 작성">
            </p>



        </form>

    </fieldset>

</body>
</html>