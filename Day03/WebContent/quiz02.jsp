<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/style.css" type="text/css">

</head>
<body>
	
	<h1>회원가입</h1>
    <hr><br>

    <h3>
        문제)<br>
        form에서 압력 받은 내용을 quiz2_result.jsp로 넘기고<br>
        해당 페이지에서 전송받은 모든 데이터를 출력해보세요
    </h3>

    <fieldset>
        <legend>회원가입</legend>

        <form action="quiz2_result.jsp" method="POST">
            <p><input name="id" placeholder="ID" required></p>
            <p><input name="pw" type="password" placeholder="PW" required></p>
            <p><input name="name" placeholder="이름" required ></p>
            <p><input name="email" placeholder="이메일" type="email"></p>
        
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