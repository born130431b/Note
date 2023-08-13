<%@page import="day06.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day06.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="template/header.jsp" %>


<% 
	DAO dao = new DAO();

	ArrayList<BoardDTO> list = dao.selectBoard();
%>

	<table id="board">
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
	
		<% for (BoardDTO dto : list) { %>
		<tr>
			<td><%=dto.getIdx() %></td>
			<td>
				<a href="view.jsp?idx=<%=dto.getIdx() %>" style="color:black;">
					<%=dto.getTitle() %>
				</a>
			</td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getCreateDate() %></td>
			<td><%=dto.getViewCount() %></td>
		</tr>
	
		<% } %>
	</table>

<%@ include file="template/footer.jsp" %>