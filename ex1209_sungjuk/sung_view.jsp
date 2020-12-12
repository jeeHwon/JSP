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

	// limit에 들어갈 index 번호 생성
	int index; //limit에 전달할 index 값
	int pager; //page 는 jsp 에서 예약어라 변수 사용불가
	if (request.getParameter("pager") == null) {
		pager = 1;
	} else {
		pager = Integer.parseInt(request.getParameter("pager"));
	}
	//index 만들기
	
	//정렬순서 cla 변수값이 안들어오는경우, cla=kor
	
	String ord = "";
	if(request.getParameter("cla")==null){
		ord = "name";
	}else if(request.getParameter("cla").equals("hap")){
		ord = "(kor+eng+mat+sci) desc";
	}else{
		ord=request.getParameter("cla")+" desc";
	}
	index = (pager - 1) * 10;
	//쿼리 생성
	String sql = "select * from sung order by "+ord;

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
</script>
</head>
<body>
<div align="center">
	<h2>본인의 성적을 입력하세요</h2></div>
	<form name="frm" method="post" action="input_ok.jsp" onsubmit="return false">
		<table width="600" align="center">

			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="pwd2"></td>
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
				<td colspan="2" align="center"><input type="submit" value="성적입력" onclick="frmchk()">
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

		</tr>
		<%
			}
		%>
		<!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<tr>
			<td colspan="4" align="center">
				<%
					//총 페이지 값을 구하기 (총 레코드수 /페이지당 레코드수)
					sql = "select count(*) as cnt from gesipan";
					ResultSet rs2 = stmt.executeQuery(sql);
					rs2.next();
					int page_cnt = (int)Math.ceil(rs2.getInt("cnt")*0.1);
					
					int pstart = (int)Math.ceil(pager*0.1)*10-9;
					int pend = pstart + 9;

					if(page_cnt < pend){
						pend = page_cnt;
					}
				%> <!-- 이전 페이지 --> <!-- 현재 페이지 그룹 이전 10페이지 --> <%
					if (pstart!=1){
				%> <a href="list.jsp?pager=<%=pstart-1%>">☜</a> <%
					} else{
				%> ☜ <%
					}
				%> <!-- 현재 페이지 기준 1페이지 이전 --> <%
					if (pager !=1){
				%> <a href="list.jsp?pager=<%=pager-1%>">◀</a> <%
					} else{
				%> ◀ <%	
					}
				%> <%
					for (int i = pstart; i <= pend; i++) {
						String str = "";
						if(pager ==i){
							str="style='font-weight:bold;color:blue'";
						}
				%> <a href="list.jsp?pager=<%=i %>" <%=str %>><%=i %></a> <%
					}
				%> <!-- 다음 페이지 --> <!-- 현재 페이지 기준 1페이지 이후 --> <%
					if (pager < page_cnt){
				%> <a href="list.jsp?pager=<%=pager+1%>">▶</a> <%
					}else{
				%> ▶ <%
					}
				%> <!-- 현재 페이지 기준 다음 그룹페이지 --> <%
					if(pend!=page_cnt){
				%> <a href="list.jsp?pager=<%=pend+1%>">☞</a> <%
					} else{
				%> ☞ <%
					}
				%>
			</td>
		</tr>


	</table>
	</div>

</body>
</html>