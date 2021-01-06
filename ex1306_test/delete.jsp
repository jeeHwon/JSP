<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	BoardDao bdao = new BoardDao();
   	BoardDto chkBdto = bdao.content(id);
   	
	if(pwd.equals(chkBdto.getPwd())) {
		BoardDto bdto = new BoardDto();
		
		bdao.delete(id);
		
		response.sendRedirect("list.jsp");
		
	} else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	
	
%>