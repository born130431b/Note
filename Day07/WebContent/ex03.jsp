<%@page import="java.util.HashMap"%>
<%@page import="Day07.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
	<h1> EL 태그로 Attribute</h1>
	<hr><br>

	<%
		Person p1 = new Person("홍길동", 22);
		Person p2 = new Person("주히존", 29);
		Person p3 = new Person("조쫀" , 12);
		
		Person[] arr = new Person[] {p1,p2,p3};
		
		HashMap<String, Person> map = new HashMap<String, Person>();	
	
		map.put("홍길동", p1);
		map.put("주히존", p2);
		map.put("조쫀", p3);
		
		//setAttribute는 모두 object로 저장이 된다
		session.setAttribute("p1", p1);	
		session.setAttribute("p2", p2);
		session.setAttribute("p3", p3);
		
		session.setAttribute("arr", arr);
		session.setAttribute("map", map);
	%>

	<fieldset>
		<legend>표현식 사용시</legend>
		
		<ul>
			<li><%=((Person)session.getAttribute("p1")).getName() %></li>
			<%-- getAttribute는 형변환을 해야만 Person의 멤버를 사용가능 --%>
			
			<li><%=((Person)session.getAttribute("p2")).getName() %></li>
			
			<li><%=((Person[])session.getAttribute("arr"))[2].getName() %></li>
			
			<li><%=((HashMap<String, Person>)session.getAttribute("map")).get("홍길동").getName() %></li>
		</ul>
	
	</fieldset>

	<hr>

	<fieldset>
		<legend>EL 사용시</legend>
		
		<ul>
			<li>${p1.getName()}</li>
			<%-- EL태그는 알아서 처리해준다 즉 그냥 쓰면 됨 --%>
			<li>${p2.getName() }</li>
			<li>${p2.name }</li>
			<%-- EL태그는 private 멤버에 접근 가능
				실제로는 getter에 접근하기 때문에 getter가 없으면 에러남 --%>
				
			<li>${arr[2].name }</li>
			<li>${map.get("홍길동").name }</li> <%-- EL은 get()메서드 대신 []를 지원해준다 --%>
			<li>${map["조히존"].name }</li>		
		</ul>
	
	</fieldset>



</body>
</html>









