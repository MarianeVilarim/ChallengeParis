//
//  Relatos.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import Foundation
struct Relatos: Codable {
    var tituloRelato: String!
    var Autor: String!
    var idadeAutor: String!
    var curtidas: Int!
    var relatoTexto: String!
    var categoria: String!
    var preco: String!
    var codigo: String!
    var local: String!
    var salvo: Bool!
    
    

}

class RelatosManager: NSObject {
//    var relatos = [Relatos]();
    var relatos = [
        ChallengeParis.Relatos(tituloRelato: "Eu + Você no Quintal das Rachas", Autor: "Carlos Eduardo", idadeAutor: "21 anos", curtidas: 0, relatoTexto: "Por mais que adore comemorar meus aniversários, muitas vezes acho estressante reunir tribos diferentes de amigos e propôr uma interação forçada. Por isso de um tempo pra cá, tenho pensado em celebrar em eventos (smp pensando em algo mais acessível tbm né) para convidar a galera e curtirmos juntos. Assim foi meu niver de 2022, meu primeiro niver presencial desde 2020, lá no Quintal das Rachas em Olinda. Meus amigos tocaram como DJs lá, e a festa tinha convidados e clientes do bar todos misturados na pista de dança, mas mesmo assim me sentia especial de reunir todo mundo que eu amo ali, vivendo sua liberdade em todos os sentidos e realmente aproveitando a festa com os drinks que quisessem, o espaço que quisessem, a companhia que quisessem, e o tempo também. Eu amei.", categoria: "Bar", preco: "$", codigo: "1111", local: "Quintal das Rachas", salvo: false),
        
        ChallengeParis.Relatos(tituloRelato: "Festa tropical no capibar", Autor: "Alana Ramos", idadeAutor: "21 anos", curtidas: 0, relatoTexto: "Foi um rolê exclusivo, fechou o capibar, mas como o espaço é grande, deu muita gente de muitos grupos diferentes. O maior custo foi do aluguel do lugar, que os convidados ainda pagaram 7 reais (ou 2 pacotes de alimento) pela entrada como contribuição a ong, os alimentos, algumas garrafas de bebidas que foram soltas no meio da festa e o dj. Momento em que começou o dj (foi breve, por 2 horinhas) que animou muito, compraram algumas garrafas de bebidas que foram compartilhadas e animaram e teve muita dança, conversas na pista e etc. No geral, os convidados estavam por contra própria dos gastos, era um espaço grande que deu pra juntar muitos grupos e foi um rolê com abertura pra ser bem insalubre. Foi ótimo.", categoria: "Bar", preco: "$", codigo: "1112",local: "Capibar", salvo: true),
        
        ChallengeParis.Relatos(tituloRelato: "Festa tropical no capibar", Autor: "Alana Ramos", idadeAutor: "21 anos", curtidas: 0, relatoTexto: "Foi um rolê exclusivo, fechou o capibar, mas como o espaço é grande, deu muita gente de muitos grupos diferentes. O maior custo foi do aluguel do lugar, que os convidados ainda pagaram 7 reais (ou 2 pacotes de alimento) pela entrada como contribuição a ong, os alimentos, algumas garrafas de bebidas que foram soltas no meio da festa e o dj. Momento em que começou o dj (foi breve, por 2 horinhas) que animou muito, compraram algumas garrafas de bebidas que foram compartilhadas e animaram e teve muita dança, conversas na pista e etc. No geral, os convidados estavam por contra própria dos gastos, era um espaço grande que deu pra juntar muitos grupos e foi um rolê com abertura pra ser bem insalubre. Foi ótimo.", categoria: "Restaurante", preco: "$", codigo: "1113",local: "Capibar", salvo: false),
        
        
        ChallengeParis.Relatos(tituloRelato: "Role por JSP", Autor: "Thales", idadeAutor: "23 anos", curtidas: 0, relatoTexto: "Foi um rolê exclusivo, fechou o capibar, mas como o espaço é grande, deu muita gente de muitos grupos diferentes. O maior custo foi do aluguel do lugar, que os convidados ainda pagaram 7 reais (ou 2 pacotes de alimento) pela entrada como contribuição a ong, os alimentos, algumas garrafas de bebidas que foram soltas no meio da festa e o dj. Momento em que começou o dj (foi breve, por 2 horinhas) que animou muito, compraram algumas garrafas de bebidas que foram compartilhadas e animaram e teve muita dança, conversas na pista e etc. No geral, os convidados estavam por contra própria dos gastos, era um espaço grande que deu pra juntar muitos grupos e foi um rolê com abertura pra ser bem insalubre. Foi ótimo.", categoria: "Restaurante", preco: "$$", codigo: "1114", local: "Sushi em Jardim São Paulo", salvo: true),
        
        ChallengeParis.Relatos(tituloRelato: "Festa no Quintal", Autor: "Rivaldo", idadeAutor: "14 anos", curtidas: 0, relatoTexto: "Foi uma festa comum, dia inteiro, com almoço e janta. Fiz para comemorar a minha vida, numa casa com piscina. Os melhores momentos foram, com certeza, reunir o povo e fazer alguns jogos aquáticos na piscina. Minha mãe pagou tudo!", categoria: "Casa", preco: "$", codigo: "1115", local: "Quintal de casa", salvo: true),
        
        ChallengeParis.Relatos(tituloRelato: "Vem mi vê", Autor: "Maria Vitória", idadeAutor: "19 anos", curtidas: 0, relatoTexto: "Chegamos lá umas 18:30 para pegar lugar, e quando o povo foi chegando pedimos a primeira torre, pode escolher se quer ela fraca ou forte, (obviamente escolhemos a forte né), e começamos a beber (foram umas 15 pessoas +/-. Pedimos alguns petiscos, são gostosos mas não são tão baratos, vale mais a pena ir no dia que tem self service de caldinho. Demos sorte de ir no dia que não teve musica ao vivo (porque quando tem não tem como conversar de tanto barulho), e como a torre veio BEM FORTE, obrigado Sarah (a pituzeira do grupo), logo logo começamos a ficar bem bebinhos alegres, pedimos mais torres, começamos a virar os copos e ficar mais bebos, alguns foram assistir Formula 1, outros inventaram de sair pra compra AXÉ pra misturar... O jovem também merece a ressaca as vezes né? Enfim, ficamos triloucsasos, e depois voltamos todos pra casa andando pelas ruas de Olinda cantando High School Musical, foi incrível. Eu paguei metade e os convidados, o resto. ", categoria: "Bar", preco: "$$", codigo: "1116", local: "Ladeiras de Olinda", salvo: true),
        
        ChallengeParis.Relatos(tituloRelato: "Adrenalina no mirabilândia", Autor: "Giselly Marques", idadeAutor: "20 anos", curtidas: 0, relatoTexto: "Foi há 6 anos atrás então o meu relato não vai ser 100% fiel) Então, dia do meu aniversário e eu não sou muito de organizar antecipadamente um GRANDE encontro. Foi chegando o dia e estava sem ideia pra rolê, acho que o dia exato caiu num domingo e boa parte dos meus amigos tinham que trabalhar/estudar muito cedo no dia seguinte. Então surgiu a ideia de ir pro mirabilândia, um local que há muito tempo não ia e que tenho memória afetiva. Comemorei com a minha família numa churrascaria durante o almoço e logo após fui com o meu irmão e mais 3 amigos para o mirabilândia. Pode até ser um local bobo inicialmente, mas casou de ser numa fase da minha vida de descobrimentos (kkk) e compartilhar esse momento de diversão pós chapação parecia ser uma boa ideia... e foi! A melhor parte foi A adrenalina dos brinquedos misturada com substâncias ainda ilícitas (infelizmente). Trago pra vida toda os amigos que compartilharam esse momento comigo e acredito que seja um momento massa pra ser compartilhado posteriormente. <3", categoria: "Parque", preco: "$$", codigo: "1117", local: "Mirabilândia", salvo: false),
        
        ChallengeParis.Relatos(tituloRelato: "Jogo de cartas diferente", Autor: "Joana Alves", idadeAutor: "19 anos", curtidas: 0, relatoTexto: "Meu aniversário de 19 anos também foi minha despedida porque ia entrar na faculdade e tive que me mudar. Fiz uma festa em casa com os amigos mais próximos e passamos a noite jogando um jogo de cartas chamado Círculo da morte. Como é um jogo de bebida, na metade da primeira rodada já tava todo mundo muito bêbado. Foi uma festa muito massa porque foi animada, mesmo tendo poucas pessoas.", categoria: "Casa", preco: "$$$", codigo: "1118", local: "Casa", salvo: false),
        
        
    ]
    
    func addRelato(relato: Relatos) {
        relatos.append(relato)
    }
    
    func retornaRelatos() -> [Relatos]{
        let relato = self.relatos
        return relato
    }
}
