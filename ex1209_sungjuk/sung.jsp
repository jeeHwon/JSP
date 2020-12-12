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
	String sql = "select * from sung where id="+id;
	
	//심부름꾼 생성
	Statement stmt  = conn.createStatement();
	
	//쿼리 실행 => ResultSet 저장
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	int hap = Integer.parseInt(rs.getString("kor"));
	hap = hap + Integer.parseInt(rs.getString("eng"));
	hap = hap + Integer.parseInt(rs.getString("mat"));
	hap = hap + Integer.parseInt(rs.getString("sci"));
	double avg = hap / 4;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	var kor = <%=rs.getInt("kor")%>
	var eng = <%=rs.getInt("eng")%>
	var mat = <%=rs.getInt("mat")%>
	var sci = <%=rs.getInt("sci")%>
	function grade(){
		document.getElementById("kor").innerHTML= sung(kor)
		document.getElementById("eng").innerHTML= sung(eng)
		document.getElementById("mat").innerHTML= sung(mat)
		document.getElementById("sci").innerHTML= sung(sci)
	}
	
	function sung(i){
	    if (i>=90 && i<=100) {
	    	a = "A"
	        return a
	    } else if(i>=80 && i <90) {
	    	b = "B"
		    return b
	    } else if(i>=70 && i <80) {
	    	c = "C"
		    return c
	    } else {
	    	d = "D"
	    	return d
	    }
	}

</script>
</head>
<body onload="grade()">
	<table width="600">
		<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>과학</td>
			<td>합계</td>
			<td>평균</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td id="kor"></td>
			<td id="eng"></td>
			<td id="mat"></td>
			<td id="sci"></td>
			<td><%=hap%></td>
			<td><%=avg%></td>
			<td><%=rs.getString("writeday")%></td>
		</tr>
	</table>
</body>
</html>