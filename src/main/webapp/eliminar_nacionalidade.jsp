<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Nacionalidade</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar Nacionalidade</h1>
	<%
		String fnacionalidade=request.getParameter("eliminar");
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		try {
			st.executeUpdate("delete from nacionalidades where id_nacionalidade='"+fnacionalidade+"'");
			out.println("<h1>Nacionalidade Eliminada</h1>");
		}
		catch (SQLException e){
			out.println("<h1>Erro ao eliminar nacionalidade - existem registos relacionados em autores</h1>");
		}
	%>
	<br>
	
	<a href="listagem_nacionalidade.jsp">
		<input type="button" value="Listagem nacionalidades">
	</a>
</body>
</html>