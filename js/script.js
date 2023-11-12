const btnComprar = document.getElementById('btn-comprar')
const btnAlugar = document.getElementById('btn-alugar')
const selectedValor = document.getElementById('selectedValor')

const option1 = document.getElementById('option1')
const option2 = document.getElementById('option2')
const option3 = document.getElementById('option3')
const option4 = document.getElementById('option4')
const option5 = document.getElementById('option5')

function selecionaralugar() {
    btnAlugar.classList.add('btn-selected')
    btnComprar.classList.remove('btn-selected')
    selectedValor.innerText = 'Aluguel até'

    option1.innerHTML = 'R$ 1.000,00'
    option2.innerHTML = 'R$ 2.000,00'
    option3.innerHTML = 'R$ 3.000,00'
    option4.innerHTML = 'R$ 4.000,00'
    option5.innerHTML = 'R$ 5.000,00'
}

function selecionarcomprar() {
    btnComprar.classList.add('btn-selected')
    btnAlugar.classList.remove('btn-selected')
    selectedValor.innerText = 'Valor até'

    option1.innerHTML = 'R$ 300.000,00'
    option2.innerHTML = 'R$ 600.000,00'
    option3.innerHTML = 'R$ 900.000,00'
    option4.innerHTML = 'R$ 1.500.000,00'
    option5.innerHTML = 'R$ 2.000.000,00'
}