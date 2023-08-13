package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex01 {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";		// jdbc 드라이버 이름
		String url = "jdbc:oracle:thin:@localhost:1521:xe";		// 접속할 DB 주소
		String user = "C##itbank";	// DB 계정명
		String password = "it";		// DB 패스워드
		
		String sql = "select * from test"; // SQL 구문 마지막에 ; 콜론은 적지 않는다!!
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		
		try {
			Class.forName(driver); // jdbc 드라이버 로딩
	
			conn = DriverManager.getConnection(url, user, password); // DB 연결( connection) 생성
			stmt = conn.createStatement();	// SQL을 실행할 객체를 커넥션으로 부터 받는데
			rs = stmt.executeQuery(sql);
			
			
			while (rs.next()) { // next()는 다음 열로 커서(=화살표_를 이동
				System.out.print(rs.getString("userid") + "\t");	// varchar2열은 getString으로
				System.out.print(rs.getString("userpw") + "\t");
				System.out.print(rs.getString("name") + "\t");
				System.out.print(rs.getInt("age") + "\t");			// number는 getInt()나 getDouble()로
				System.out.print(rs.getDouble("height") + "\t");	
				System.out.println(rs.getDate("joindate") + "\t");	// date는 getDate()로
			
			
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 예외 : " + e.getMessage() );
		} catch(SQLException e) {
			System.out.println("SQL 접속 예외 : " + e.getMessage());
		} finally { // finally는 예외 발생 여부에 상관없이 무조건 실행되며 주로 자원해제하는 코드가 작성된다
			try { 
				// 커넥션을 닫아주지 않으면, 다음 접속이 안될 수 있으므로 꼭 닫아준다.
				// 닫는 순서는 생성한 순서 역순으로 닫는다.
				if (rs != null)	rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			}catch(Exception e) {}
			
		}
		
	
	}

}
