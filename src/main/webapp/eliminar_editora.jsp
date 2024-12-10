<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Editora</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar Editora</h1>
	<%
		String feditora=request.getParameter("eliminar");
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		try {
			st.executeUpdate("delete from editoras where id_editora='"+feditora+"'");
			out.println("<h1>Editora Eliminada</h1>");
		}
		catch (SQLException e){
			out.println("<h1>Erro ao eliminar editora - existem registos relacionados em livros</h1>");
		}
	%>
	<br>
	
	<a href="listagem_editoras.jsp">
		<input type="button" value="Listagem editoras">
	</a>
</body>
</html>