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
	String pager = request.getParameter("pager");
	String cla = request.getParameter("cla");
	String sword = request.getParameter("sword");
	
	//쿼리 생성
	String sql = "select * from gesipan where id="+id;
	
	//심부름꾼 생성
	Statement stmt  = conn.createStatement();
	
	//쿼리 실행 => ResultSet 저장
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//성별, 취미, 태어난 해를 적용하여 처음 선택했던 값으로 표현
	function init(){
		//성별 : 1
		document.frm.sung[<%=rs.getInt("sung")%>].checked=true
		
		//취미 : 0, 2, 4
		var hob = "<%=rs.getString("hobby")%>"
		var hobs = hob.split(",")
		
		document.frm.hobby[2].checked=true
		for (i=0; i<hobs.length; i++){
			document.frm.hobby[hobs[i]].checked=true
		}
		
		//태어난해
		document.frm.birth.value=<%=rs.getString("birth")%>
	}
</script>
</head>
<body onload="init()">
	<form name="frm" method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="pager" value="<%=pager%>">
		<input type="hidden" name="cla" value="<%=cla%>">
		<input type="hidden" name="sword" value="<%=sword%>">
		<table width="600" align="center">
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title" size="40" value="<%=rs.getString("title")%>"></td>
			</tr>
			<tr>
				<td>이 름</td>
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="40" rows="5" name="content"><%=rs.getString("content") %></textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sung" value="0">남자
					<input type="radio" name="sung" value="1">여자
					<input type="radio" name="sung" value="2">선택안함
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="0">서핑
					<input type="checkbox" name="hobby" value="1">등산
					<input type="checkbox" name="hobby" value="2">영화감상
					<input type="checkbox" name="hobby" value="3">독서
					<input type="checkbox" name="hobby" value="4">헬스
					<input type="checkbox" name="hobby" value="5">자전거
				</td>
			</tr>
			<tr>
				<td>태어난 해</td>
				<td>
					<select name="birth">
						<%for(int i=2020; i>1960; i--) {%>
						<option value="<%=i%>"><%=i%></option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>





























