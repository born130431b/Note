<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Day07.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10.jsp</title>
</head>
<body>
	<%
		Person p1 = new Person("홍길동",20);
		Person p2 = new Person("김길동",30);
		Person p3 = new Person("이길동",40);
		Person p4 = new Person("박길동",50);
		Person p5 = new Person("최길동",60);
		
		// 1. 배열
		Person[] arr = new Person[] { p1,p2,p3,p4,p5 };
		
		// 2. 리스트
		ArrayList<Person> list = new ArrayList<Person>(Arrays.asList(arr));
		
		// 3. map
		HashMap<String, Person> map = new HashMap<String, Person>();
		
		map.put("홍길동",p1);
		map.put("김길동",p2);
		map.put("이길동",p3);
		
		pageContext.setAttribute("arr", arr); 		// EL 태그는 attribute에서 데이터를 가져오기 때문에
		pageContext.setAttribute("list", list);		// 따라서, 아무 Scope에나 넣어두자
		
	%>

	<c:forEach var="i" begin="1" end="10" step="1">
	<%-- for (int i = 1; i <= 10; i++ --%>
		<p>${i } : Hello JSTL</p>	
	
	</c:forEach>

	<hr><br>

	<c:forEach var="i" begin="0" end="4" step="1">
		${arr[i].name } &nbsp;
	</c:forEach>

	<hr><br>

	<c:forEach var="person" items="${arr }">
	${person.name } &nbsp;
	
	</c:forEach>

	<hr><br>
	
	<c:forEach var="person" items="${list }">
		${person.name } &nbsp;
	</c:forEach>

	<hr><br>
	
	<c:forEach var="key" items="${map.keySet() }">
		${key } : ${map[key].age }
	</c:forEach>



</body>
</html>





