<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp"%>
<jsp:useBean id="dao" class="com.itbank.DAO"/>
<c:set var="list" value="${ dao.selectBoard() }"/>


<table id="board">
	<tr>	
		<th>no</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성시간</th>
		<th>조회수</th>
	</tr>
	<c:forEach  var="dto" items="${list }">
	<tr>
		<th style="font-weight: 100;">${dto.idx }</th>
		<th style="font-weight: 100;">
			<a href="view.jsp?idx=${dto.idx}" style="color:black;">
				${dto.title }
			</a>
		</th>
		<th style="font-weight: 100;">${dto.id }</th>
		<th style="font-weight: 100;">${dto.createDate }</th>
		<th style="font-weight: 100;">${dto.viewCount }</th>
	</tr>
	</c:forEach>
</table>
<br>
<div id="boardButton">
	<div></div>
	<a href="write.jsp" style="color: black;">
		<button>글쓰기</button>
	</a>
</div>


<%@ include file="template/footer.jsp"%>