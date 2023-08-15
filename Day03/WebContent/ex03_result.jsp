<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03_result.jsp</title>
</head>
<body>
	<h1>결과 페이지</h1>
	<hr><br>
	
	<h3>getParameter</h3>
	
	<%
		// 1.getParameter
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String age = request.getParameter("age");
		String file = request.getParameter("file");
		String color = request.getParameter("color");
		String date = request.getParameter("date");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		String major = request.getParameter("major");
	
	%>
	
	
	<ul>
		<li><%=id %></li>
		<li><%=pw %></li>
		<li><%=email %></li>
		<li><%=age %></li>
		<li><%=file %></li>
		<li><%=color %></li>
		<li><%=date %></li>
		<li><%=gender %></li>
		<li><%=hobby %></li>
		<li><%=major %></li>	
	</ul>
	
	<br><hr><br>
	
	<h3>getParameterValues</h3>
	
	<%
		// checkbox 같은 여러값이 전달되는 경우
		// getParameterValues()를 사용한다.
	
		String[] hobbys = request.getParameterValues("hobby");
		
		out.print("<p>");
		for (int i = 0; i < hobbys.length; i++){
			out.print(hobbys[i] + " ");
		}
		out.print("</p>");
	%>
	
	<br><hr><br>
	
	<h3>getParameterMap</h3>
	
	<%
		// Map : Key 와 value 라고하는 한쌍의 데이터를 저장하는 자료구조
		Map<String, String[]> map = request.getParameterMap();
	
		// set : 순서가 없고, 중복이 없는 자료구조
		Set<String> keys = map.keySet();  // KeySet() : map에서key값만 뽑아서 Set으로 변환
	
			out.print("<ul>");
		
		for (String key : keys ){ // key들을 반복
			out.print("<li>" + key + " : " + map.get(key) + "<li>");
			
			//value가 String[] 배열이므로 반복으로 데이터를 모두 출력
			for (String value : map.get(key)){
				out.print(value + " ");
			}
			out.print("</li>");
		}
	
		out.print("<ul>");
		
	%>
	
	
	
	
	
</body>
</html>