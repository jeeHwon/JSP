<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%@ page import="java.sql.*" %>
<%
	BoardDao bdao = new BoardDao();

	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	BoardDto bdto = new BoardDto();
	bdto.setTitle(title);
	bdto.setName(name);
	bdto.setContent(content);
	bdto.setPwd(pwd);
	
	bdao.insert(bdto);
	
	response.sendRedirect("list.jsp");
%>