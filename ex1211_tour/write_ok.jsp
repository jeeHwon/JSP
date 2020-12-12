<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>  
<%@ page import="java.sql.*"%>    
    
<%
	//cos.jar 라이브러리를 통해 파일을 업로드
	String path = "C:/Users/HOME/eclipse-workspace/jspPJ/WebContent/ex1211_tour_img";
				   
	int size= 1024*1024*10;
	String han = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());
	
	//폼에 입력된 값을 읽어와서 DB에 저장
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String fname = multi.getFilesystemName("fname");		//서버에 저장되는 이름
	//multi.getOrihinalFileName("fname")					//클라이언트에 있던 원래이름
	//File file = multi.getFile("fname")
	//long fsize = file.lenth();							//파일크기
	
	//쿼리 생성
	String sql = "insert into tour (name, title, content, fname, writeday) ";
	sql += " values (?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setString(4, fname);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();

%>