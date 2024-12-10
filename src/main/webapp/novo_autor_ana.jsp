<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Novo Autor</title>
    <link rel="icon" href="imagens/favicon.png">
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
    <div align="center">
        <h1>Novo Autor</h1>
        <form method="post" action="novo_autor_ana.jsp">
            <div id="aviso"></div> <!-- Mostrar mensagens ao utilizador -->

            <label>Nome do Autor</label><br>
            <input type="text" required name="txt_nome" placeholder="Digite o nome do autor">
            <br><br>

            <label>Nacionalidade</label><br>
            <select name="txt_id_nacionalidade" required>
                <option value="" disabled selected>Selecione uma nacionalidade</option>
                <%
                    try {
                        Connection cn = ligacaomysql.criarligacao();
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("SELECT id_nacionalidade, nacionalidade FROM nacionalidades");
                        while (rs.next()) {
                            int id = rs.getInt("id_nacionalidade");
                            String nacionalidade = rs.getString("nacionalidade");
                %>
                            <option value="<%= id %>"><%= nacionalidade %></option>
                <%
                        }
                        cn.close();
                    } catch (SQLException e) {
                %>
                        <script>
                            document.getElementById('aviso').innerHTML = "<h1>Erro ao carregar as nacionalidades: <%= e.getMessage() %></h1>";
                        </script>
                <%
                    }
                %>
            </select>
            <br><br>

            <label>Foto</label><br>
            <input type="text" required name="txt_foto" placeholder="Digite o nome do arquivo da foto">
            <br><br>

            <input type="submit" value="Guardar">
            <input type="reset" value="Cancelar">
        </form>

        <%
            String nome = request.getParameter("txt_nome");
            String idNacionalidade = request.getParameter("txt_id_nacionalidade");
            String foto = request.getParameter("txt_foto");

            if (nome != null && idNacionalidade != null && foto != null) {
                try {
                    Connection cn = ligacaomysql.criarligacao();
                    PreparedStatement ps = cn.prepareStatement("SELECT * FROM autores WHERE nome = ?");
                    ps.setString(1, nome);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) { // Verifica se o autor já existe
        %>
                        <script>
                            document.getElementById('aviso').innerHTML = "<h1>Autor já existe!</h1>";
                        </script>
        <%
                    } else {
                        PreparedStatement psInsert = cn.prepareStatement(
                                "INSERT INTO autores (nome, id_nacionalidade, foto) VALUES (?, ?, ?)");
                        psInsert.setString(1, nome);
                        psInsert.setInt(2, Integer.parseInt(idNacionalidade));
                        psInsert.setString(3, foto);

                        int rowsInserted = psInsert.executeUpdate();
                        if (rowsInserted > 0) {
        %>
                            <script>
                                document.getElementById('aviso').innerHTML = "<h1>Autor inserido com sucesso!</h1>";
                            </script>
        <%
                        }
                        psInsert.close();
                    }
                    rs.close();
                    ps.close();
                    cn.close();
                } catch (SQLException e) {
        %>
                    <script>
                        document.getElementById('aviso').innerHTML = "<h1>Erro ao inserir o autor: <%= e.getMessage() %></h1>";
                    </script>
        <%
                }
            }
        %>
    </div>
</body>
</html>