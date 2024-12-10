<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Género</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>e file="menu.jsp" %>
	<h1>Eliminar Género</h1>
	<%
		String fgenero=request.getParameter("eliminar");
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		try {
			st.executeUpdate("delete from generos where id_genero='"+fgenero+"'");
			out.println("<h1>Género Eliminado</h1>");
		}
		catch (SQLException e){
			out.println("<h1>Erro ao eliminar género - existem registos relacionados em livros</h1>");
		}
	%>
	<br>
	<a href="listagem_generos.jsp">
		<input type="button" value="Listagem géneros">
	</a>
</body>
</html>