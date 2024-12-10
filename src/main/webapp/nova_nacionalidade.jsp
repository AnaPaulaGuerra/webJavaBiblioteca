<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nova nacionalidade</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<div align="center">
		<h1>Nova nacionalidade</h1>
		<form method="post" action="nova_nacionalidade.jsp">
			<div id="aviso"></div>	
				<label>Nacionalidade</label><br>
				<input type="text" required name="txt_nacionalidade" placeholder="Digite a nova nacionalidade">
				<br><br>
				<input type="submit" value="Guardar">
				<input type="reset" value="Cancelar">
		</form>
		
		<%
			
			String fnacionalidade=request.getParameter("txt_nacionalidade");
			if(fnacionalidade!=null){
				Connection cn=ligacaomysql.criarligacao();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from nacionalidades where nacionalidade=?");
				ps.setString(1, fnacionalidade); //este 1, diz respeito o 1º parâmetro editora=?
				rs=ps.executeQuery();
				if (rs.next()){ //se já existe um registo com aquela informação, é porque já existe
					%>
					<script>
						document.getElementById('aviso').innerHTML="<h1>Nacionalidade já existe</h1>";			
					</script>
					<%
				}else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into nacionalidades (nacionalidade) values ('"+fnacionalidade+"')");
					
					%>
					<script>
					document.getElementById('aviso').innerHTML="<h1>Nacionalidade registada</h1>";			
					</script>
					<%
					cn.close();
				}
			}
			%>
					
		</div>
</body>
</html>