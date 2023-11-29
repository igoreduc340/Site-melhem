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
        <link rel="stylesheet" href="../styles/greetings_use.css">

        <!-- scroll reveal -->
        <script src="https://unpkg.com/scrollreveal"></script>
     
    </head>
<body>

    <header>
        
        <div id="logo">
            <img src="../images/Logo-removebg-vermelhopcima.png" alt="logo melhem">
            <h1>MELHEM</h1>
            <h2>IMÓVEIS</h2>
        <div>

    </header>
    
    <div id="cabecalho">
        <h1>Parabêns
        <% out.print(session.getAttribute("usuario")); %>
        , seu cadastro foi realizado</h1>
    </div>

    <main>
        
        <div id="conteinerMain">
            <p>Agora que já está cadastrado, podemos fazer fazer o login</p>
            <a href="login.jsp" class="button">Fazer login</a>
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
    
</body>
</html>