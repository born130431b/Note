<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp"%>
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="dto" class="com.itbank.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<jsp:useBean id="dao" class="com.itbank.DAO"/>
	
	<c:set var="row" value="${dao.insertBoard(dto) }"/>
	
	<c:if test="${row == 1 }">
		<script>
			alert('정상적으로 작성되었습니다.');
			location.href = 'board.jsp';
		</script>
	</c:if>
	
	<c:if test="${row != 1 }">
		<script>
			alert('글쓰기 실패 ㅠㅠ');
			history.go(-1);
		</script>
	</c:if>
	
	
<%@ include file="template/footer.jsp"%>