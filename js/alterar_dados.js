// Função que será chamada quando o botão "Começar!" for clicado

function comecarRegistro() {
    console.log(cpfInput.value)
    
    var nome = validar_nome();
    var email = validar_email();
    var cpf = validar_cpf();
    var telefone = validar_telefone();

    // Verifica se deu tudo certo , esse bloco de if só vai ser executado caso nome,email,cpf ,telefone e senha retornem true
    if (nome && email && cpf && telefone && enableButton) {
        document.formRegister.submit()
       }
}

// Colocando todos o campos de input em suas repectivas váriaveis
const nameInput = document.getElementById("name");
const emailInput = document.getElementById("email");
const cpfInput = document.getElementById("cpf");
const telInput = document.getElementById("telefone");

// Quando o campo input e desselecionado, aciona sua respectiva função de validação 
nameInput.addEventListener('blur', validar_nome);
emailInput.addEventListener('blur', validar_email);
cpfInput.addEventListener('blur', validar_cpf);
telInput.addEventListener('blur', validar_telefone);

// Toda vez que tiver alguma alteração no valor dos inputs, chamará a função que irá habilitar o botão
nameInput.addEventListener('input', enableSaveButton);
emailInput.addEventListener('input', enableSaveButton);
cpfInput.addEventListener('input', enableSaveButton);
telInput.addEventListener('input', enableSaveButton);

// Função que habilita o botão de salvar alterações.
let enableButton = false
function enableSaveButton() {
    // Habilita o botão de salvar quando houver mudanças nos campos de entrada
    document.getElementById('salvarButton').classList.remove('desactivate');
    document.getElementById('salvarButton').classList.add('btn-register');
    enableButton = true
}

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

// Função que será chamada para formatar o cpf da pessoa.
function formatarCPF(inputElement) {
    // Formata o campo quando a pagina e carregada.
    let value = inputElement.value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4");
    inputElement.value = value; 

    // Função que e chamada, toda vez que acontece uma alteração no input
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
        // let cpfNumerico = parseInt(inputElement.value.replace(/\D+/g, ''));
        // return cpfInput.value = cpfNumerico
    });
}

// Função que será chamada para formatar o telefone da pessoa.
function formatarTelefone(inputElement) {
    // Formata o campo quando a pagina e carregada.
    let value = inputElement.value.replace(/(\d{2})(\d{5})(\d{4})/, "($1) $2-$3"); // Insere parênteses e traço
    inputElement.value = value;

    // Função que e chamada, toda vez que acontece uma alteração no input
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
        // let telNumerico = parseInt(inputElement.value.replace(/\D+/g, ''));
        // return telInput.value = telNumerico
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

const botaoRegistro = document.getElementById("salvarButton");

botaoRegistro.onclick = comecarRegistro