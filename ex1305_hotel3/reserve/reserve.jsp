<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 달력을 만들기 위해 필요한 값 => 해당월의 총일수, 해당월의 1일의 요일, 해당월의 주수
	// 이번달 달력
	LocalDate today = LocalDate.now();		// 현재시간
	double chong = today.lengthOfMonth(); 	// 총일수를 구하는 메소드
	
	int year = today.getYear();
	int month = today.getMonthValue();
	
	// 1일의 요일을 구하기 전에 ?년 ?월 1일에 대한 날짜 객체를 생성
	LocalDate dday = LocalDate.of(year, month, 1);	// 해당 년,월,일의 객체 생성
	int yoil = dday.getDayOfWeek().getValue();		// 요일의 값을 숫자로 1~7(월~일)
	if(yoil==7) yoil=0;								// 일요일라면 -> 0
	int ju = (int)Math.ceil((chong+yoil)/7);		//(31+2)/7 => 4.xx
	
%>
<%@ page import="hotel.HotelDAO" %>
<%@ page import="hotel.HotelDTO" %>
<%@ page import="java.util.ArrayList" %>
<%
	// room 테이블에서 우리 호텔의 방 이름 가져오기
	HotelDAO hdao = new HotelDAO();
	ArrayList<HotelDTO> list = hdao.get_room();
	pageContext.setAttribute("list", list);
	
	// el 표현식으로 접근하기 위해 pageContext 영역에 변수를 set 
	// ju(주), chong(총일수), yoil(요일),  year, month
	pageContext.setAttribute("ju", ju);			// 4.xx 주
	pageContext.setAttribute("chong", chong);	// 31일
	pageContext.setAttribute("yoil", yoil);		// 5(금) - 2021년 1월 첫째날 요일 
	pageContext.setAttribute("year", year);		// 2021년
	pageContext.setAttribute("month", month);	// 1월
	
%>
<%@ include file="../top.jsp" %>  
<style>
	#section{
      width:1100px;ㄴ
      height:1050px;
      margin:auto;
      border:1px solid red;
	}
</style>
<div id="section">
	<table width="1000" height="600" border="1" align="center">
	<c:set var="day" value="1"/>
	<c:forEach var="i" begin="1" end="${ju}">
	<tr>
		<c:forEach var="j" begin="0" end="6">
			<c:if test="${(j<yoil and i==1) or chong < day}">
				<td>&nbsp;</td>	<!-- (금욜 전이고 첫째주) or 31일보다 커지는경우(막일 초과경우) 빈칸-->
			</c:if>
			<c:if test="${((j>=yoil and i==1) or i>1) and chong >= day }">
				<td>${day}<br>	<!-- (첫째주에서 금욜이후거나) 둘째주이고 31일전까지는 day 출력 -->
					<c:forEach var="hdto" items="${list }">
						 <a href="reserve_next.jsp?year=${year}&month=${month}&day=${day}
						 	&id=${hdto.id}">${hdto.name}</a><br>
					</c:forEach>
				</td>
			<c:set var="day" value="${day+1 }"/>
			</c:if>
		</c:forEach>
	</tr>
	</c:forEach>
	</table>
</div>
<%@ include file="../bottom.jsp" %> 