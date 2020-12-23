package jspPJ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB_Conn_old2 {
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn;
	
	public DB_Conn_old2() throws ClassNotFoundException, SQLException{
		//메소드별 공통 요소를 생성자에서 만들고, 나머지 기능만을 메서드로 구현
		Class.forName("com.mysql.jdbc.Driver");	
		conn = DriverManager.getConnection(url, user, password);
		
	}
	
	public void conn_close() throws SQLException {
		conn.close();
	}
	
	public void insert(String title, String name, String content, String pwd) 
			throws SQLException {
		
		//쿼리 생성
		String sql = "insert into board (title, name, content, pwd, writeday) ";
		sql += " values (?, ?, ?, ?, now())";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, name);
		pstmt.setString(3, content);
		pstmt.setString(4, pwd);
		
		//쿼리 실행
		pstmt.executeUpdate();
		
		pstmt.close();
		
	}
	public ResultSet list() throws ClassNotFoundException, SQLException {
	
		//쿼리생성
		String sql = "select * from board order by id desc";
		
		//심부름꾼 생성
		Statement stmt = conn.createStatement();
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery(sql);
		
		return rs;
	}
	public ResultSet content(String id) throws ClassNotFoundException, SQLException {
	
		//request값 가져오기
		
		//쿼리생성
		String sql = "select * from board where id="+id;
		
		//심부름꾼 생성
		Statement stmt = conn.createStatement();
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery(sql);
		
		return rs;
	}
	public void update(String title, String name, String content, String pwd, String id) 
			throws SQLException, ClassNotFoundException {
	
		//쿼리 생성
		String sql = "update board set title='"+title+"', name='"+name+"', content='"+content+"', pwd='"+pwd+"' ";
		sql += " where id= '"+id+"' ";
		
		//심부름꾼
		Statement stmt = conn.createStatement();
		
		//쿼리 실행
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	}
	public void delete(String id) throws ClassNotFoundException, SQLException {
	
		//쿼리 생성
		String sql = "delete from board where id=" + id;
		
		//심부름꾼
		Statement stmt = conn.createStatement();
		
		//쿼리 실행
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	}

}
