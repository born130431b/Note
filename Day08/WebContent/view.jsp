<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp" %>

<jsp:useBean id="dao" class="com.itbank.DAO"/>
<c:set var="dto" value="${dao.selectBoardOne(param.idx) }" />

<div id="contents">
	<div>
		<h2>${dto.title}</h2>
		<h4>
			작성자 : ${dto.id } |
			조회수 : ${dto.viewCount } |
			날짜 : ${dto.createDate } |
			IP : ${dto.ipAddr }
		</h4>
	</div>

	<hr>
	<br>

	<pre>${dto.contents }</pre>

</div>

<br>

<div id="boardButton">
	<div></div>
	<a href="write.jsp" style="color: black;">
		<button>새글</button>
	</a>

	&nbsp;
	
	<c:if test="${login != null && login.id == dto.id}">
	
	<a href="delete.jsp?idx=${dto.idx }" style="color: black;">
		<button>삭제</button>
	</a>
	
	</c:if>

</div>

<%@ include file="template/footer.jsp" %>