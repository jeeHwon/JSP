package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import board.dto.BoardDto;

public class BoardDao {
	
	String url = "jdbc:mysql://localhost:3307/mydb";
	String user = "root";
	String password = "1234";
	Connection conn = null;
	
	public BoardDao () throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");	
		conn = DriverManager.getConnection(url, user, password);
	}
	
	public void insert(BoardDto bdto) throws SQLException {
		String sql = "insert into board (title, name, content, pwd, writeday) ";
		sql += " values (?, ?, ?, ?, now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	public ArrayList<BoardDto> list() throws SQLException {
		String sql = "select * from board order by id desc";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		while(rs.next()) {
			BoardDto bdto = new BoardDto();
			bdto.setTitle(rs.getString("title"));
			bdto.setName(rs.getString("name"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setWriteday(rs.getString("writeday"));
			bdto.setId(rs.getInt("id"));
			list.add(bdto);
		}
		return list;
	}
	
	public BoardDto content(String id) throws ClassNotFoundException, SQLException {
		String sql = "select * from board where id="+id;
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		BoardDto bdto = new BoardDto();
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		bdto.setPwd(rs.getString("pwd"));
		
		return bdto;
	}
	
	public void update(BoardDto bdto) throws SQLException, ClassNotFoundException {
		String sql = "update board set title=?, name=?, content=?, pwd=? ";
		sql += " where id= ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		pstmt.setInt(5, bdto.getId());
		
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	public void delete(String id) throws ClassNotFoundException, SQLException {
		String sql = "delete from board where id=" + id;
		
		Statement stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	}
	
	public void readnum(String id) throws ClassNotFoundException, SQLException {
		String sql = "update board set readnum = readnum + 1 where id=" + id;
		
		Statement stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	}
	
	public ArrayList<BoardDto> getIndex(int index) throws ClassNotFoundException, SQLException {
		String sql = "select * from board order by id desc limit "+index+", 10";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		while(rs.next()) {
			BoardDto bdto = new BoardDto();
			bdto.setTitle(rs.getString("title"));
			bdto.setName(rs.getString("name"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setWriteday(rs.getString("writeday"));
			bdto.setId(rs.getInt("id"));
			list.add(bdto);
		}
		return list;
	}
	
	public int getCnt() throws ClassNotFoundException, SQLException {
		String sql = "select count(*) as cnt from board ";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		int cnt = rs.getInt("cnt");
		stmt.close();
		conn.close();
		
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
