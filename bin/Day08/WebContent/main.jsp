<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>메인 페이지</title>

<%@ include file="template/header.jsp" %>
<%-- 다른 .jsp 파일의 내용을 가져와서 같이 컴파일, 페이지를 생성 --%>

<main>
	<div id="isLogin">
		${login == null ? '로그인 되어있지 않음': login.id}
		${login == null ? '' : '님 로그인중' }
	</div>

	<div id="image">
		<img src="src/IMG_20150608_075241.jpg">
	</div>
</main>

<%@ include file="template/footer.jsp" %>