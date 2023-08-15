<%@page import="java.util.ArrayList"%>
<%@page import="database.TESTDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>

<style>
	table{
		border-collapse: collapse;
		width 600px;
	}
	th,td {
		border: 1px solid black;
	}

</style>

</head>
<body>
	<h1>DB에서 Test 테이블 불러오기</h1>
	<hr><br>
	
	<%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "C##itbank";
		String password = "it";
		
		String sql = "select * from test";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		// 테이블의 모든 정보를 저장할 list(=리스트) 선언
		ArrayList<TESTDTO> list = new ArrayList<TESTDTO>();
		
		
		while(rs.next()) {
			// 한 행을 저장할 DTO객체 선언
			TESTDTO dto = new TESTDTO(); // DB에서 가져온 데이터를 저장할 객체
			
			//rs로 모든 열 정보를 DTO에 저장
			dto.setAge(rs.getInt("age"));
			dto.setHeight(rs.getDouble("height"));
			dto.setJoinDate(rs.getDate("joinDate"));
			dto.setName(rs.getString("name"));
			dto.setUserid(rs.getString("userid"));
			dto.setUserpw(rs.getString("userpw"));
			
			//이를 묶어서 보낼 수 있는 list 맨 뒤에 추가
			list.add(dto);			
		}
		
		
		rs.close();
		stmt.close();
		conn.close();		
	%>
	
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>이름</th>
			<th>나이</th>
			<th>신장</th>
			<th>가입 날짜</th>
		</tr>
		
		<% for(TESTDTO dto : list) {%>
		<tr>
			<td><%=dto.getUserid() %></td>
			<td><%=dto.getUserpw() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getHeight() %></td>
			<td><%=dto.getJoinDate() %></td>		
		</tr>
	
	<%} %>
	</table>


</body>
</html>