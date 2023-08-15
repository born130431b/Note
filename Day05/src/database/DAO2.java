package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAO2 {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "C##itbank";
	private String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;

	public DAO2() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("커넥션 생성 성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 예외 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL 접속 예외 : " + e.getMessage());
		} 
	}
	public ArrayList<IDOLDTO> selectAll(){
		String sql = "Select * from IDOL";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			ArrayList<IDOLDTO> list = new ArrayList<IDOLDTO>();
			
					while (rs.next()) {
						IDOLDTO dto = new IDOLDTO();
						
						dto.setAge(rs.getInt("age"));
						dto.setGender(rs.getString("gender"));
						dto.setId(rs.getString("id"));
						dto.setName(rs.getString("name"));
						dto.setPw(rs.getString("pw"));
						
						list.add(dto);
					}
					return list;
			
		} catch (SQLException e) {
			
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {}
		}
		return null;
		
		
	}
		
}
