<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Livro</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar Livro</h1>
	<%
		String flivro=request.getParameter("eliminar");
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		try {
			st.executeUpdate("delete from livros where id_livro='"+flivro+"'");
			out.println("<h1>Livro Eliminado</h1>");
		}
		catch (SQLException e){
			out.println("<h1>Erro ao eliminar livro</h1>");
		}
	%>
	<br>
	
	<a href="listagem_livros.jsp">
		<input type="button" value="Listagem livros">
	</a>
</body>
</html>