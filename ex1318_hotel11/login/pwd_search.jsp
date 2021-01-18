<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
#section{width:1100px; height:500px ;margin:auto; text-align:center;}
#form_box{width:400px; height:300px; margin:auto; margin-top:100px;}
#form_box input{width:300px; height:40px; border:1px solid #5D9CEC; margin-top:20px;}
#form_box input[type=submit]{width:305px; height:40px;color:white; background:#5D9CEC;}
#form_box #etc{margin-top:20px;}
</style>
<%
	String chk =request.getParameter("chk");
	pageContext.setAttribute("chk", chk);
%>
<div id="section">
<div id="form_box">
	<form method="post" action="pwd_search_ok.jsp">
		<div id="userid"><input type="text" name="userid" placeholder="아이디" autocomplete="off"></div>
		<div id="name"><input type="text" name="name" placeholder="이름" autocomplete="off"></div>
		<div id="phone"><input type="text" name="phone" placeholder="전화번호"></div>
			<c:if test="${chk==1}">
			<br><span style="color:red;font-size:12px">정보가 틀립니다</span>
			</c:if>
		<div id="submit"><input type="submit" value="비밀번호 찾기"></div>

	</form>
</div>
</div>

<%@ include file="../bottom.jsp" %> 