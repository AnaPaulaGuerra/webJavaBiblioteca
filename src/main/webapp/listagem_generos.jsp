<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de géneros</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Listagem de géneros</h1>
	<table class="reservas">
		<tr>
			<th>ID Género</th>
			<th>Género</th>
			<th></th>
		</tr>
		<%
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery("select * from generos order by id_genero");
			while (rs.next()) {
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td><a href='eliminar_genero.jsp?eliminar="+
					rs.getString(1)+"'><input type='button' value='Eliminar'></a></td></tr>");
			}	
		%>
	</table>
	<!-- Comentários se necessário -->
</body>
</html>