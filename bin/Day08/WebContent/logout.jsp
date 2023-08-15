<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="template/header.jsp"%>

<c:remove var="login" scope="session"/>


<script>
	alert('로그아웃 되었습니다.');
	location.href = 'main.jsp';
</script>



<%@ include file="template/footer.jsp" %>