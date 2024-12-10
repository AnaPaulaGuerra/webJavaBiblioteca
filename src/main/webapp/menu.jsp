<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Clínica</title>
	<style>
		.botaomenu{
			background-color: green;
			color: white;
			padding: 15px;
			font-size: 15px;
			border: none;
		    cursor: pointer;
		}
		
		.escolha{
			position: relative;
			display: inline-block;
		}
	
	    .escolha-conteudo{
	    	display: none;
	    	position: absolute;
	    	background-color: #f9f9f9;
	    	min-width: 170px;
	    	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    	z-index: 1;
	    }
	    
	    .escolha-conteudo a{
	    	color: black;
	    	padding: 12px;
	    	text-decoration: none;
	    	display: block;
	    }	    
	    
	    .escolha-conteudo a:hover{
	    	background-color: #f1f1f1;
	    }
	    
	    .escolha:hover .escolha-conteudo{
	    	display:block;
	    }
	    
	    .escolha:hover .botaomenu{
	    	background-color: #3e8e41;
	    }
	</style>
</head>
<body>
	<div style="width:100%;background-color:green">
	
		<div class="escolha">
			<button class="botaomenu">Autores</button>
			<div class="escolha-conteudo">
				<a href="novo_autor_aula.jsp">Novo</a>
				<a href="listagem_autores.jsp">Lista</a>
			</div>
		</div>

		<div class="escolha">
			<button class="botaomenu">Editoras</button>
			<div class="escolha-conteudo">
				<a href="nova_editora.jsp">Nova</a>
				<a href="listagem_editoras.jsp">Lista</a>
			</div>
		</div>
			
		<div class="escolha">
			<button class="botaomenu">Géneros</button>
			<div class="escolha-conteudo">
				<a href="novo_genero.jsp">Novo</a>
				<a href="listagem_generos.jsp">Lista</a>
			</div>
		</div>
		
		<div class="escolha">
			<button class="botaomenu">Livros</button>
			<div class="escolha-conteudo">
				<a href="novo_livro.jsp">Novo</a>
				<a href="listagem_livros.jsp">Lista</a>
			</div>
		</div>
		
		<div class="escolha">
			<button class="botaomenu">Nacionalidades</button>
			<div class="escolha-conteudo">
				<a href="nova_nacionalidade.jsp">Nova</a>
				<a href="listagem_nacionalidade.jsp">Lista</a>
			</div>
		</div>
		
	</div>
</body>
</html>