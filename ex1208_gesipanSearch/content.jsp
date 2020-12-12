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
		border:1px solid #cccccc;
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
		document.getElementById("del").style.left=(x+100)+"px"
		document.getElementById("del").style.top=(y-20)+"px"
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
				<a href="update.jsp?id=<%=rs.getInt("id")%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">수정</a>
				<a href="#" onclick="view_del()">삭제</a>
				<a href="list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록</a>
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
		<input type="hidden" name="pager" value="<%=pager%>">
		<input type="hidden" name="cla" value="<%=cla%>">
		<input type="hidden" name="sword" value="<%=sword%>">
			비밀번호<input type="password" name="pwd" size="4">
		<input type="submit" value="삭제">
	</form>
	
	<!-- 댓글관련 함수 추가 -->
	<script>
		function update(datid){
			//폼태그의 action="dat_update_ok.jsp"로 변경, submit의 value를 댓글수정"
			document.getElementById("dat").action="dat_update_ok.jsp"
			document.getElementById("submit").value="댓글수정"
			document.getElementById("name").style.visibility="visible"
			document.getElementById("content").style.visibility="visible"
			document.dat.id.value=datid;
		}
		function del(datid){
			//폼태그의 action="dat_delete.jsp"로 변경, submit의 value를 댓글삭제"
			document.getElementById("dat").action="dat_delete.jsp"
			document.getElementById("submit").value="댓글삭제"
			document.getElementById("name").style.visibility="hidden"
			document.getElementById("content").style.visibility="hidden"
			document.dat.id.value=datid;
		}
	</script>
	
	<!-- 댓글 관련 작업 -->
	<!-- 댓글 입력 폼 => 작성자, 내용, 비번 -->
	<div align="center">
		<form id="dat" name="dat" method="post" action="dat_write_ok.jsp">
			<input type="hidden" name="gid" value="<%=id%>">	<!--gesipan 테이블 id -->
			<input type="hidden" name="id">	<!--dat 테이블 id -->
			<input type="text" name="name" size="5" placeholder="작성자" id="name">
			<input type="text" name="content" size="50" placeholder="댓글내용" id="content">
			<input type="text" name="pwd" size="5" placeholder="비밀번호">
			<input type="submit" value="댓글달기" id="submit">
		</form>
	</div>
	
	<!-- 댓글 출력 -->
	<%
		//DB 연결 => 위에서 이미 완료
		
		//쿼리 생성
		sql = "select * from dat where gid="+id;
		
		//심부름꾼 생성 => 위에서 이미 완료
				
		//쿼리실행 후 => ResultSet
		rs = stmt.executeQuery(sql);
	%>
	<div align="center">
		<table align="center" width="600">
			<%while(rs.next()){ %>
				<tr>
					<td width="60"><a href="javascript:update(<%=rs.getString("id")%>)"><%=rs.getString("name") %></a></td>
					<td><%=rs.getString("content")%></td>
					<td width="100"><a href="javascript:del(<%=rs.getString("id")%>)"><%=rs.getString("writeday") %></a></td>
				</tr>
			<%} %>
		</table>
	</div>
</body>
</html>


















