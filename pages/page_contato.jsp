<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastre-se | Melhem</title>
    
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
        <link rel="stylesheet" href="../styles/page_contato.css">
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
                    <li><a href="page_comprar.html">Comprar Imóveis</a></li>
                    <li><a href="page_alugar.html">Alugar Imóveis</a></li>
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
                    out.print("<li id='btn-cadastre'><a href='pages/register.html'>Cadastre-se</a></li>");
                out.print("</ul>");

            out.print("</div>");

        } else {
                out.print("<div id='menu-dropdown-login'>");
                    out.print("<span><i class='ph ph-user-circle'></i>");
                        out.print(session.getAttribute("usuario"));
                    out.print("</span>");
                         
                    out.print("<ul id='submenu-login'>");
                        out.print("<li id='btn-entrar'><a href='pages/meu_perfil.jsp'>Meu perfil</a></li>");
                        out.print("<span>Ou</span>");
                        out.print("<li id='btn-cadastre'><a href='server/logout.jsp'>Sair</a></li>");
                    out.print("</ul>");
                out.print("</div>");          
        }
        %>
         
    </div>

    <main>
        <div id="conteiner-contato">
            <h1>Contato</h1>
            <p>Insira sua informações, e entraremos em contato com você!</p>
            <form action="contato">
                <label for="primeiro-nome">Primeiro Nome</label>
                <input type="text" id="primeiro-nome" placeholder="Digite seu nome">
                <label for="sobrenome">Sobrenome</label>
                <input type="text" id="sobrenome" placeholder="Digite seu sobrenome">
                <label for="email">E-mail</label>
                <input type="email" id="email" placeholder="email@exemplo.com">
                <label for="phone">Celular</label>
                <input type="number" id="phone" placeholder="(__)_ ____-____">
                <label for="comments">Comentários</label>
                <textarea name="comments" id="comments" cols="30" rows="10" maxlength="500"></textarea>
                <input type="submit" value="Enviar" id="btn-contato">
            </form>
        </div>
    </main>

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
    <script src="../js/script.js"></script>
</body>
</html>