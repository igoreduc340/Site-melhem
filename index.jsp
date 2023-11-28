<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Melhem Imóveis</title>

    <!-- icones -->
    <link rel="apple-touch-icon" sizes="180x180" href="icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="icons/favicon-16x16.png">
    <link rel="manifest" href="icons/site.webmanifest">
    <meta name="msapplication-TileColor" content="#ffc40d">
    <meta name="theme-color" content="#ffffff">

    <!-- import das fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- links para os CSS -->
    <link rel="stylesheet" href="styles/base.css">
    <link rel="stylesheet" href="styles/index.css">

    <script src="https://unpkg.com/scrollreveal"></script>
 
</head>
<body>
    
    <div id="header">

        <a href="index.jsp" id="logo">
            <img src="images/Logo-completo.png" alt="logo melhem">
        </a>

        <div class="navegação">
            <div class="menu-dropdown">
                <a href="#">BUSCAR IMÓVEIS</a>
                <ul class="submenu">
                    <li><a href="pages/page_comprar.html">Comprar Imóveis</a></li>
                    <li><a href="pages/page_alugar.html">Alugar Imóveis</a></li>
                </ul>
            </div>
            <a href="pages/page_sobre.jsp">SOBRE</a>
            <a href="pages/page_contato.jsp">CONTATO</a>
        </div>

        <%-- Verifica se existe a session --%>
        <%
        if (session.getAttribute("usuario") == null) {

            out.print("<div id='menu-dropdown-login'>");

                out.print("<a href='pages/login.jsp'  class='btn_login'>");
                    out.print("<span><i class='ph ph-user-circle'></i>Login</span>");
                out.print("</a>");

                out.print("<ul id='submenu-login'>");
                    out.print("<li id='btn-entrar'><a href='pages/login.jsp'>Entre</a></li>");
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

    <div id="main-search">
        <div id="conteiner-search">
            <div id="box-search">
                <h1>
                    ENCONTRE O IMÓVEL<br>
                    CERTO PARA <span class="text_voce">VOCÊ</span><br>
                </h1>

                <button onclick="selecionaralugar()"><span id="btn-alugar" class="btn-selected">Alugar</span></button>
                <button onclick="selecionarcomprar()"><span id="btn-comprar" >Comprar</span></button>

                <div class="linha"></div>

                <form action="search_homes" id="form">
                    <select name="" id="city">
                        <option value="" hidden>Busque por cidade</option>
                        <option value="">São Paulo</option>
                        <option value="">Guarulhos</option>
                        <option value="">Santos</option>
                    </select>

                    <select name="" id="bairro">
                        <option value="" hidden>Busque por bairro</option>
                        <option value="">Vila Maria</option>
                        <option value="">Jardim Japão</option>
                        <option value="">Vila Sabrina</option>
                        <option value="">Vila Medeiros</option>
                        <option value="">Jardim Japão</option>
                    </select>
                    <div id="aluguel-quartos">
                        
                        <select name="" id="aluguel">
                            <option id="selectedValor" value="" hidden>Aluguel até</option>
                            <option id="option1" value="">R$ 1.000,00</option>
                            <option id="option2" value="">R$ 2.000,00</option>
                            <option id="option3" value="">R$ 3.000,00</option>
                            <option id="option4" value="">R$ 4.000,00</option>
                            <option id="option5" value="">R$ 5.000,00</option>
                        </select>

                        <select name="" id="quartos">
                            <option value="" hidden>N° de quartos</option>
                            <option value="">1+</option>
                            <option value="">2+</option>
                            <option value="">3+</option>
                            <option value="">4+</option>
                            <option value="">5+</option>
                        </select>
                    </div>
                    <input value="Buscar Imóveis"   title="Buscar Imóveis" type="submit" id="btn-enviar">
                </form>
            </div>
        </div>    
    </div>

    <main>

        <div id="resumos">
            <div id="card-resumo">
                <h3>Saia do Aluguel</h3>
                <p> Dê o próximo passo em direção à sua casa dos sonhos. Descubra as melhores opções de compra de casas e comece a construir seu futuro hoje mesmo.</p>
                <a href="pages/page_comprar.html"><button>Ver Casas à venda</button></a>
            </div>
            <div id="card-resumo">
                <h3>Aqui Você Acha</h3>
                <p>Procurando uma casa perfeita para alugar? Nós simplificamos sua busca. Explore nossa seleção de propriedades para alugar e encontre o lar ideal para sua família.</p>
                <a href="pages/page_alugar.html"><button>Casas Para Alugar</button></a>
            </div>
            <div id="card-resumo">
                <h3>Agende Sua Visita</h3>
                <p>Quer conhecer pessoalmente as propriedades que mais chamam sua atenção? Agende sua visita agora e dê o primeiro passo para sua nova casa.</p>
                <a href="pages/page_contato.jsp"><button>Agendar Visita</button></a>
            </div>
        </div>

        <div id="quem-somos">
            <h1>Quem Somos</h1>
            <p>Na Melhem Imóveis, estamos comprometidos em tornar seus sonhos de encontrar o lar perfeito uma realidade. Com mais de 50 anos de experiência no mercado imobiliário, somos apaixonados por conectar pessoas com as casas que amam.</p>
            <a href="pages/page_sobre.jsp">Saiba mais...</a>
            <div id="images">
                <img src="images/fotos/photo1.png" alt="">
                <img class="margin" src="images/fotos/photo2.png" alt="">
                <img src="images/fotos/photo3.png" alt="">
                <img class="margin" src="images/fotos/photo4.png" alt="">
            </div>
        </div>

        <div id="experimente">
            <h1>Experimente a Administração de Seu Imóvel Conosco</h1>
            <div class="conteiner-img-r">
                <p>Na Melhem Imóveis, oferecemos uma experiência de administração de imóveis que proporciona tranquilidade e resultados sólidos para proprietários como você. Nossa equipe altamente dedicada e profissional está pronta para cuidar do seu investimento e garantir que ele seja uma fonte de renda confiável</p>
                <img src="images/image-house1-page-home.png" alt="">
            </div>
            <div class="conteiner-img-l">
                <img src="images/image-house3-page-home.png" alt="">
                <p>Descubra como podemos maximizar o potencial de seu investimento e fornecer uma administração livre de preocupações.</p>
            </div>
        </div>

        <div id="imoveis-destaque">
            <h1>Imóveis em Destaque</h1>     
            <div id="conteiner-destaques">

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>
                
                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>
                
                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

                <div class="property">
                    <a href="">
                        <img src="images/Casa1.jpg" alt="Casa à Venda">

                        <div class="descricao">
                            <div class="line-1">
                                <span class="type-imovel">Apartamento</span>
                                <span class="type-negocio">Aluga</span>
                            </div>

                            <h3 class="bairro">Vila Sabrina</h3>
                            <span class="cidade">São Paulo, zona norte</span>

                            <div class="caracteristicas">
                                <span><i class="ph ph-ruler"></i>50 m²</span>
                                <span> <i class="ph ph-bed"></i>2 quartos</span>
                            </div>

                            <span  class="aluguel-de">Aluguel:</span>
                            <span class="price">R$3.000 </span>
                            
                        </div>
                    </a>
                </div>

            </div>
            <div id="navegacao">
                <button class="btn-arrow"><i class="ph ph-arrow-left"></i></button>
                <div id="buttons">
                    <button>1</button>
                    <button><span>2</span></button>
                    <button><span>3</span></button>
                    <button><span>4</span></button>
                </div>
                <button class="btn-arrow"><i class="ph ph-arrow-right"></i></button>
            </div>
                
        </div>
        
    </main>

    <footer class="footer">

          <div id="logo_footer">
            <img src="images/Logo-removebg-branco.png" alt="">
            <span>Melhem Imóveis</span>
          </div>

          <div id="sobre_melhem">
            <h3>Melhem</h3>
            <span>Sobre nós</span>
            <span>Historias de sucesso</span>
            <span>Contato</span>
          </div>

          <a href="https://maps.app.goo.gl/4jBEThBkpfGC4Ghe7" target="_blank">
              <div id="localizacao">
                <h3>localização</h3>
                <span>Rua Togo, 713</span>
                <span>São Paulo - Zona Norte</span>
              </div>
          </a>

          <div id="contatos">
            <h3>Contatos</h3>
            <a href="tel:1129290666">
                <h4>Telefone</h4>
                <span>(11) 2949-0666</span>
            </a>
            <h4>WhatsApp</h4>
            <span>(11) 92912-6378</span>
            <a href="mailto:comercial@melhem.com" >
                <h4>Email</h4>
                <span>contato@melhem.com.br</span>
            </a>
          </div>

          <div id="segue_gente">
            <h3>Segue a Gente</h3>
            <img src="images/icones-redes-sociais.png" alt="">
          </div>

    </footer>

    <script src="js/scroll-reveal.js"></script>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <script src="js/script.js"></script>
</body>
</html>