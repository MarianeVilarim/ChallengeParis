//
//  OnboardingInfo.swift
//  dor
//
//  Created by MLaura on 20/09/22.
//

import UIKit

class OnboardingInfo {
    let titulo: String
    let backgroundImage: UIImage
    let mainImage:UIImage
    let texto: String
    let botaoVisivel: Bool
    
    init (titulo: String, texto: String, botaoVisivel: Bool, backgroundImage: UIImage, mainImage: UIImage
    ){
        self.titulo = titulo
        self.backgroundImage = backgroundImage
        self.mainImage = mainImage
        self.texto = texto
        self.botaoVisivel = botaoVisivel
      
    }
}
