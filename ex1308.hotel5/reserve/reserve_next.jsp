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
<script>
	// 전역변수 초기화
	var main_price = 0	//숙박비용
	var add_total = 0	//숙박추가비용
	var etc = 0			//옵션비용
	
	function suk_cal(){
		//숙박일수에 따른 숙박비용
		var suk_day = document.getElementById("suk_day").value // 몇박인지
		main_price = ${hdto.price} * suk_day				   // 하루가격 * 몇박
		
		//인원추가에 따른 추가요금
		var people1 = parseInt(document.getElementById("people1").value)	//성인
		var people2 = parseInt(document.getElementById("people2").value)	//청소년
		var people3 = parseInt(document.getElementById("people3").value)	//유아
		var people = people1 + people2 + people3							//총인원
		
		//최대인원 초과여부
		if(${hdto.max_in}<people){	//최대인원 초기시 선택인원 초기화
			document.getElementById("people1").selectedIndex=0
			document.getElementById("people2").selectedIndex=0
			document.getElementById("people3").selectedIndex=0
			document.getElementById("main_price").innerText = main_price
			
		} else{
			if(people > ${hdto.min_in}){	// 숙박인원이 최소인원보다 크다면
				var a_price = 10000			// 1인당 추가요금
				var add_people = people - ${hdto.min_in}	
				add_total = (a_price * add_people)*suk_day
			} else{
				add_total = 0
			}
			
			//기존 숙박비용 + 추가인원요금(add_total)
			document.getElementById("main_price").innerText = main_price + add_total
			document.getElementById("tot_price").innerText = main_price + add_total + etc
		}
	}
	function etc_cal(){
		// 옵션 가격의 합
		var etc1 = 25000 * parseInt(document.getElementById("etc1").value)
		var etc2 = 10000 * parseInt(document.getElementById("etc2").value)
		var etc3 = 12000 * parseInt(document.getElementById("etc3").value)
		etc = etc1 + etc2 + etc3
		
		document.getElementById("etc_price").innerText = etc
		document.getElementById("tot_price").innerText = main_price + add_total + etc
	}

</script>
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
					<select onchange="suk_cal()" id="suk_day">
					<c:forEach var="i" begin="1" end="8">
						<option value="${i}">${i}박</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>
					성인<select onchange="suk_cal()" id="people1">
						<c:forEach var="i" begin="0" end="${hdto.max_in}">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
					어린이<select onchange="suk_cal()" id="people2">
						<c:forEach var="i" begin="0" end="${hdto.max_in-1}">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
					유아<select onchange="suk_cal()" id="people3">
						<c:forEach var="i" begin="0" end="${hdto.max_in-1}">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">숙박비용 : <span id="main_price">${hdto.price}</span>원</td>
			</tr>
			
	        <tr>
           		<td colspan="2" align="center"><h3>옵션사항</h3></td>
            </tr>
			<tr>
				<td>성인조식(추가 25,000원)</td>
				<td>
	            	<select onchange="etc_cal()" id="etc1">
			            <option value="0">0개</option>
			            <option value="1">1개</option>
			            <option value="2">2개</option>
			            <option value="3">3개</option>
            		</select>
				</td>
			</tr>
			<tr>
				<td>엑스트라 베드(추가 10,000원)</td>
				<td>
	            	<select onchange="etc_cal()" id="etc2">
			            <option value="0">0개</option>
			            <option value="1">1개</option>
			            <option value="2">2개</option>
			            <option value="3">3개</option>
            		</select>
				</td>
			</tr>
			<tr>
				<td>어린이 조식(추가 12,000원)</td>
				<td>
	            	<select onchange="etc_cal()" id="etc3">
			            <option value="0">0개</option>
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