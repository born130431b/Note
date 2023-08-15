package day06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public DAO() {
		try {
			Class.forName(driver);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 예외 : " + e.getMessage());
		}
	}
	
	public void close() {	// close()는 계속 사용되기 때문에
		try {				// 메서드로 만들어 두면 편하게 재사용 가능
			if (rs != null) 	rs.close();
			if (stmt != null)	stmt.close();
			if (conn != null) 	conn.close();
		} catch(Exception e) {}
	}
	
	public MemberDTO selectOne(MemberDTO login) {
		String sql = "SELECT * FROM MEMBER WHERE ID='%s' and pw='%s' ";
		
		sql = String.format(sql, login.getId(), login.getPw());
		
		// sql 구문 디버깅 용
		// System.out.println(sql);
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// select는 executeQuery() 사용 (반환형은 ResultSet)
			
			// int row = stmt.executeUpdate(sql);
			// insert, update, delete는 executeUpdate() 사용 (반환형은 int)
			
			rs.next();
			
			MemberDTO dto = new MemberDTO();
			
			dto.setEmail(rs.getString("email"));
			dto.setId(rs.getString("id"));
			dto.setJoinDate(rs.getDate("joinDate"));
			dto.setName(rs.getString("name"));
			dto.setPw(rs.getString("pw"));
		
			return dto;
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		return null;
	}

	public int insertMember(MemberDTO join) {
		String sql = "INSERT INTO MEMBER VALUES('%s', '%s', '%s', '%s', '%s')";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(new Date());
		
		sql = String.format(sql, join.getId(), join.getPw(),
				join.getName(), join.getEmail(), time);
		
		// 디버깅 코드
		// System.out.println(sql);
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
		
			int row = stmt.executeUpdate(sql);
			
			return row;
		
		} catch(SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		
		return 0;
	}

	public ArrayList<BoardDTO> selectBoard() {
		String sql = "SELECT * FROM BOARD ORDER BY IDX DESC";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setContents(rs.getString("contents"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setId(rs.getString("id"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				
				list.add(dto);
			}
			
			return list;
		
		} catch(SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		
		return null;
	}

	public BoardDTO selectBoardOne(BoardDTO board) {
		String sql = "SELECT * FROM BOARD WHERE IDX=" + board.getIdx();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			BoardDTO dto = new BoardDTO();
			
			dto.setContents(rs.getString("contents"));
			dto.setCreateDate(rs.getDate("createDate"));
			dto.setId(rs.getString("id"));
			dto.setIdx(rs.getInt("idx"));
			dto.setIpaddr(rs.getString("ipaddr"));
			dto.setTitle(rs.getString("title"));
			dto.setViewCount(rs.getInt("viewCount"));
			
			return dto;
		
		} catch(SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		return null;
	}

	
}

















