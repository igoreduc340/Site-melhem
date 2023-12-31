<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

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
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
        <!-- links para os CSS -->
        <link rel="stylesheet" href="../styles/base.css">
        <link rel="stylesheet" href="../styles/page_sobre.css">

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
                    out.print("<li id='btn-cadastre'><a href='pages/register.html'>Cadastre-se</a></li>");
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

    <main>
        <div id="sobre-nos">
            <div class="box-sobre">
                <h1>Sobre Nós</h1>
                <p>
                    Fundada em 1970 no bairro da Vila Sabrina, a Melhem Imóveis tem sido uma figura crucial no desenvolvimento da zona norte da região metropolitana de São Paulo. Durante uma época de pioneirismo, o fundador Dr. Melhem El Hage deixou uma marca duradoura com sua visão, determinação e liderança. <br>
                    Esses princípios iniciais de pioneirismo, seriedade e honestidade permanecem essenciais em nossa cultura de trabalho atual.
                </p>
            </div>
            <div class="box-sobre">
                <h3>A nossa missão</h3>
                <p>
                    Nossa missão é muito mais do que simplesmente negociar imóveis; é sobre criar laços, construir comunidades e fornecer um serviço excepcional a cada cliente que confia em nós. Com uma equipe dedicada a profissionais altamente especializados e uma profunda compreensão do mercado local, estamos aqui para orientá-lo em cada passo do processo.
                </p>
            </div>

            <div class="box-sobre">
                <h3>Visão</h3>
                <p>
                    Na Melhem Imóveis, aspiramos a ser reconhecidos como parceiros confiáveis em transações imobiliárias. Nossa visão envolve excelência, empatia e eficiência em cada interação, criando relacionamentos baseados na confiança mútua. Valorizamos a inovação e a responsabilidade social para moldar um futuro imobiliário mais humano e sustentável.
                </p>
            </div>
            
            <div class="box-sobre">
                <h3>Valores que buscamos</h3>
                <p>
                    Na Melhem Imóveis, valorizamos a transparência, a ética e a excelência em tudo o que fazemos. Acreditamos que cada cliente é único, e é por isso que personalizamos nossos serviços para atender às suas necessidades específicas. Seja qual for o seu objetivo imobiliário, estamos aqui para ajudá-lo a alcançá-lo.
                </p>
            </div>
            
            <div id="img-sobre">
                <img src="../images/Dr. Melhem.png" alt="">
                <span>Dr. Melhem - Fundador da Melhem Imóveis</span>
            </div>
                
        <div id="localizacao-sobre">
            <h2>Localização</h2>
            <div id="mapa">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.7681922568463!2d-46.579401525408095!3d-23.504857559517372!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5f417bcb78a5%3A0xd036458d197f1676!2sR.%20Togo%2C%20713%20-%20Jardim%20Japao%2C%20S%C3%A3o%20Paulo%20-%20SP%2C%2002124-050!5e0!3m2!1spt-BR!2sbr!4v1695177312308!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
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

</body>
</html>    