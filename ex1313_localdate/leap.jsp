<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		var year = document.frm.year.value;
		var month = document.frm.month.value;
		var date = new Date(year, month, 0); // 0을 넣으면 마지막 날을 리턴
		var end_date = date.getDate()		 // 마지막날짜만 받아옴
		document.frm.day.options.length=end_date
		for(i=0; i<end_date; i++){
			document.frm.day.options[i].value=i+1
			document.frm.day.options[i].text=i+1+'일'
		}
	}

</script>
</head>
<body onload="check()">
	<form name="frm" method="post" action="view.jsp">
		<h3> 날짜를 입력하고 버튼을 클릭하면  해당 날짜로부터 100일, 1년 , 10년 뒤의 날짜를 보여줍니다.</h3>
		<select name="year" onchange="check()">
			<c:forEach var="i" begin="2000" end="2050">
			<option value="${i}">${i}년</option>
			</c:forEach>
		</select>
		<select name="month" onchange="check()">
			<c:forEach var="i" begin="1" end="12">
			<option value="${i}">${i}월</option>
			</c:forEach>
		</select>
		<select name="day">
		</select>
		<input type="submit" value="확인하기">
	</form>
</body>
</html>