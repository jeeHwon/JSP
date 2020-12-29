<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>떙떙떙 땡땡땡
<%
	pageContext.setAttribute("str", "넌나에게모욕감을줬어");
	pageContext.setAttribute("member", "강백호/채치수/서태웅/정대만/송태섭/권준호");
%>
<hr>
${fn:contains(str,"모욕감")}<p>
${fn:contains(str,"목욕값")}<p>
<hr>
${fn:indexOf(str,"줬")}<p>
<hr>
${fn:length(str)}<p>
<hr>
${fn:split(member, "/")[0]}<p>
${fn:split(member, "/")[1]}<p>
<hr>
<c:set var="mem" value="${fn:split(member, '/')}"/>
${mem[2]}<p>
${mem[3]}<p>
<hr>
${fn:substringBefore(str, "모욕감")}<p>
${fn:substring(str, 4, 7)}<p>
${fn:substringAfter(str, "모욕감")}<p>

</body>
</html>