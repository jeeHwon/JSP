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
String sql = "select * from student ";

//심부름꾼 생성
Statement stmt = conn.createStatement();

//쿼리 실행 => ResultSet
ResultSet rs = stmt.executeQuery(sql);


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
</head>
<body>
	<div align="center">
		<h2>본인의 정보를 입력하세요</h2>
	</div>
	<form id="frm" name="frm" method="post" action="stu_input_ok.jsp">
		<input type="hidden" name="id">
		<table width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>학번</td>
				<td><input type="text" name="hakbun"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zip" id="sample6_postcode"
					placeholder="우편번호"><input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="juso" id="sample6_address"
					placeholder="주소"></td>
			</tr>
			<tr>
				<td>나머지주소</td>
				<td><input type="text" name="juso_etc"
					id="sample6_detailAddress" placeholder="나머지주소"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="submit" type="submit"
					value="정보입력"></td>
			</tr>
		</table>
	</form>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = ''; 
							var extraAddr = ''; 
							if (data.userSelectedType === 'R') { 
								addr = data.roadAddress;
							} else { 
								addr = data.jibunAddress;
							}
							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddress").focus();
						}
					}).open();
			
		}
	</script>
	<!-- 레코드 내용 출력 -->
	<div align="center">
		<table width="600">
			<tr>
				<td>이름</td>
				<td>학번</td>
				<td>생년월일</td>
				<td>우편번호</td>
				<td>주소</td>
				<td>나머지주소</td>
				<td>전화번호</td>
				<td>작성일</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("hakbun")%></td>
				<td><%=rs.getString("birth")%></td>
				<td><%=rs.getString("zip")%></td>
				<td><%=rs.getString("juso")%></td>
				<td><%=rs.getString("juso_etc")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("writeday")%></td>
			</tr>
			<%
			}
		%>
		</table>
	</div>

</body>
</html>