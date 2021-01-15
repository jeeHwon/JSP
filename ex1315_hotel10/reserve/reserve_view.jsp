<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="hotel.HotelDAO" %>
<%@page import="hotel.ReserveDTO" %>
<%
	String userid = request.getParameter("userid");
	HotelDAO hdao = new HotelDAO();
	ReserveDTO rdto = hdao.get_reserve(userid);
	pageContext.setAttribute("rdto",rdto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">예약번호</th>
      <th scope="col">예약자명</th>
      <th scope="col">전화번호</th>
      <th scope="col">체크인</th>
      <th scope="col">체크아웃</th>
      <th scope="col">성인</th>
      <th scope="col">어린이</th>
      <th scope="col">유아</th>
      <th scope="col">성인조식</th>
      <th scope="col">엑스트라 베드</th>
      <th scope="col">어린이 조식</th>
      <th scope="col">숙박비용</th>
      <th scope="col">옵션비용</th>
      <th scope="col">요금합계</th>
      <th scope="col">예약일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>${rdto.name}</td>
      <td>${rdto.phone}</td>
      <td>${rdto.inday}</td>
      <td>${rdto.outday}</td>
      <td>${rdto.inwon1}</td>
      <td>${rdto.inwon2}</td>
      <td>${rdto.inwon3}</td>
      <td>${rdto.opt1}</td>
      <td>${rdto.opt2}</td>
      <td>${rdto.opt3}</td>
      <td>${rdto.suk_price}</td>
      <td>${rdto.etc_price}</td>
      <td>${rdto.tot_price}</td>
      <td>${rdto.writeday}</td>
    </tr>

  </tbody>
</table>
</body>
</html>