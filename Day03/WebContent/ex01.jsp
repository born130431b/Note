<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
	 <h1>form 태그</h1>
    <hr><br>

    <form action="ex01_result.jsp">
        <p>ID : <input name="id" type="text" placeholder="ID 입력"></p>
        <p>PW : <input name="PW" type="password" placeholder="PW 입력"></p>

        <p>
            <input type="submit" value="전송">
            <input type="submit" value="다시쓰기">
        </p>
    </form>
    <!--
        전송을 누르면 각input태그에 작성된 내용이
        URL 주고 ? 뒤에 각각 전달된다.
        이를, parameter라고 하며 각 태그의 name속성이 이름으로 전달됨
    -->
</body>
</html>