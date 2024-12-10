<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de nacionalidades</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Listagem de nacionalidades</h1>
	<table class="reservas">
		<tr>
			<th>ID Nacionalidade</th>
			<th>Nacionalidade</th>
			<th></th>
		</tr>
		<%
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery("select * from nacionalidades order by id_nacionalidade");
			while (rs.next()) {
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td><a href='eliminar_nacionalidade.jsp?eliminar="+
						rs.getString(1)+"'><input type='button' value='Eliminar'></a></td></tr>");
			}
		
		%>
	</table>
	<!-- Comentários se necessário -->
</body>
</html>