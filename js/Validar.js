// Função que será chamada quando o botão "Começar!" for clicado

function comecarRegistro() {
    
    var nome = validar_nome();
    var email = validar_email();
    var cpf = validar_cpf();
    var telefone = validar_telefone();
    var senha = validarSenha();


    // Verifica se deu tudo certo , esse bloco de if só vai ser executado caso nome,email,cpf ,telefone e senha retornem true

    if (nome && email && cpf && telefone && senha) {
        alert("Deu tudo certo,podemos colocar no banco de dados. :)");
       }
}

// Função que será chamada para validar o nome da pessoa , deve ter entre 3 caracteres e 50 caracteres.

function validar_nome() {
    var nome = document.getElementById("name").value;
    nome = nome.trim();
    var textInvalid = document.getElementById("invalidName");

    if (nome.length >= 3 && nome.length <= 50) {
        textInvalid.innerText = ''
        return true;
    } else {
        textInvalid.innerText = 'Nome inválido'
        return false;
    }
}

// Função que será chamada para validar o email da pessoa , contem um expressão regular que valida os endereços de email.

function validar_email() {
    var email = document.getElementById("email").value;
    email = email.trim();
    var textInvalid = document.getElementById("invalidEmail");

    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (regex.test(email)) {
        textInvalid.innerText = ''
        return true;
    } else {
        textInvalid.innerText = 'Email inválido'
        return false;
    }
}
// Função que será chamada para validar o cpf da pessoa , aceita apenas 11 caracteres do tipo numerico.
function validar_cpf() {

    var cpf = document.getElementById("cpf").value;
    cpf = cpf.replace(/\D/g, ''); // Remove caracteres não numéricos
    var textInvalid = document.getElementById("invalidCPF");

    if (cpf.length === 11) {
        textInvalid.innerText = ''
        return true;
    } else {
        textInvalid.innerText = 'CPF inválido'
        return false;
    }
}
// Função que será chamada para validar o telefone da pessoa , aceita apenas 11 caracteres do tipo numerico.

function validar_telefone() {

    var telefone = document.getElementById("telefone").value;
    telefone = telefone.replace(/\D/g, ''); // Remove caracteres não numéricos
    var textInvalid = document.getElementById("invalidTel");

    if (telefone.length === 11) {
        textInvalid.innerText = ''
        return true;

    } else {
        textInvalid.innerText = 'Telefone inválido'
        return false;
    }
}
// Função que será chamada para validar a senha da pessoa .
function validarSenha() {

    var senha = document.getElementById("Senha").value;
    var cont = 0
    var textInvalid = document.getElementById("invalidPassword");
    var mensagem = "";

    // Pelo menos 8 caracteres
    if (senha.length < 8) {
        
        mensagem += 'Senha precisa ter pelo menos 8 caracteres\n'
        cont += 1;
    }
  
    // Pelo menos uma letra maiúscula
    if (!/[A-Z]/.test(senha)) {
        
        mensagem += 'Senha precisa ter pelo menos 1 letra maiúscula\n'
        cont += 1;
    }
  
    // Pelo menos uma letra minúscula
    if (!/[a-z]/.test(senha)) {
        
        mensagem += 'Senha precisa ter pelo menos 1 letra minúscula\n'
        cont += 1;
    }
  
    // Pelo menos um número
    if (!/\d/.test(senha)) {
        
        mensagem += 'Senha precisa ter pelo menos 1 número\n'
        cont += 1;
    }
  
    // Pelo menos um caractere especial
    if (!/[^a-zA-Z0-9]/.test(senha)) {
        
        mensagem += 'Senha precisa ter pelo menos 1 caractere especial\n'
        cont += 1;
    }
    // Concatena as mensagens de erro usando um contador como referencia.
    if (cont !== 0){
        
        textInvalid.innerText = mensagem;
        return false;
    }
    else{
        textInvalid.innerText = ''
        return senhas_iguais();
    }
    
    // A senha é válida , ultima verificação chamando uma função.
}

// Função que será chamada para verificar a igualdade entre as senhas , e confirmar se o segundo campo esta vazio.
function senhas_iguais()  {

    var confirmar_senha = document.getElementById("confirmar_senha").value.trim();
    var senha = document.getElementById("Senha").value.trim();
    var textInvalid = document.getElementById("invalidPasswordConfirm");

    if (senha !== confirmar_senha){
        
        textInvalid.innerText = "As senhas fornecidas não coincidem. Por favor, certifique-se de digitar a mesma senha nos dois campos de senha."
        
        return false;
    }
    else{
        textInvalid.innerText = ''
        return true;
    }
}

// Função que será chamada para formatar o cpf da pessoa.
function formatarCPF(inputElement) {
    inputElement.addEventListener("input", function() {
        let value = inputElement.value.replace(/\D/g, ""); // Remove caracteres não numéricos
        value = value.slice(0, 11); // Limita a 11 dígitos
        value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4"); // Insere traços
        inputElement.value = value;
    });
}

// Função que será chamada para formatar o telefone da pessoa.
function formatarTelefone(inputElement) {
  inputElement.addEventListener("input", function() {
    let value = inputElement.value.replace(/\D/g, ""); // Remove caracteres não numéricos
    value = value.slice(0, 11); // Limita a 11 dígitos
    value = value.replace(/(\d{2})(\d{5})(\d{4})/, "($1) $2-$3"); // Insere parênteses e traço
    inputElement.value = value;
  });
}

// Função que será chamada para formatar o telefone da pessoa.
function formatarNome(inputElement) {
    inputElement.addEventListener("input", function() {
    let value = inputElement.value.replace(/\d/g, ""); // Remove caracteres numéricos
    inputElement.value = value;
    });
  }




// Execução do codigo 


const cpfInput = document.getElementById("cpf");
const numInput = document.getElementById("telefone");
const nomeInput = document.getElementById("name");

formatarCPF(cpfInput);
formatarTelefone(numInput);
formatarNome(nomeInput);

const botaoRegistro = document.getElementById("btn-register");

botaoRegistro.onclick = comecarRegistro;
