<%@page import="quiz.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz4.jsp</title>
</head>
<body>

	<%!
		// 아래 클래스가 각동하도록 '빈즈 클래스'를 작성한다
		
		Login[] members = new Login[]{
				new Login("root","qwe@123","관리자"),
				new Login("user","1","유저1"),
				new Login("itbank","it","아이티 뱅크")
				
				//id, pw, 닉네임
		};
	
		public Login loginPro(Login user){
			// 매개변수로 전달된 객체가 위의 배열에 일치하면
			// 배열의 객체를 반환
			
			for(int i = 0; i < members.length; i++){
				//if (members[i].getId().equals(user.getId()) 
				//		&&
				//	members[i].getPw().equals(user.getPw())) 
				if (members[i].equals(user)){
					
					return members[i];
				}
			}
			
			return null;
		}
	
	%>
	
	<h1>로그인 처리 페이지</h1>
	<%--
		로그인 성공시, '닉네임님 환영합니다' 를 출력
		로그인 실패시, '계정명이 일치하지 않습니다' 를 출력
	 --%>
	 
	 <jsp:useBean id="user" class="quiz.Login"/>
	 <jsp:setProperty property="*" name="user"/>
	 
	 <%
	 	Login login = loginPro(user);
	 
	 if (login != null){
		 out.println("<h3>" + login.getNickName() + "님 로그인 성공</h3>");
	 }else {out.println("<h3>해당 계정은 존재하지 않습니다. </h3>");}
	 
	 %>
	 
	
</body>
</html>






