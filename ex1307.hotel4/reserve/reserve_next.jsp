<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hotel.HotelDAO" %>
<%@ page import="hotel.HotelDTO" %>
<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String room_id = request.getParameter("room_id");		//room테이블의 id
	
	String sday = year + "-" + month + "-" + day;
	pageContext.setAttribute("sday", sday);
	
	//사용자가 선택한 방의 정보를 읽어오기
	HotelDAO hdao = new HotelDAO();
	HotelDTO hdto = hdao.select_room(room_id);
	pageContext.setAttribute("hdto",hdto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="reserve_ok.jsp">
		<table width="500" align="center">
			<tr>
				<td colspan="2" align="center"><h3>숙박관련</h3></td> 
			</tr>
			<tr>
				<td>예약할 객실</td>
				<td>${hdto.name}</td>
			</tr>
			<tr>
				<td>예약자</td>
				<td><input type="text" name="name"></td>
			</tr>
	        <tr>
	        	<td>전화번호</td>
	        	<td><input type="text" name="phone"></td>
            </tr>
			<tr>
				<td>체크인</td>
				<td>${sday}</td>
			</tr>
			<tr>
				<td>숙박예정</td>
				<td>
					<select>
					<c:forEach var="i" begin="1" end="8">
						<option value="${i}">${i}박</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>
					성인<select>
						<c:forEach var="i" begin="0" end="7">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
					어린이<select>
						<c:forEach var="i" begin="0" end="7">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
					유아<select>
						<c:forEach var="i" begin="0" end="7">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">숙박비용 : <span id="main_price"></span>원</td>
			</tr>
			
	        <tr>
           		<td colspan="2" align="center"><h3>옵션사항</h3></td>
            </tr>
			<tr>
				<td>성인조식</td>
				<td>
	            	<select>
			            <option value="1">1개</option>
			            <option value="2">2개</option>
			            <option value="3">3개</option>
            		</select>
				</td>
			</tr>
			<tr>
				<td>엑스트라 베드</td>
				<td>
	            	<select>
			            <option value="1">1개</option>
			            <option value="2">2개</option>
			            <option value="3">3개</option>
            		</select>
				</td>
			</tr>
			<tr>
				<td>어린이 조식</td>
				<td>
	            	<select>
			            <option value="1">1개</option>
			            <option value="2">2개</option>
			            <option value="3">3개</option>
            		</select>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="right"> 옵션비용 : <span id="etc_price"></span>원 </td>
			</tr>
			<tr>
				<td colspan="2" align="right"> 요금합계 : <span id="tot_price"></span>원 </td>
			</tr>

		
		</table>
	</form>
</body>
</html>