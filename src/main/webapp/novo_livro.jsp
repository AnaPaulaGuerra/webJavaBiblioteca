<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo livro</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<div align="center">
		<h1>Novo livro</h1>
		<form method="post" action="novo_livro.jsp">
			<div id="aviso"></div>	
			
				<label>Título</label><br>
				<input type="text" required name="txt_titulo" placeholder="Digite o título do livro"><br>			
			
				<label>Autor</label><br>
				<select name="txt_autor" required>
					<%
						Connection cn1=ligacaomysql.criarligacao();
						Statement st1=cn1.createStatement();
						ResultSet rs1=st1.executeQuery("select * from autores");
						while(rs1.next()){
							out.println("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");
						}	
					%>
				</select>
				<br>
				
				<label>Género</label><br>
				<select name="txt_genero" required>
					<%
						Connection cn2=ligacaomysql.criarligacao();
						Statement st2=cn2.createStatement();
						ResultSet rs2=st2.executeQuery("select * from generos");
						while(rs2.next()){
							out.println("<option value="+rs2.getString(1)+">"+rs2.getString(2)+"</option>");
						}	
					%>
				</select>
				<br>
				
				<label>Editora</label><br>
				<select name="txt_editora" required>
					<%
						Connection cn3=ligacaomysql.criarligacao();
						Statement st3=cn3.createStatement();
						ResultSet rs3=st3.executeQuery("select * from editoras");
						while(rs3.next()){
							out.println("<option value="+rs3.getString(1)+">"+rs3.getString(2)+"</option>");
						}	
					%>
				</select>
				<br>
				
				<label>Preço</label><br>
				<input type="text" required name="txt_preco" placeholder="Digite o preço do livro">				
				
				<br><br>
				<input type="submit" value="Guardar">
				<input type="reset" value="Cancelar">
		</form>
		
		<%
			
			String ftitulo=request.getParameter("txt_titulo");
			String fautor=request.getParameter("txt_autor");
			String fgenero=request.getParameter("txt_genero");
			String feditora=request.getParameter("txt_editora");
			String fpreco=request.getParameter("txt_preco");
			if(ftitulo!=null){
				Connection cn=ligacaomysql.criarligacao();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from livros where titulo=?");
				ps.setString(1, ftitulo); //este 1, diz respeito o 1º parâmetro
				rs=ps.executeQuery();
				if (rs.next()){ //se já existe um registo com aquela informação, é porque já existe
					%>
					<script>
						document.getElementById('aviso').innerHTML="<h1>Nome do livro já existe</h1>";			
					</script>
					<%
				}else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into livros (titulo, id_autor, id_genero, id_editora, preco)"+
					"values  ('"+ftitulo+"', '"+fautor+"', '"+fgenero+"', '"+feditora+"', '"+fpreco+"')");
					
					%>
					<script>
					document.getElementById('aviso').innerHTML="<h1>Livro registado</h1>";			
					</script>
					<%
					cn.close();
				}
			}
			%>
					
		</div>
</body>
</html>