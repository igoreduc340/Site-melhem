<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações digitadas pelo usuário
    String nome = request.getParameter("name");
    String email = request.getParameter("email");

    String cpfString = request.getParameter("cpf").trim();  // Obtenha o CPF como uma string
    cpfString = cpfString.replaceAll("\\D", "");  // Remova os caracteres não numéricos do CPF
    long cpf = Long.parseLong(cpfString);  // Converta o CPF para um número inteiro

    String telString = request.getParameter("telefone").trim();  // Obtenha o telefone como uma string
    telString = telString.replaceAll("\\D", "");  // Remova os caracteres não numéricos do telefone
    long telefone = Long.parseLong(telString);  // Converta o telefone para um número inteiro

    String senha = request.getParameter("Senha");

    //Variaveis do banco de dados
    String banco = "melhem";
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario = "root";
    String password = "";

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar drive na memoria
    Class.forName(driver);

    //Cria a variavel conexão com o banco de dados
    Connection conexao;

    //Abrir com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, password);

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO clientes (nome, email, cpf, telefone, senha) values (?,?,?,?,?)" ;

    // Prepara o comando Sql    
    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , nome) ;
    stm.setString( 2 , email ) ;
    stm.setLong(3, cpf);
    stm.setLong(4, telefone);
    stm.setString( 5 , senha ) ;

    stm.execute() ;
    stm.close() ;

    out.println("<script>");
    out.println("   window.location.href = '../pages/greetings_user.html';");
    out.println("</script>");
%>