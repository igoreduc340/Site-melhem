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

// Colocando todos o campos de input em suas repectivas váriaveis
const nameInput = document.getElementById("name");
const emailInput = document.getElementById("email");
const cpfInput = document.getElementById("cpf");
const telInput = document.getElementById("telefone");
const senhaInput = document.getElementById("Senha");
const confSenhainput = document.getElementById("confirmar_senha");

// Quando o campo input e desselecionado, aciona sua respectiva função de validação 
nameInput.addEventListener('blur', validar_nome);
emailInput.addEventListener('blur', validar_email);
cpfInput.addEventListener('blur', validar_cpf);
telInput.addEventListener('blur', validar_telefone);
senhaInput.addEventListener('blur', validarSenha);
confSenhainput.addEventListener('blur', senhas_iguais);

// Função que será chamada para validar o nome da pessoa , deve ter entre 3 caracteres e 50 caracteres.

function validar_nome() {
    var nome = nameInput.value;
    nome = nome.trim();
    var textInvalid = document.getElementById("invalidName");

    if (nome.length >= 3 && nome.length <= 50) {
        nameInput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return true;
    } else {
        nameInput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = 'Nome inválido'
        nameInput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
}

// Função que será chamada para validar o email da pessoa , contem um expressão regular que valida os endereços de email.

function validar_email() {
    var email = emailInput.value;
    email = email.trim();
    var textInvalid = document.getElementById("invalidEmail");

    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (regex.test(email)) {
        emailInput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return true;
    } else {
        emailInput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = 'Email inválido'
        emailInput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
}
// Função que será chamada para validar o cpf da pessoa , aceita apenas 11 caracteres do tipo numerico.
function validar_cpf() {
    var cpf = cpfInput.value;
    cpf = cpf.replace(/\D/g, ''); // Remove caracteres não numéricos
    var textInvalid = document.getElementById("invalidCPF");

    if (cpf.length === 11) {
        cpfInput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return true;
    } else {
        cpfInput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = 'CPF inválido'
        cpfInput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
}
// Função que será chamada para validar o telefone da pessoa , aceita apenas 11 caracteres do tipo numerico.

function validar_telefone() {
    var telefone = telInput.value;
    telefone = telefone.replace(/\D/g, ''); // Remove caracteres não numéricos
    var textInvalid = document.getElementById("invalidTel");

    if (telefone.length === 11) {
        telInput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return true;

    } else {
        telInput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = 'Telefone inválido'
        telInput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
}
// Função que será chamada para validar a senha da pessoa .
function validarSenha() {
    var senha = senhaInput.value;
    var cont = 0
    var textInvalid = document.getElementById("invalidPassword");
    var mensagem = "";

    // Pelo menos 8 caracteres
    if (senha.length < 8) {
        
        mensagem += '-Senha precisa ter pelo menos 8 caracteres\n'
        cont += 1;
    }
  
    // Pelo menos uma letra maiúscula
    if (!/[A-Z]/.test(senha)) {
        
        mensagem += '-Senha precisa ter pelo menos 1 letra maiúscula\n'
        cont += 1;
    }
  
    // Pelo menos uma letra minúscula
    if (!/[a-z]/.test(senha)) {
        
        mensagem += '-Senha precisa ter pelo menos 1 letra minúscula\n'
        cont += 1;
    }
  
    // Pelo menos um número
    if (!/\d/.test(senha)) {
        
        mensagem += '-Senha precisa ter pelo menos 1 número\n'
        cont += 1;
    }
  
    // Pelo menos um caractere especial
    if (!/[^a-zA-Z0-9]/.test(senha)) {
        
        mensagem += '-Senha precisa ter pelo menos 1 caractere especial\n'
        cont += 1;
    }
    // Concatena as mensagens de erro usando um contador como referencia.
    if (cont !== 0){
        senhaInput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = mensagem;
        senhaInput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
    else{
        senhaInput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return senhas_iguais();
    }
    
    // A senha é válida , ultima verificação chamando uma função.
}

// Função que será chamada para verificar a igualdade entre as senhas , e confirmar se o segundo campo esta vazio.
function senhas_iguais()  {
    var confirmar_senha = confSenhainput.value.trim();
    var senha = document.getElementById("Senha").value.trim();
    var textInvalid = document.getElementById("invalidPasswordConfirm");

    if (senha !== confirmar_senha){
        confSenhainput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = "As senhas fornecidas não coincidem. Por favor, certifique-se de digitar a mesma senha nos dois campos de senha."
        confSenhainput.scrollIntoView({ behavior: 'smooth' });
        return false;
    }
    if (senha == ''){
        confSenhainput.style.borderColor = "#B02121" // Muda a cor da borda do input para vermelho
        textInvalid.innerText = "Digite uma senha"
        confSenhainput.scrollIntoView({ behavior: 'smooth' });
    }
    else{
        confSenhainput.style.borderColor = "#008000" // Muda a cor da borda do input para verde
        textInvalid.innerText = ''
        return true;
    }
}

// Colocar os botões de mostrar/ocultar as senhas em váriaves
const btnChangeSenha = document.getElementById("changeSenha");
const btnChangeSenhaConfir = document.getElementById("changeSenhaConfir");

// Funções que ocultam ou mostram a senha nos inputs
btnChangeSenha.addEventListener('click', function() {
    // Alterna entre mostrar e esconder a senha quando o botão é clicado
    if (senhaInput.type === 'password') {
        senhaInput.type = 'text'
        btnChangeSenha.innerHTML = '<i class="ph ph-eye-closed"></i>Ocultar Senha'
    } else {
        senhaInput.type = 'password'
        btnChangeSenha.innerHTML = '<i class="ph ph-eye"></i>Mostrar Senha'
    }
});
btnChangeSenhaConfir.addEventListener('click', function() {
    // Alterna entre mostrar e esconder a senha quando o botão é clicado
    if (confSenhainput.type === 'password') {
        confSenhainput.type = 'text'
        btnChangeSenhaConfir.innerHTML = '<i class="ph ph-eye-closed"></i>Ocultar Senha'
    } else {
        confSenhainput.type = 'password'
        btnChangeSenhaConfir.innerHTML = '<i class="ph ph-eye"></i>Mostrar Senha'
    }
});

// Função que será chamada para formatar o cpf da pessoa.
function formatarCPF(inputElement) {
    inputElement.addEventListener("input", function() {
        let input = inputElement.value.replace(/\D/g, ""); // Remove caracteres não numéricos
        let formattedInput = '';
        
        if (input.length > 0){
            formattedInput = input.substring(0, 3);

            if (input.length > 3){
                formattedInput += '.' + input.substring(3, 6);

                if (input.length > 6){
                    formattedInput += '.' + input.substring(6, 9);

                    if (input.length >= 9){
                        formattedInput += '-' + input.substring(9, 11);
                    }
                }
            }
        }

        inputElement.value = formattedInput;
    });
}

// Função que será chamada para formatar o telefone da pessoa.
function formatarTelefone(inputElement) {
    inputElement.addEventListener("input", function() {
        let input = inputElement.value.replace(/\D/g, ''); // Remove caracteres não numéricos
        let formattedInput = '';

        if (input.length > 0) {
            formattedInput = '(' + input;

            if (input.length > 2) {
                formattedInput = '(' + input.substring(0, 2) + ')';

                if (input.length > 7) {
                    formattedInput += ' ' + input.substring(2, 7);

                    if (input.length >= 11) {
                        formattedInput += '-' + input.substring(7, 11);
                    } else {
                        formattedInput += '-' + input.substring(7);
                    }
                } else {
                    formattedInput += ' ' + input.substring(2);
                }
            }
        }

        inputElement.value = formattedInput;
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
formatarCPF(cpfInput);
formatarTelefone(telInput);
formatarNome(nameInput);

const botaoRegistro = document.getElementById("btn-register");

botaoRegistro.onclick = comecarRegistro