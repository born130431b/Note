<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.itbank.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<jsp:useBean id="dao" class="com.itbank.DAO"/>

<c:set var="row" value="${dao.insertMember(dto) }"></c:set>

<c:if test="${row == 1 } }">
	<script>	
		alert('회원가입 성공!!');
		location.href = 'main.jsp';	
	</script>
</c:if>

<c:if test="${row == 0 } }">
	<script>	
		alert('회원가입 실패!!');
		history.go(-1);		
	</script>
</c:if>






<%@ include file="template/footer.jsp"%>