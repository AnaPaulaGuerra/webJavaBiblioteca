<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo Género</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<div align ="center">
	<h1>Novo Género</h1>
	<form method="post" action="novo_genero.jsp"> 
	
		<div id="aviso"></div> 				<!--mostrar mensagens ao utilizador-->
		<label>Género</label><br>
		<input type="text" required name="txt_genero" placeholder="Digite o novo género">
		<br><br>
		<input type="submit" value="Guardar">
		<input type="reset" value="Cancelar">
	</form>
	<%
		Connection cn=ligacaomysql.criarligacao();
		Statement st=cn.createStatement();
		String fgenero=request.getParameter("txt_genero");
		
		if(fgenero !=null){			
			try{
				st.executeUpdate("insert into generos(genero) values ('"+fgenero+"')");
				%>
				<script>
				document.getElementById('aviso').innerHTML="<h1>Género inserido</h1>";
				</script>
				<%			
			}
			catch (SQLException e){
				%>
				<script>
				document.getElementById('aviso').innerHTML="<h1>Erro ao inserir o género</h1>";
				</script>
				<%					
			}
		}
	%>
	</div>
</body>

</html>