<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="template/header.jsp" %>

<%-- tablib가 header.jsp에 있기때문에 따로 안불러와도됨 --%>

<%-- 입력 폼으로 요청된 정보를 DTO 저장 받는다 --%>
<jsp:useBean id="dto" class="com.itbank.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>





<%-- SQL query를 실행할 DAO를 생성한다 --%>
<jsp:useBean id="dao" class="com.itbank.DAO"/>

<c:set var="login" value="${dao.selectMemberOne(dto) }" scope="session"/>

<c:if test="${login == null }">
	<script>
		alert('로그인 실패');
		history.go(-1);
	</script>
</c:if>

<c:if test="${login != null }">
	<c:redirect url="main.jsp"/>
</c:if>


<%@ include file="template/footer.jsp"%>