<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp" %>

	<jsp:useBean id="dto" class="com.itbank.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>

	<jsp:useBean id="dao" class="com.itbank.DAO"/>

	<c:set var="cp" value="${dao.viewCountUp(dto) }"/>



<%@ include file="template/footer.jsp" %>