<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp" %>


<jsp:useBean id="dao" class="com.itbank.DAO"/>

<c:set var="row" value="${dao.deleteBoard(param.idx)}"></c:set>

<c:if test="${row == 1 }">
	<script>
	alert('삭제되었습니다.');
	location.href = 'board.jsp';
	</script>
</c:if>

<c:if test="${row != 1 }">
	<script>
		alert('다시 시도해주세요');
		history.go(-1);
	</script>
</c:if>



<%@ include file="template/footer.jsp" %>