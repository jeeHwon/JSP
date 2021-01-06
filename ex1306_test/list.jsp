<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BoardDao bdao = new BoardDao();
	ArrayList<BoardDto> list = bdao.list();
	pageContext.setAttribute("list", list);
	
	int index;
	int pager;
	if(request.getParameter("pager")==null){
		pager = 1;
	} else{
		pager = Integer.parseInt(request.getParameter("pager"));
	}
	
	index = (pager-1) * 10;
	ArrayList<BoardDto> indexList = bdao.getIndex(index);
	pageContext.setAttribute("indexList", indexList);
	
	int total_cnt = bdao.getCnt();
	int page_cnt = (int)Math.ceil(total_cnt*0.1);
	int pstart =(int)Math.ceil(pager*0.1)*10-9;
	int pend =(int)Math.ceil(pager*0.1)*10;
	if(page_cnt < pend){
		pend = page_cnt;
	}
	
	pageContext.setAttribute("index", index);
	pageContext.setAttribute("pager", pager);
	pageContext.setAttribute("total_cnt", total_cnt);
	pageContext.setAttribute("page_cnt", page_cnt);
	pageContext.setAttribute("pstart", pstart);
	pageContext.setAttribute("pend", pend);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	<c:forEach items="${indexList}" var="bdto">
	<tr>
		<td>${bdto.name}</td>
		<td><a href="readnum.jsp?id=${bdto.id}">${bdto.title}</a></td>
		<td>${bdto.readnum}</td>
		<td>${bdto.writeday}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center">
			<c:if test="${pstart!=1}">
				<a href="list.jsp?pager=${pager-1}">☜</a>
			</c:if>
			<c:if test="${pstart==1}">
				☜
			</c:if>
			
			<c:if test="${pager!=1}">
				<a href="list.jsp?pager=${pager-1}">◀</a>
			</c:if>
			<c:if test="${pager==1}">
				◀
			</c:if>
			
			<c:forEach var="i" begin="${pstart}" end="${pend}">
		         <c:set var="str" value=""/>   
		            <c:if test="${pager==i}">
		               <c:set var="str" value="\"style='color:red;'\""/>
		            </c:if>
		         <a href="list.jsp?pager=${i} ${str}" >${i }</a>&nbsp;   
		    </c:forEach>
		    
   			<c:if test="${pager!=page_cnt}">
				<a href="list.jsp?pager=${pager+1}">▶</a>
			</c:if>
			<c:if test="${pager==page_cnt}">
				▶
			</c:if>
			
			<c:if test="${pend!=page_cnt}">
				<a href="list.jsp?pager=${pend+1}">☞</a>
			</c:if>
			<c:if test="${pend==page_cnt}">
				☞
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><a href="write.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>