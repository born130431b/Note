<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex09.jsp</title>
</head>
<body>
	<h1>JSP 기본</h1>
	<hr><br>
	
	<!-- HTML 주석, 웹브라우저에서 소스보기로 노출됨 -->
	<%-- JSP 주석, 웹브라우저에서 노출되지 않음 --%>

	<h3>JSP 기본 문법</h3>

	<ol>
		<li>지시자 (directive) : &lt;%@ %>, 페이지 전반에 걸친 설정이나, 외부 파일을 불러올때 사용되는 태그</li>
		<li>선언부 (declaration) : &lt;%! %>, 변수나 매서드를 선언하는 부분, 클래스의 맴버의 위치에 생성된다</li>
		<li>스크립틀릿 (scriptlet) : &lt;% %>, 자바 코드를 작성하는 main 함수부분이라고 생각하면 좋다</li>
		<li>표현식 (expresstion) : &lt;%= %>, 자바의 데이터를 HTML코드에 출력할때 사용</li>
	</ol>

	<%!
		// 지역변수에 접근제어 지시자는 붙일 수 없음
		private int n1 = 0; // 즉, 접근 제어 지시가 붙었다는 것은 멤버 변수(= 필드)임을 의미
	
		public int add(int n1, int n2) {
			return n1 + n2;
		}
	%>

	<%
		// 자바의 코드가 전개되는 부분
		int n3 = 3;		// 스크립틀릿에서도 변수 선언 가능 => 지역변수
		int n4 = 4;
		
		System.out.println("n3 = " + n3 + ", n4 = " + n4);
		// System 클래스는 표준 입출력을 제어하는 클래스 -> 즉, 웹브라우저가 아닌 콘솔창에 출력
		
		out.print("n3 + n4 = " + (n3 + n4) + "<br>");
		// out은 JspWritter 클래스로 이미 JSP 내에서 작성되어 있는 '내장객체'
		// 웹브라우정에 문자열을 출력하는 객체

		out.print("add(n3, n4) = " + add(n3, n4));
		
	%>
		
	<%-- 스크립틀릿을 벗어나면 다시 HTML 구간 --%>
		
	<p>n1 = <%=n1 %></p>
	<p>n3 = <%=n3 %></p>

	<p>add(10, 5) = <%=add(10, 5) %></p>















</body>
</html>