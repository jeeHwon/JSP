<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.time.LocalDate" %>
<%
	//달력을 만들기 위해 필요한 값 => 해당월의 총일수, 해당월의 1일의 요일
	//이번달 달력
	LocalDate today = LocalDate.now();				//현재시간
	int chongDay = today.lengthOfMonth();			//달의 총일수 구하는 메소드
	//out.print(day);
	
	//1일의 요일을 구하기 전에 ?년 ?월 1일에 대한 날짜 객체를 생성
	int yy = today.getYear();
	int mm = today.getMonthValue();
	LocalDate dday = LocalDate.of(yy,mm,1);			//of(yy,mm,dd) =>해당 년,월,일의 객체 생성
	int day = today.getDayOfWeek().getValue();		//요일의 값을 숫자로 => 1~7(월~일)의 값
	if(day==7){day = 0;}							//일요일 7 => 0으로 수정
	int week = (int)Math.ceil((chongDay-day)/7.0);	//(31+2)/7 => 33/7 => 4.xx
	out.print(week);
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1px solid black">	
		<!--week행 7열의 테이블 생성  -->
		<%int first = 1; %>
		<%for(int i =0; i<week; i++){ %>
		<tr>
			<%for (int j=0; j<7; j++) {%>
				<%if((j<day && i==0)||(chongDay<first)){ %>
					<td>&nbsp;</td>
				<%} else{ %>	
					<td><%=first %></td>
					<%first++; %>
				<%} %>
			<%} %>
		</tr>
		<%} %>
	</table>
</body>
</html>