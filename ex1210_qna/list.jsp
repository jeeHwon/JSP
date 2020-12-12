<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
  	
	//id값 가져오기
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "select * from qna order by grp desc, seq asc";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
    
    
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>grp</td>
			<td>seq</td>
			<td>depth</td>
		</tr>
		<%while(rs.next()){
			//질문일 경우 str에는 값을 주지 않고, 답글일 경우 아이콘+간격(&nbsp;)을 부여
			String str="";
			for(int i=0; i<rs.getInt("depth"); i++){
				str = str+"&nbsp;&nbsp;&nbsp;";
			}
		%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=str %><a href="content.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a></td>
			<td><%=rs.getString("writeday") %></td>
			<td><%=rs.getString("grp") %></td>
			<td><%=rs.getString("seq") %></td>
			<td><%=rs.getString("depth") %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="3"><a href="write.jsp">질문 글쓰기</a></td>
		</tr>
	
	</table>

</body>
</html>