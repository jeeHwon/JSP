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
	
	//request 값 읽어오기
	String id = request.getParameter("id");
	
	//쿼리 생성
	String sql = "select * from gesipan where id="+id;
	
	//심부름꾼 생성
	Statement stmt  = conn.createStatement();
	
	//쿼리 실행 => ResultSet 저장
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//성별
	String sung = null;
	switch(rs.getInt("sung")){
	case 0 : sung = "남자"; break;
	case 1 : sung = "여자"; break;
	case 2 : sung = "선택안함"; break;
	}
	
	//취미구하기
	//','로 구분된 필드의 값을 나눈다
	String[] hobby = rs.getString("hobby").split(",");
	String hob = "";
	for (int i = 0; i< hobby.length; i++){
		switch(hobby[i]){
		case "0" : hob += " 서핑"; break;
		case "1" : hob += " 등산"; break;
		case "2" : hob += " 영화감상"; break;
		case "3" : hob += " 독서"; break;
		case "4" : hob += " 헬스"; break;
		case "5" : hob += " 자전거"; break;
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{
		border:1px solid #cccccc
	}
	#del {
		position:absolute;
		visibility:hidden;
	}
</style>
<script>
	function view_del(){
		var x = event.clientX
		var y = event.clientY
		document.getElementById("del").style.visibility="visible"
		document.getElementById("del").style.left=(x-30)+"px"
		document.getElementById("del").style.top=(y+30)+"px"
	}
</script>
</head>
<body>
	<!-- 하나의 레코드 내용을 출력 -->
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td><%=rs.getString("name")%></td>
			<td>성별</td>
			<td><%=sung%></td>
			<td>취미</td>
			<td><%=hob%></td>
		</tr>
		<tr>
			<td>태어난해</td>
			<td colspan="2"><%=rs.getString("birth")%></td>
			<td>작성일</td>
			<td colspan="2"><%=rs.getString("writeday")%></td>
		</tr>
		<tr>
			<td>제 목</td>
			<td colspan="5"><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<td>내 용</td>
			<td colspan="5"><%=rs.getString("content")%></td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<a href="update.jsp?id=<%=rs.getInt("id")%>">수정</a>
				<a href="#" onclick="view_del()">삭제</a>
				<a href="list.jsp">목록</a>
			
			</td>
		</tr>
		<%if(request.getParameter("chk") != null){ %>
			<tr>
				<td colspan="6" align="center" style="color:red;">비밀번호가 틀렸습니다</td>
			</tr>
		<%} %>
	</table>
	
	<form method="post" action="delete.jsp" id="del">
		<input type="hidden" name="id" value="<%=id%>">
		비밀번호<input type="password" name="pwd" size="4">
		<input type="submit" value="삭제">
	</form>
</body>
</html>

























