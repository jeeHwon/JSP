<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pension.dao.Dao" %>   
<%@page import="pension.dto.RoomDto" %>   
<%
    String y=request.getParameter("y");
    String m=request.getParameter("m");
    String d=request.getParameter("day");
    String id=request.getParameter("id"); // room테이블의 id 

    String sday=y+"-"+m+"-"+d;
    
    pageContext.setAttribute("sday", sday);
    
    // 사용자가 선택한 방의 정보를 읽어오기
    Dao dao=new Dao();
    RoomDto rdto=dao.select_room(id);
    pageContext.setAttribute("rdto", rdto);
%>    
<!DOCTYPE html>
<html>
<head>  <!-- reserve_next.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   /* function change_price(my)  
   {
	   // 숙박일수에 따른 숙박비용을 계산
	   var suk=${rdto.price}*parseInt(my);
	   // 숙박비용을 브라우저에 출력
	   document.getElementById("suk_price").innerText=suk;
   }
   
   function inwon_check()
   {
	   // 3분류의 인원값을 가져오기
	   var inwon1=parseInt(document.getElementById("inwon1").value);
	   var inwon2=parseInt(document.getElementById("inwon2").value);
	   var inwon3=parseInt(document.getElementById("inwon3").value);
	   var inwon=inwon1+inwon2+inwon3; // 합계 인원
	   // 최대인원을 초과여부
	   if(${rdto.max} < inwon)  // 방의 최대인원(max필드)   select태그 3개의 value값의 합
	   {
	      // 인원을 초기화	
	      document.getElementById("inwon1").selectedIndex=0;
	      document.getElementById("inwon2").selectedIndex=0;
	      document.getElementById("inwon3").selectedIndex=0;
	   }
	   else
	   {
		 // inwon(숙박인원) 값이 최소인원보다 작다면
		   // 추가된 인원요금을 숙박비용에 +해서 전달 
		  if(inwon > ${rdto.min} }  
		  {	  
		    var a_price=10000; // 1인당 추가요금
		    var add_inwon=inwon-${rdto.min};  // 1-2 => -1
		    var add_tot=a_price*add_inwon;
		  }
		  else
			var add_tot=0;
		   // 기존 숙박비용 + 추가인원요금(add_tot)
		   var suk=document.getElementById("suk").value;
		   var suk_price=${rdto.price}*suk;     // 순수한 숙박비용 => ${rdto.price}*숙박일수;
		   suk_price=suk_price+add_tot;
		   document.getElementById("suk_price").innerText=suk_price;
	   }	   
   } */
   function suk_cal() // 숙박+인원추가 => 전달
   {
	   // 숙박비용
	   // 숙박일수에 따른 숙박비용을 계산
	   var suk=document.getElementById("suk").value; // 숙박일
	   var suk_price=${rdto.price}*suk; // 숙박비용은 계산
	   //alert(suk_price);
	    
	   // 인원추가요금
	   // 3분류의 인원값을 가져오기
	   var inwon1=parseInt(document.getElementById("inwon1").value);
	   var inwon2=parseInt(document.getElementById("inwon2").value);
	   var inwon3=parseInt(document.getElementById("inwon3").value);
	   var inwon=inwon1+inwon2+inwon3; // 합계 인원
	   // 최대인원을 초과여부
	   if(${rdto.max} < inwon)  // 방의 최대인원(max필드)   select태그 3개의 value값의 합
	   {
	      // 인원을 초기화	
	      document.getElementById("inwon1").selectedIndex=0;
	      document.getElementById("inwon2").selectedIndex=0;
	      document.getElementById("inwon3").selectedIndex=0;
	      document.getElementById("suk_price").innerText=suk_price;
	   }
	   else
	   {
		    // inwon(숙박인원) 값이 최소인원보다 작다면
		   // 추가된 인원요금을 숙박비용에 +해서 전달 
		  if(inwon > ${rdto.min})
		  {	  
		    var a_price=10000; // 1인당 추가요금
		    var add_inwon=inwon-${rdto.min};  // 1-2 => -1
		    var add_tot=(a_price*add_inwon)*suk;
		  }
		  else
			var add_tot=0;
		   // 기존 숙박비용 + 추가인원요금(add_tot)
 
		   document.getElementById("suk_price").innerText=suk_price+add_tot;
	   }	   
	   // 출력위치 = 숙박비용 + 인원추가요금
	   //document.getElementById("suk_price").innerText= ;
   }
 </script>
</head>
<body>
  <form method="post" action="reserve_ok.jsp">
   <table width="500" align="center">
     <tr>
      <td colspan="2" align="center"> <h3>숙박관련</h3> </td>
     </tr>
     <tr>
       <td> 예약할 방 </td>
       <td> ${rdto.name}</td>
     </tr>
     <tr>  <!-- 회원,비회원에 따라 다르게 -->
       <td> 예약자 </td>
       <td> <input type="text" name="name"> </td>
     </tr>
     <tr>  <!-- 회원,비회원에 따라 다르게 -->
       <td> 전화번호 </td>
       <td> <input type="text" name="phone"> </td>
     </tr>
     <tr>
       <td> 입실일 </td>
       <td> ${sday} </td>  
     </tr>
     <tr>
       <td> 숙박예정 </td>
       <td>  
          <select onchange="suk_cal()" id="suk">
          <c:forEach var="i" begin="1" end="8">
           <option value="${i}"> ${i}박 </option>
          </c:forEach>
          </select>
       </td>
     </tr>
     <tr>
       <td> 인원 </td>
       <td>
         성인 
         <select onchange="suk_cal()" id="inwon1"> <!-- end값을 최대인원 기준으로 맞춘다. -->
          <c:forEach var="i" begin="1" end="${rdto.max}"> 
           <option value="${i}"> ${i} </option>
          </c:forEach>
         </select>
         청소년    
         <select onchange="suk_cal()" id="inwon2">
          <c:forEach var="i" begin="0" end="${rdto.max-1}">
           <option value="${i}"> ${i} </option>
          </c:forEach>
         </select>
          유아동    
         <select onchange="suk_cal()" id="inwon3">
          <c:forEach var="i" begin="0" end="${rdto.max-1}">
           <option value="${i}"> ${i} </option>
          </c:forEach>
         </select>
       </td>
     </tr>
     <tr>
       <td colspan="2" align="right"> 숙박비용 : <span id="suk_price">${rdto.price}</span>원 </td>
     </tr>
     
     <tr>
       <td colspan="2" align="center"> <h3>부대시설 관련</h3> </td>
     </tr>
     <tr>
       <td> 바비큐사용(1개당 20,000원) </td>
       <td>
          <select>
            <option value="1"> 1개 </option>
            <option value="2"> 2개 </option>
            <option value="3"> 3개 </option>
          </select>
       </td>
     </tr>
     <tr>
       <td> 삼겹살추가(1kg당 25,000원) </td>
       <td>
          <select>
            <option value="1"> 1kg </option>
            <option value="2"> 2kg </option>
            <option value="3"> 3kg </option>
            <option value="4"> 4kg </option>
          </select>
       </td>
     </tr>
     <tr>
       <td colspan="2" align="right"> 부대비용 : <span id="etc_price"></span>원 </td>
     </tr>
     <tr>
       <td colspan="2" align="right"> 총결제비용 : <span id="tot_price"></span>원 </td>
     </tr>
   </table>
  </form>
</body>
</html>








