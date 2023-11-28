<%@page language="java" import="java.sql.*" %>

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

    String sql = "SELECT * FROM clientes WHERE email=? AND senha=?" ;

    //Cria o statement para executar o comando no banco
    PreparedStatement stm = conexao.prepareStatement(sql) ;

    stm.setString( 1 , vlogin ) ;
    stm.setString( 2 , vsenha ) ;

    ResultSet  dados = stm.executeQuery() ;

    if ( dados.next()) {
        //cria a session chamada usuario
        session.setAttribute("usuario" , dados.getString("nome") ) ;
        out.println("<script>");
            out.println("   window.location.href = '../index.jsp';");
        out.println("</script>");
    }else{
        out.println("<script>");
            out.println(" alert('Email ou senha incorretos, tente novamente.');");
            out.println("   window.location.href = '../pages/login.jsp';");
        out.println("</script>");
    }
%>