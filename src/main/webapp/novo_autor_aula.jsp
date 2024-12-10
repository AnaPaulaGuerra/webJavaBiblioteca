<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo autor</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<div align="center">
		<h1>Novo autor</h1>
		<form method="post" action="novo_autor_aula.jsp">
			<div id="aviso"></div>	
			
				<label>Nome do autor</label><br>
				<input type="text" required name="txt_autor" placeholder="Digite o nome do autor"><br>			
			
				<label>Nacionalidade</label><br>
				<select name="txt_nacionalidade" required>
					<%
						Connection cn1=ligacaomysql.criarligacao();
						Statement st1=cn1.createStatement();
						ResultSet rs1=st1.executeQuery("select * from nacionalidades");
						while(rs1.next()){
							out.println("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");
						}	
					%>
				</select>
				<br>
				<label>Foto do autor</label><br>
				<input type="text" required name="txt_foto" value=noimage.jpg readonly>				
				
				<br><br>
				<input type="submit" value="Guardar">
				<input type="reset" value="Cancelar">
		</form>
		
		<%
			
			String fautor=request.getParameter("txt_autor");
			String fnac=request.getParameter("txt_nacionalidade");
			String ffoto=request.getParameter("txt_foto");
			if(fautor!=null){
				Connection cn=ligacaomysql.criarligacao();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from autores where nome=?");
				ps.setString(1, fautor); //este 1, diz respeito o 1º parâmetro do autor=?
				rs=ps.executeQuery();
				if (rs.next()){ //se já existe um registo com aquela informação, é porque já existe
					%>
					<script>
						document.getElementById('aviso').innerHTML="<h1>Nome do autor já existe</h1>";			
					</script>
					<%
				}else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into autores (nome, id_nacionalidade, foto)"+
					"values  ('"+fautor+"', '"+fnac+"', '"+ffoto+"')");
					
					%>
					<script>
					document.getElementById('aviso').innerHTML="<h1>Autor registado</h1>";			
					</script>
					<%
					cn.close();
				}
			}
			%>
					
		</div>
</body>
</html>