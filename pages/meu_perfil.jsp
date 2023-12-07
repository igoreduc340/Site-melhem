<%@page language="java" import="java.sql.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%
        //variaveis para o banco de dados
        String banco    = "melhem" ;
        String endereco = "jdbc:mysql://localhost:3306/"+banco;
        String usuario  = "root";
        String senha    = "" ;

        //Variavel para o Driver
        String driver = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com o banco de dados
        Connection conexao ;

        //Abrir a conexao com o banco de dados
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;

        String sql = "SELECT * FROM clientes WHERE nome=?" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        Object usuarioObj = session.getAttribute("usuario");
        String nome = (usuarioObj != null) ? usuarioObj.toString() : null;

        stm.setString( 1 ,  nome) ;
        ResultSet  dados = stm.executeQuery() ;
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Meu perfil | Melhem</title>
    
        <!-- icones -->
        <link rel="apple-touch-icon" sizes="180x180" href="../icons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../icons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../icons/favicon-16x16.png">
        <link rel="manifest" href="../icons/site.webmanifest">
        <meta name="msapplication-TileColor" content="#ffc40d">
        <meta name="theme-color" content="#ffffff">
    
        <!-- import das fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
        <!-- links para os CSS -->
        <link rel="stylesheet" href="../styles/meu_perfil.css">
        <link rel="stylesheet" href="../styles/base.css">

        <!-- scroll reveal -->
        <script src="https://unpkg.com/scrollreveal"></script>
    </head>
<body>

    <div id="header">

        <a href="../index.jsp" id="logo">
            <img src="../images/Logo-completo.png" alt="logo melhem">
        </a>

        <div class="navegação">
            <div class="menu-dropdown">
                <a href="#">BUSCAR IMÓVEIS</a>
                <ul class="submenu">
                    <li><a href="page_comprar.jsp">Comprar Imóveis</a></li>
                    <li><a href="page_alugar.jsp">Alugar Imóveis</a></li>
                </ul>
            </div>
            <a href="page_sobre.jsp">SOBRE</a>
            <a href="page_contato.jsp">CONTATO</a>
        </div>

        <%
        if (session.getAttribute("usuario") == null) {

            out.print("<div id='menu-dropdown-login'>");

                out.print("<a href='login.jsp'  class='btn_login'>");
                    out.print("<span><i class='ph ph-user-circle'></i>Login</span>");
                out.print("</a>");

                out.print("<ul id='submenu-login'>");
                    out.print("<li id='btn-entrar'><a href='login.jsp'>Entre</a></li>");
                    out.print("<span>Ou</span>");
                    out.print("<li id='btn-cadastre'><a href='register.html'>Cadastre-se</a></li>");
                out.print("</ul>");

            out.print("</div>");

        } else {
                out.print("<div id='menu-dropdown-login'>");
                    out.print("<span><i class='ph ph-user-circle'></i>");
                        out.print(session.getAttribute("usuario"));
                    out.print("</span>");
                         
                    out.print("<ul id='submenu-login'>");
                        out.print("<li id='btn-entrar'><a href='meu_perfil.jsp'>Meu perfil</a></li>");
                        out.print("<span>Ou</span>");
                        out.print("<li id='btn-cadastre'><a href='../server/logout.jsp'>Sair</a></li>");
                    out.print("</ul>");
                out.print("</div>");          
        }
        %>
         
    </div>

    <div id="cabecalho">
        <h1>Olá, 
        <%  out.print(session.getAttribute("usuario")); %> <%-- Coloca o nome do usuario na tela --%>
        </h1>
        <span>Consulte seus dados, e se desejar, podem ser alterados.</span>
    </div>

    <div id="conteiner-form">

        <%-- Pega os dados do banco de dados --%>
        <% while(dados.next()) { %>  <%-- Abre o bloco do WHILE --%>

            <form name="formRegister" action="../server/alterar.jsp" method="post">

                <%-- Input do nome --%>
                <label for="name">Nome completo</label>
                <input type="text" id="name" name="name" placeholder="Digite seu nome" value='<% out.print(dados.getString("nome")); %>'> <%-- Pega o nome do usuario no banco de dados --%>
                <span class="invalid" id="invalidName"></span>

                <%-- Input do email --%>
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" placeholder="email@exemplo.com" value='<% out.print(dados.getString("email")); %>'> <%-- Pega o email do usuario no banco de dados --%>
                <span class="invalid" id="invalidEmail"></span>

                <%-- Input do cpf --%>
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" placeholder="___.___.___-__" value='<% out.print(dados.getString("cpf")); %>'> <%-- Pega o cpf do usuario no banco de dados --%>
                <span class="invalid" id="invalidCPF"></span>

                <%-- Input do telefone --%>
                <label for="telefone">Telefone</label>
                <input type="text" id="telefone" name="telefone" placeholder="(__)_ ____-____" value='<% out.print(dados.getString("telefone")); %>'> <%-- Pega o telefone do usuario no banco de dados --%>
                <span class="invalid" id="invalidTel"> </span>

                <%-- Input do botão --%>
                <input type="button" value="Salvar" id="salvarButton" class="desactivate">
            </form>
            
        <%
        } // Fecha o bloco do WHILE
        %>

    </div> <%-- Fecha a DIV do conteiner --%>

    <footer class="footer">

        <div id="logo_footer">
          <img src="../images/Logo-removebg-branco.png" alt="">
          <span>Melhem Imóveis</span>
        </div>

        <div id="sobre_melhem">
          <h3>Melhem</h3>
          <span>Sobre nós</span>
          <span>Historias de sucesso</span>
          <span>Contato</span>
        </div>

        <div id="localizacao">
          <h3>localização</h3>
          <span>Rua Togo, 713</span>
          <span>São Paulo - Zona Norte</span>
        </div>

        <div id="contatos">
          <h3>Contatos</h3>
          <h4>Telefone</h4>
          <span>(11) 2949-0666</span>
          <h4>WhatsApp</h4>
          <span>(11) 92912-6378</span>
          <h4>Email</h4>
          <span>contato@melhem.com.br</span>
        </div>

        <div id="segue_gente">
          <h3>Segue a Gente</h3>
          <img src="../images/icones-redes-sociais.png" alt="">
        </div>

    </footer>

    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <script src="../js/scroll-reveal.js"></script>
    <script src="../js/alterar_dados.js"></script>
</body>
</html>