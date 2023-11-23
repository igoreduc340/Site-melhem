// Dados das propriedades (substitua com seus próprios dados)
const propriedades = [
    {
        imagem: "../images/Casa1.jpg",
        tipoImovel: "Apartamento",
        tipoNegocio: "Aluga",
        bairro: "Vila Sabrina",
        cidade: "São Paulo, zona norte",
        metrosQuadrados: "50 m²",
        quartos: "2 quartos",
        aluguel: "R$3.000"
    },
    {
        imagem: "../images/Casa2.jpg",
        tipoImovel: "Casa",
        tipoNegocio: "Vende",
        bairro: "Centro",
        cidade: "Rio de Janeiro, zona sul",
        metrosQuadrados: "120 m²",
        quartos: "3 quartos",
        aluguel: "R$5.500"
    },
    {
        imagem: "../images/casa2.jpg",
        tipoImovel: "Apartamento",
        tipoNegocio: "Aluga",
        bairro: "Barra da Tijuca",
        cidade: "Rio de Janeiro, zona oeste",
        metrosQuadrados: "80 m²",
        quartos: "1 quarto",
        aluguel: "R$2.800"
    },
    {
        imagem: "../images/Casa1.jpg",
        tipoImovel: "Casa",
        tipoNegocio: "Vende",
        bairro: "Moema",
        cidade: "São Paulo, zona sul",
        metrosQuadrados: "180 m²",
        quartos: "4 quartos",
        aluguel: "R$6.200"
    },
    {
        imagem: "../images/casa1.jpg",
        tipoImovel: "Apartamento",
        tipoNegocio: "Aluga",
        bairro: "Pinheiros",
        cidade: "São Paulo, zona oeste",
        metrosQuadrados: "70 m²",
        quartos: "2 quartos",
        aluguel: "R$3.500"
    },
    {
        imagem: "https://images.adsttc.com/media/images/61dc/5f09/23d7/e874/57cb/4aca/slideshow/07-luisa-lage.jpg?1641832207",
        tipoImovel: "Sobrado",
        tipoNegocio: "Aluga",
        bairro: "Vila Medeiros",
        cidade: "São Paulo, zona norte",
        metrosQuadrados: "85 m²",
        quartos: "3 quartos",
        aluguel: "R$4.500"
    },
    {
        imagem: "https://images.adsttc.com/media/images/61dc/5f26/23d7/e874/57cb/4acb/slideshow/08-edierk-casusa.jpg?1641832237",
        tipoImovel: "Casa",
        tipoNegocio: "Aluga",
        bairro: "Jardim Japão",
        cidade: "São Paulo, zona norte",
        metrosQuadrados: "50 m²",
        quartos: "1 quarto",
        aluguel: "R$1.500"
    },
    
];
// Função para criar os cards e adicionar ao DOM
function criarCards() {
    const container = document.getElementById("conteiner-destaques");

    propriedades.forEach(propriedade => {
        const card = document.createElement("div");
        card.classList.add("property");

        const cardContent = `
            <a href="">
                <img src="${propriedade.imagem}" alt="Casa à Venda">
                <div class="descricao">
                    <div class="line-1">
                        <span class="type-imovel">${propriedade.tipoImovel}</span>
                        <span class="type-negocio">${propriedade.tipoNegocio}</span>
                    </div>
                    <h3 class="bairro">${propriedade.bairro}</h3>
                    <span class="cidade">${propriedade.cidade}</span>
                    <div class="caracteristicas">
                        <span><i class="ph ph-ruler"></i>${propriedade.metrosQuadrados}</span>
                        <span><i class="ph ph-bed"></i>${propriedade.quartos}</span>
                    </div>
                    <span class="aluguel-de">Aluguel:</span>
                    <span class="price">${propriedade.aluguel}</span>
                </div>
            </a>
        `;

        card.innerHTML = cardContent;
        container.appendChild(card);
    });
}

// Chamar a função para criar os cards quando a página carregar
window.onload = function() {
    criarCards();
};
