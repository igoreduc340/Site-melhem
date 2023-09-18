const btnComprar = document.getElementById('btn-comprar')
const btnAlugar = document.getElementById('btn-alugar')

function selecionaralugar() {
    btnAlugar.classList.add('btn-selected')
    btnComprar.classList.remove('btn-selected')
}

function selecionarcomprar() {
    btnComprar.classList.add('btn-selected')
    btnAlugar.classList.remove('btn-selected')
}