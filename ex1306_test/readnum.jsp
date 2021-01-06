<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%@ page import="java.sql.*" %>
<%
	BoardDao bdao = new BoardDao();

	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	
	bdao.readnum(id);
	
	response.sendRedirect("content.jsp?id="+id);
%>