package com.itbank;

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
	
	private Connection conn ; 
	private Statement stmt ;
	private ResultSet rs ;
	
	// 생성자 : 드라이버 로딩 및 커넥션 생성
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			
			
			
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 예외 : " + e.getMessage());
		} catch(SQLException e) {
			System.out.println("SQL 접속 예외 :" + e.getErrorCode());
		} 
		
		}
	
	public void close() {
		try { // 연결을 끊을때는 항상 열었던 역순으로 닫는다
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}

	public MemberDTO selectMemberOne(MemberDTO dto) {
		String sql = "SELECT * FROM member WHERE id='%s' and pw='%s'";
		
		sql = String.format(sql, dto.getId(),dto.getPw());
		
		System.out.println(sql);
		
		try {
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			MemberDTO login = new MemberDTO();
			
			login.setEmail(rs.getString("email"));
			login.setId(rs.getString("id"));
			login.setJoinDate(rs.getDate("joinDate"));
			login.setName(rs.getString("name"));
			login.setPw(rs.getString("pw"));
			
			return login;
		
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		
		
		return null;
	}
	
	public int insertMember(MemberDTO dto) {
		String sql = "INSERT INTO member VALUES('%s','%s','%s','%s','%s')";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(new Date());
		
		sql = String.format(sql, dto.getId(), dto.getPw(), dto.getName(), dto.getEmail(), time);
		
		try {
		int row = stmt.executeUpdate(sql);
		return row;
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		return 0;
	}
	
	public ArrayList<BoardDTO> selectBoard(){
		String sql = "SELECT * FROM BOARD ORDER BY IDX DESC";
		
		try {
			rs = stmt.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
					
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setContents(rs.getString("contents"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setId(rs.getString("id"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpAddr(rs.getString("ipAddr"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				
				list.add(dto);
			}

			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		return null;
	}

	public BoardDTO selectBoardOne(int idx) {
		String sql = "SELECT * FROM board WHERE idx = " + idx;
		
		try {
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			BoardDTO dto = new BoardDTO();
			
			dto.setContents(rs.getString("contents"));
			dto.setCreateDate(rs.getDate("createDate"));
			dto.setId(rs.getString("id"));
			dto.setIdx(rs.getInt("idx"));
			dto.setIpAddr(rs.getString("ipAddr"));
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
	
	public int insertBoard (BoardDTO dto) {
		String sql = "INSERT into board values (BOARD_SEQ.nextval, '%s', '%s', '%s', '%s', '%s', 0)";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(new Date());
		
		sql = String.format(sql, dto.getTitle(), dto.getContents(), dto.getId(), time, dto.getIpAddr());
		
		
		try {
			int row = stmt.executeUpdate(sql);
			
			return row;
		
		} catch (SQLException e) {
			System.out.println("SQL구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		return 0;
	}
	
	public int deleteBoard (int idx) {
		String sql = "DELETE FROM BOARD WHERE idx ="+ idx;
		
		try {
			int row = stmt.executeUpdate(sql);
			
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		
		
		return 0;
	}
	
	public int viewCountUp (int idx) {
		String sql = "UPDATE board SET viewcount = viewcount + 1 WHERE idx = " + idx;
		try {
			int cp = stmt.executeUpdate(sql);
			
			return cp;
		
		} catch (SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		
		return 0;
	}
	
}
