package jspPJ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import jspPJ.dto.BoardDto;

public class DB_Conn {
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn;
	
	public DB_Conn() throws ClassNotFoundException, SQLException{
		//메소드별 공통 요소를 생성자에서 만들고, 나머지 기능만을 메서드로 구현
		Class.forName("com.mysql.jdbc.Driver");	
		conn = DriverManager.getConnection(url, user, password);
	}
	
	public void conn_close() throws SQLException {
		conn.close();
	}
	
	public void insert(BoardDto bdto) throws SQLException {
		//쿼리 생성
		String sql = "insert into board (title, name, content, pwd, writeday) ";
		sql += " values (?, ?, ?, ?, now())";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		
		//쿼리 실행
		pstmt.executeUpdate();
		pstmt.close();
		
	}
	public ArrayList<BoardDto> list() throws ClassNotFoundException, SQLException {
		//쿼리생성
		String sql = "select * from board order by id desc";
		
		//심부름꾼 생성
		Statement stmt = conn.createStatement();
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery(sql);
		
		//BoardDto를 여러개 담을 수 있는 ArrayList 생성
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		//ArrayList 객체를 반환
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
		//쿼리생성
		String sql = "select * from board where id="+id;
		
		//심부름꾼 생성
		Statement stmt = conn.createStatement();
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		BoardDto bdto = new BoardDto();
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		
		return bdto;
	}
	public void update(BoardDto bdto) throws SQLException, ClassNotFoundException {
		//쿼리 생성
		String sql = "update board set title=?, name=?, content=?, pwd=? ";
		sql += " where id= ? ";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		pstmt.setInt(5, bdto.getId());
		
		//쿼리 실행
		pstmt.executeUpdate();
		pstmt.close();
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