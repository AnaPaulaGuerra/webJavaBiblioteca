<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de autores</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Listagem de autores</h1>
	<table class="reservas">
		<tr>
			<th>ID Autor</th>
			<th>Autor</th>
			<th>Nacionalidade</th>
			<th>Foto</th>
			<th></th>
		</tr>
		<%
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			// Consulta SQL com INNER JOIN para obter o nome da nacionalidade
            String query = 
            "SELECT autores.id_autor, autores.nome, nacionalidades.nacionalidade, autores.foto " +
                           "FROM autores " +
                           "INNER JOIN nacionalidades " +
                           "ON autores.id_nacionalidade = nacionalidades.id_nacionalidade " +
                           "ORDER BY autores.id_autor";
			
            ResultSet rs = st.executeQuery(query);
			//código aula
			//String sql="Select id_autor, nome, nacionalidade, foto From autores "+
			//"inner join nacionalides on "+
			//"autores.id_nacionalidade=nacionalidades.id_mnacionalidade order by id_autor"
			//ResultSet rs = st.executeQuery(sql);
			
            // Gera dinâmicamente as linhas da tabela
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString("id_autor") + "</td>");
                out.println("<td>" + rs.getString("nome") + "</td>");
                out.println("<td>" + rs.getString("nacionalidade") + "</td>");
                out.println("<td><img src='imagens/" + rs.getString("foto") + "' alt='Foto' style='width:50px;height:50px;'></td>");
                out.println("<td><a href='eliminar_autor.jsp?eliminar="+
        				rs.getString(1)+"'><input type='button' value='eliminar'></a></td></tr>");
            }
         // Fecho de conexão
            rs.close();
            st.close();
            cn.close();
		%>
	</table>
	<!-- Comentários se necessário -->
</body>
</html>