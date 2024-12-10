<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nova editora</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<div align="center">
		<h1>Nova editora</h1>
		<form method="post" action="nova_editora.jsp">
			<div id="aviso"></div>	
				<label>Editora</label><br>
				<input type="text" required name="txt_editora" placeholder="Digite a nova editora">
				<br><br>
				<input type="submit" value="Guardar">
				<input type="reset" value="Cancelar">
		</form>
		
		<%
			
			String feditora=request.getParameter("txt_editora");
			if(feditora!=null){
				Connection cn=ligacaomysql.criarligacao();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from editoras where editora=?");
				ps.setString(1, feditora); //este 1, diz respeito o 1º parâmetro editora=?
				rs=ps.executeQuery();
				if (rs.next()){ //se já existe um registo com aquela informação, é porque já existe
					%>
					<script>
						document.getElementById('aviso').innerHTML="<h1>Editora já existe</h1>";			
					</script>
					<%
				}else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into editoras (editora) values ('"+feditora+"')");
					
					%>
					<script>
					document.getElementById('aviso').innerHTML="<h1>Editora registada</h1>";			
					</script>
					<%
					cn.close();
				}
			}
			%>
					
		</div>
</body>
</html>