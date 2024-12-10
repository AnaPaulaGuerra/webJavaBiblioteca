<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Autor</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar Autor</h1>
	<%
		String fautor=request.getParameter("eliminar");
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		try {
			st.executeUpdate("delete from autores where id_autor='"+fautor+"'");
			out.println("<h1>Autor Eliminado</h1>");
		}
		catch (SQLException e){
			out.println("<h1>Erro ao eliminar autor - existem registos relacionados em livros</h1>");
		}
	%>
	<br>
	
	<a href="listagem_autores.jsp">
		<input type="button" value="Listagem autores">
	</a>
</body>
</html>