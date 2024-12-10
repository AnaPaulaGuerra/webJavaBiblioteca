<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de livros</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Listagem de livros</h1>
	<table class="reservas">
		<tr>
			<th>ID livro</th>
			<th>Título</th>
			<th>Autor</th>
			<th>Género</th>
			<th>Editora</th>
			<th>Preço</th>
			<th></th>
		</tr>
		<%
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();	
				
			String query = "SELECT livros.id_livro, livros.titulo, autores.nome AS autor, " +
					   "generos.genero AS genero, editoras.editora AS editora, " +
					   "FORMAT(livros.preco, 2) AS preco_euros " +
					   "FROM livros " +
					   "JOIN autores ON livros.id_autor = autores.id_autor " +
					   "JOIN generos ON livros.id_genero = generos.id_genero " +
					   "JOIN editoras ON livros.id_editora = editoras.id_editora " +
					   "ORDER BY livros.id_livro";

			ResultSet rs = st.executeQuery(query);
	
			// Geração dinâmica do HTML
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("id_livro") + "</td>");
				out.println("<td>" + rs.getString("titulo") + "</td>");
				out.println("<td>" + rs.getString("autor") + "</td>");
				out.println("<td>" + rs.getString("genero") + "</td>");
				out.println("<td>" + rs.getString("editora") + "</td>");
				out.println("<td>€" + rs.getString("preco_euros") + "</td>");
				out.println("<td><a href='eliminar_livro.jsp?eliminar="+
						rs.getString(1)+"'><input type='button' value='Eliminar'></a></td>");
				out.println("</tr>");
			}
	
			// Fechar recursos
			rs.close();
			st.close();
			cn.close();
		%>
	</table>
	<!-- Comentários se necessário -->
</body>
</html>