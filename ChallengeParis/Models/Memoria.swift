//
//  Memoria.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import Foundation
struct Memoria: Codable {
    var nomePessoa: String!
    var textoMemoria: String!
    var codigo: String!
    var curtidas: Int!
    
}


class MemoriaManager: NSObject {
    var memorias: [Memoria] = [Memoria(nomePessoa: "Maju", textoMemoria: "Foi massa demais! Amei ver os teus primos que não via há anos! Te adoro!", codigo: "1112", curtidas: 0),
                               
                               
                               Memoria(nomePessoa: "Juliana L", textoMemoria: "Amiga, foi muito emocionante ver o show contigo! Nunca vou esquecer. A parte do dominó foi minha favorita! Não sabia que dava pra jogar tão bem estando tão  louca KKK", codigo: "1113", curtidas: 0),
                               
                               Memoria(nomePessoa: "Lucas", textoMemoria: "Eu me acabei de rir quando joão subiu em cima da mesa! Não sei se tu chegasse a ver! Foi engraçado demais! Feliz aniversário!!", codigo: "1112", curtidas: 0),
                               
                               Memoria(nomePessoa: "Antonio", textoMemoria: "Muito boa a ideia de fazer um role cultural no Brennand! Me chama pra próxima", codigo: "1114", curtidas: 0),
                               Memoria(nomePessoa: "Mari", textoMemoria: "As fotos do role ficaram otimaaaaas! :')))", codigo: "1112", curtidas: 0),
                               Memoria(nomePessoa: "Roberta", textoMemoria: "Amei ter conhecido teus amigos do ensino medio!!", codigo: "1112", curtidas: 0),
                               Memoria(nomePessoa: "Jose", textoMemoria: "Teus amigos da faculdade são meio prejudicados ne, mas gostei de todos!!", codigo: "1112", curtidas: 0),
                               Memoria(nomePessoa: "Ana Clara", textoMemoria: "Foi muito massa ver o rio da varanda da tua casa! No aguardo das proximas!", codigo: "1115", curtidas: 0),
                               Memoria(nomePessoa: "Mateus", textoMemoria: "Não sabia que Arqui cantava tão bem!!! Quero chamar ele pra minha banda", codigo: "1115", curtidas: 0),
                               Memoria(nomePessoa: "Igor", textoMemoria: "Quando tua prima caiu da bike KKKKKK foi muito engraçado", codigo: "1116", curtidas: 0),
                               Memoria(nomePessoa: "Daniela", textoMemoria: "Aquele bobó de camarão foi tudo pra reviver o rolê!!", codigo: "1116", curtidas: 0),
                               Memoria(nomePessoa: "Rafael", textoMemoria: "Queria pedir desculpas a quem eu possa ter ofendido... lembro de nada mas sei que foi massa!!", codigo: "1117", curtidas: 0)
                               
    ]
    
    func addMemoria(memoria: Memoria){
        self.memorias.append(memoria)
        
    }
    
    func mandaMemorias() -> [Memoria]{
        return self.memorias
    }
}
