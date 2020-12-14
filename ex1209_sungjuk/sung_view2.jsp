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

	//쿼리 생성
	String sql = "select * from sung ";

	//심부름꾼 생성
	Statement stmt = conn.createStatement();

	//쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	
	//1. 이름이 입력되었는지 체크
	
	//2. 과목 값 입력되었는지 체크 숫자로만 입력인지 체크 0-100사이값인지 체크
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: None;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: crimson;
}
</style>
<script>
	function view(id){
		window.open("sung.jsp?id="+id,"","width=400, height=200")
	}
	function frmchk(){
		frm = document.frm
		if(frm.name.value.length == 0){
			alert("이름을 입력하세요")
			return false
		}
		var IsSungInput = frm.kor.value.length * frm.eng.value.length * frm.mat.value.length * frm.sci.value.length 
		if(IsSungInput == 0){
			alert("과목 점수를 입력하세요")
			return false
		}
		var IsSungNum = frm.kor.value + frm.eng.value + frm.mat.value + frm.sci.value
		
		if(isNaN(Number(IsSungNum))){
			alert("점수를 숫자로 입력하세요")
			return false
		}
		var arrSung = [frm.kor.value, frm.eng.value, frm.mat.value, frm.sci.value]
		for(i=0; i<arrSung.length; i++){
			if(arrSung[i]<0 || arrSung[i]>100){
				alert("점수는 0이상 100이하의 숫자로 입력하세요")
				return false
			}
		}
		frm.submit();
	}
	function update(datid){
		//폼태그의 action="sung_update_ok.jsp"로 변경, submit의 value를 댓글수정"
		document.getElementById("frm").action="sung_update_ok.jsp"
		document.getElementById("frm").onsubmit="return true"
		document.getElementById("submit").value="성적수정"
		document.getElementById("pwd2").style.visibility="hidden"

		document.frm.id.value=datid;
	}
</script>
</head>
<body>
<div align="center">
	<h2>본인의 성적을 입력하세요</h2></div>
	<form id="frm" name="frm" method="post" action="input_ok.jsp" onsubmit="return false">
		<input type="hidden" name="id">
		<table width="600" align="center">
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr id="pwd2">
				<td>비밀번호확인</td>
				<td><input type="password" name="pwd2" ></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="text" name="kor"></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="text" name="mat"></td>
			</tr>
			<tr>
				<td>과학</td>
				<td><input type="text" name="sci"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="submit" type="submit" value="성적입력" onclick="frmchk()">
				</td>
			</tr>
		</table>
	</form>
	<!-- 레코드 내용 출력 -->
	<div align="center">
	<table width="600">
		<tr>
			<td>이름</td>
			<td><a href="sung_view.jsp?cla=kor">국어</a></td>
			<td><a href="sung_view.jsp?cla=eng">영어</a></td>
			<td><a href="sung_view.jsp?cla=mat">수학</a></td>
			<td><a href="sung_view.jsp?cla=sci">과학</a></td>
			<td><a href="sung_view.jsp?cla=hap">합계</a></td>
			<td><a href="sung_view.jsp?cla=hap">평균</a></td>
			<td>작성일</td>
			<td>수정</td>
			

		</tr>
		<%
			while (rs.next()) {
				int hap = Integer.parseInt(rs.getString("kor"));
				hap = hap + Integer.parseInt(rs.getString("eng"));
				hap = hap + Integer.parseInt(rs.getString("mat"));
				hap = hap + Integer.parseInt(rs.getString("sci"));
				double avg = hap / 4;
		%>
		<tr>
			<td><a href="javascript:view(<%=rs.getInt("id")%>)"><%=rs.getString("name")%></a></td>
			<td><%=rs.getString("kor")%></td>
			<td><%=rs.getString("eng")%></td>
			<td><%=rs.getString("mat")%></td>
			<td><%=rs.getString("sci")%></td>
			<td><%=hap%></td>
			<td><%=avg%></td>
			<td><%=rs.getString("writeday")%></td>
			<td><a href="javascript:update(<%=rs.getInt("id")%>)">클릭</a></td>

		</tr>
		<%
			}
		%>
	</table>
	</div>

</body>
</html>