<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jspPJ.dto.MemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%
    String[] name={"홍길동","배트맨","슈퍼맨","뽀로로","원더우먼"};
    String[] juso={"서울","인천","대구","광주","부산"};
    int[] age={50,60,35,27,45};
    
    ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
    for (int i=0; i<name.length; i++){
    	MemberDTO mdto = new MemberDTO();
    	mdto.setName(name[i]);
    	mdto.setJuso(juso[i]);
    	mdto.setAge(age[i]);
    	list.add(mdto);
    }
    
    pageContext.setAttribute("list", list);
   
 %>
</head>
<body>
    <table width="300" align="center">
      <tr>
        <td> 이름 </td>
        <td> 나이 </td>
        <td> 주소 </td>
      </tr>
      <c:forEach var="mdto" items="${list}">
	      <tr>
	      	<td>${mdto.name}</td>
	      	<td>${mdto.age}</td>
	      	<td>${mdto.juso}</td>
	      </tr>
      </c:forEach>
    </table>
</body>
</html>