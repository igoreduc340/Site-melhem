<%@page language="java" import="java.sql.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%
    //Variaveis que armazena informações digitadas pelo usuário
    String vlogin = request.getParameter("email") ;
    String vsenha = request.getParameter("senha") ;

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

    String sql = "SELECT * FROM imoveis WHERE tipo_transacao=? " ;

    //Cria o statement para executar o comando no banco
    PreparedStatement stm = conexao.prepareStatement(sql) ;

    stm.setString( 1 , "Aluguel" ) ;

    ResultSet  dados = stm.executeQuery() ;
%> 

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Melhem Imóveis</title>

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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- links para os CSS -->
    <link rel="stylesheet" href="../styles/page_alugar_comprar.css">
</head>

<body>

    <div id="header">

        <a href="../index.jsp" id="logo">
            <img src="../images/Logo-completo.png" alt="logo melhem">
        </a>

        <div id='busca'>
            <form action="/search" class="search" method="get">
                <input id="txtbusca" name="q" type="text" value="" placeholder="Digite uma rua,bairro,cidade..." />
                <input id="btnBusca" type="submit" value="Pesquisar" />
            </form>
        </div>

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

        <div id="menu-dropdown-login">
            <a href="login.jsp"  class="btn_login">
                <span><i class="ph ph-user-circle"></i>Login</span> 
            </a>
            <ul id="submenu-login">
                <li id="btn-entrar"><a href="login.jsp">Entre</a></li>
                <span>Ou</span>
                <li id="btn-cadastre"><a href="register.html">Cadastre-se</a></li>
            </ul>
        </div>
    </div>

    <div id="Bloco_de_filtros">

        <p><a href="../index.jsp">Inicio </a> &gt; Casas e apartamentos para alugar em São Paulo,SP</p><br>
        <p>
        <h3>15 casas e apartamentos encontrados em São Paulo</h3>
        </p>
        <!-- Botão com menu suspenso -->
        <div class="botoes">
            <button class="botao">Filtrar</button>
            <button class="botao">Farejar Imovel</button>
            <button class="botao1">Mais Relevantes</button>
        </div>

    </div>

    <div id="conteiner-destaques">
        <div id="conteiner">

            <% while(dados.next()) { %> <%-- Abre o loop do WHILE do Jsp --%>

                <%-- Cria o card do imovel de acordo com o banco de dados --%>
                <div class="property">
                    <a href="">
                        <img src="<% out.print(dados.getString("imagem")); %>" alt="Casa à Venda">
                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel"> <% out.print(dados.getString("tipo_imovel")); %> </span>
                                <span class="type-negocio"> <% out.print(dados.getString("tipo_transacao")); %> </span>
                            </div>
                            <h3 class="bairro"> <% out.print(dados.getString("bairro")); %> </h3>
                            <span class="cidade"> <% out.print(dados.getString("cidade") + ", " + dados.getString("zona")); %> </span>
                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i> <% out.print(dados.getString("area_metros_quadrados")); %> </span>
                                <span><i class="ph ph-bed"></i> <% out.print(dados.getString("numero_quartos")); %> </span>
                            </div>
                            <span class="aluguel-de"></span>
                            <span class="price">R$ <% out.print(dados.getString("valor")); %> </span>
                        </div>
                    </a>
                </div>

            <% } %> <%-- Fecha o loop do WHILE do JSP --%>

        </div>

        <div id="mapa">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d227327.2151965974!2d-46.77571638439045!3d-23
        .60186190300946!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce448183a461d1%3A0x9ba94b08ff335bae!2sS%C3%A3o%20
        Paulo%2C%20State%20of%20S%C3%A3o%20Paulo!5e0!3m2!1sen!2sbr!4v1695058908447!5m2!1sen!2sbr" width="700"
                height="650" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

    </div>

    <div class="botoes">
        <button class="botao-ver-mais">Ver mais</button>
    </div>

    <footer class="footer">
        <div class="footer-section" id="logo_footer">
            <img src="../images/Logo-removebg-branco.png" alt="Melhem Imóveis">
        </div>

        <div class="footer-section" id="sobre_melhem">
            <h3>Melhem</h3>
            <span>Sobre nós</span>
            <span>Histórias de sucesso</span>
            <span>Contato</span>
        </div>

        <div class="footer-section" id="localizacao">
            <h3>Localização</h3>
            <span>Rua Togo, 713</span>
            <span>São Paulo - Zona Norte</span>
        </div>

        <div class="footer-section" id="contatos">
            <h3>Contatos</h3>
            <div class="contact-item">
                <h4>Telefone</h4>
                <span>(11) 2949-0666</span>
            </div>
            <div class="contact-item">
                <h4>WhatsApp</h4>
                <span>(11) 92912-6378</span>
            </div>
            <div class="contact-item">
                <h4>Email</h4>
                <span>contato@melhem.com.br</span>
            </div>
        </div>

        <div class="footer-section" id="segue_gente">
            <h3>Segue a Gente</h3>
            <img src="../images/icones-redes-sociais.png" alt="Redes Sociais">
        </div>
    </footer>

    <script src="https://unpkg.com/@phosphor-icons/web"></script>

</body>

</html>