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
	
	//requset 값 가져오기
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "select * from student where id="+ id;
	
	//심부름꾼 
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h2>본인의 정보를 입력하세요</h2>
	</div>
	<form id="frm" name="frm" method="post" action="stu_update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<table width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<td>학년</td>
				<td>
					<select name="year">
						<option value="01">1학년</option>
						<option value="02">2학년</option>
						<option value="03">3학년</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>반</td>
				<td>
					<select name="ban">
						<option value="01">1반</option>
						<option value="02">2반</option>
						<option value="03">3반</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth" value="<%=rs.getString("birth")%>"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zip" id="sample6_postcode"
					placeholder="우편번호" value="<%=rs.getString("zip")%>"><input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="juso" id="sample6_address"
					placeholder="주소" value="<%=rs.getString("juso")%>"></td>
			</tr>
			<tr>
				<td>나머지주소</td>
				<td><input type="text" name="juso_etc"
					id="sample6_detailAddress" placeholder="나머지주소" value="<%=rs.getString("juso_etc")%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
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
</body>
</html>