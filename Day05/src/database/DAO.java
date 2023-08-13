package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "C##itbank";
	private String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public DAO() { // 생성자 => 드라이버 로딩 및 커넷션 생성
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		
			System.out.println("커넥션 생성 성공");
		
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 예외 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL 접속 예외 : " + e. getMessage());
		}
	}
	
		// select 구분 메서드
		public ArrayList<TESTDTO> selectAll() {
			String sql = "select * from Test";
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				ArrayList<TESTDTO> list = new ArrayList<TESTDTO>();
				
				while(rs.next()) {
					TESTDTO dto = new TESTDTO();
					
					dto.setAge(rs.getInt("age"));
					dto.setHeight(rs.getDouble("height"));
					dto.setJoinDate(rs.getDate("joinDate"));
					dto.setName(rs.getString("name"));
					dto.setUserid(rs.getString("userid"));
					dto.setUserpw(rs.getString("userpw"));

					list.add(dto);
				}
				return list;
				
			} catch (SQLException e) {
				
			} finally {
				try {				
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) stmt.close();
				
				} catch (Exception e) {}
			} 
			
			
			return null;
		
	}
	
}
