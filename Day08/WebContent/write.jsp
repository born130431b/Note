<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp"%>

<c:if test="${login == null }">
	<script>
		alert('로그인이 필요한 서비스 입니다~');
		location.href = 'login.jsp';
	</script>
</c:if>

<form action="writePro.jsp" method="POST">
	<div id="contents">
		<div>
			<p id="title">
				<input name="title" placeholder="제목"> <input name="id"
					type="hidden" value="${login.id }"> <input name="ipAddr"
					type="hidden" value="${pageContext.request.remoteAddr }">

				<%-- 위의 EL 구문과 동일한 표현식
                <input name="ipAddr" type="hidden" value="<%=request.getRemoteAddr() %>">
                --%>
			</p>
		</div>

		<textarea name="contents" ></textarea>
	</div>


	<div id="boardButton">
		<p>
			<input type="submit" value="글작성">
		</p>

		&nbsp; &nbsp;

		<p>
			<div id="cancel">
				<a href="board.jsp" style="color: black">취소</a>
			</div>
		</p>
	</div>
</form>

<%@ include file="template/footer.jsp"%>