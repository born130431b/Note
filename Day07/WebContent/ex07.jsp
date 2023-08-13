<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07.jsp</title>
</head>
<body>
	<h1>JSTL - core 태그</h1>
	<hr><br>
	<h3>
		c:set - attribute를 추가한다. 변수 선언 같지만 실제로 attribute안에 데이터를 생성한다<br>
		scope를 지정하지 않으면 기본적으로 pageContext에 저장된다
	</h3>

	<c:set var="member1" value="홍길동" scope="page"/>
	<%-- pageContext.setAttribute("member1","홍길동); --%>
	
	<c:set var="member2" scope="request">조히존</c:set>
	<%-- value는 속성 대신에 태그사이에 요소로 작성해도 된다 --%>

	<c:set var="member3" value="조쫀" scope="session"/>
	<%-- session.setAttibute("member3","조쫀") --%>

	<c:set var="member1" value="조손진" scope="application"/>
	
	<ol>
		<%--표현식의 경우 --%>
		<li><%=pageContext.getAttribute("member1") %></li>
		
		<%-- EL에서 Scope를 지정하지 않으면, page -> req -> session -> app 순으로 탐색 --%>
		<li>${member1 }</li>
		
		<%-- pageScope, requestScope, sessionScope, applicationScope --%>
		<li>${applicationScope.member1 }</li> 
		
		<li>${member2 }</li>
		<li>${member3 }</li>
	</ol>

	<h3>객체를 저장하는 방법</h3>
	<%-- JSTL 채스에는 객체 생성이 없다. 따라서 JSP태그를 생성후 저장하는 방식을 취한다 --%>
	<jsp:useBean id="p1" class="Day07.Person"/>
	<%-- Person p1 = new Person(); --%>

	<jsp:setProperty property="name" name="p1" value="조히존"/>
	<%--p1.setName("조히존"); --%>

	<c:set var="p1" value="${p1 }" scope="session"/>
	
	<p>p1 = ${p1.name }</p>
	<p>p1 = ${p1.age }</p>

	<h3>Attribute에 저장된 데이터 삭제</h3>

	<c:remove var="member1" scope="application"/>
	<c:remove var="member2"/>
	<c:remove var="member3"/>
	<c:remove var="member1"/>

	<%-- scope를 지정하지 않으면 page부터 탐색해서 모두 제거됨 --%>

	<ol>
		<li>${member1 }</li>
		<li>${member2 }</li>
		<li>${member3 }</li>
		<li>${applicationScope.member1 }</li>
	</ol>


</body>
</html>



