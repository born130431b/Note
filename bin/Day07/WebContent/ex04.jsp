<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
<style>
	table {border-collapse: collapse;}
	th,td {
		border: 1px solid black;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<h1>EL 태그 연산자</h1>
	<hr><br>
	
	<table>
		<tr>
			<th>태그</th>
			<th>결과</th>
		</tr>
		
		<tr>
			<td>\${1 + 3 }</td>
			<td>${1 + 3 }</td>
		</tr>
		
		<tr>
			<td>\${1 - 3 }</td>
			<td>${1 - 3 }</td>
		</tr>
		
		<tr>
			<td>\${2 * 3 }</td>
			<td>${2 * 3 }</td>
		</tr>
		
		<tr>
			<td>\${9 / 5 }</td>
			<td>${9 / 5 }</td>
		</tr>
		
		<tr>
			<td>\${9 % 5 }</td>
			<td>${9 % 5 }</td>
		</tr>
		
		<tr>
			<td>\${5 > 3 }</td>
			<td>${5 > 3 }</td>
			<td>gt : grater than</td>
		</tr>
		
		<tr>
			<td>\${5 < 3 }</td>
			<td>${5 < 3 }</td>
			<td> &lt;는 태그로 동작할 수 있기때문에</td>
		</tr>
		
		<tr>
			<td>\${5 lt 3 }</td> 
			<td>${5 lt 3 }</td>
			<td>lt : less than 으로 사용한다 </td>
		</tr>
		
		<tr>
			<td>\${5 >= 3 }</td>  
			<td>${5 >= 3 }</td>
			<td>ge : grater equal</td>
		</tr>
		
		<tr>
			<td>\${5 &lt;= 3 }</td>
			<td>${5 le 3 }</td>
			<td>le : less equal</td>		
		</tr>
		
		<tr>
			<td>\${4 == 3 }</td>
			<td>${4 == 3 }</td>
			<td>eq : equal</td>		
		</tr>
		
		<tr>
			<td>\${4 != 4 }</td>
			<td>${4 != 4 }</td>
			<td>ne : not equal</td>
		</tr>
		
		<tr>
			<td>\${true && true }</td>
			<td>${true && true }</td>
			<td>기호방식과</td>
		</tr>
		
		<tr>
			<td>\${true and true }</td>
			<td>${true and true }</td>
			<td>문자 방식을 다 지원</td>
		</tr>
		
		<tr>
			<td>\${true || false }</td>
			<td>${true || false }</td>
			<td>or도 사용 가능</td>
		</tr>
		
		<tr>
			<td>\${!true }</td>
			<td>${!true }</td>
			<td>not도 사용 가능</td>
		</tr>
		
		<tr>
			<td>\${empty test }</td>
			<td>${empty test }</td>
			<td>attribute 안에 test라는 정보가 없으면 참</td>
		</tr>
		
		<tr>
			<td>\${not empty test }</td>
			<td>${not empty test }</td>
			<td>로그인 활용에 좋음</td>
		</tr>
		
		<tr>
			<td>\${5 % 2 == 0? '짝수':'홀수' }</td>
			<td>${5 % 2 == 0? '짝수':'홀수' }</td>
			<td>삼항 연산자도 가능</td>
		</tr>
	</table>



</body>
</html>








