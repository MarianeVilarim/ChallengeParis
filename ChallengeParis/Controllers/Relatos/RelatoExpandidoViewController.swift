//
//  RelatoExpandidoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 20/09/22.
//

import UIKit

class RelatoExpandidoViewController: UIViewController {
    
    var nomeAutor = ""
    var idadeAutor = ""
    var relatoTexto = ""
    var preco = ""
    var local = ""
    var categoria = ""
    var titulo = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = RelatoExpandido()
        self.view = primeiraView
        primeiraView.idadeAutor.text = self.idadeAutor
        primeiraView.autorRelato.text = self.nomeAutor
        primeiraView.relatoTexto.text = self.relatoTexto
        primeiraView.localButton.setTitle(self.local, for: .normal)
        primeiraView.categoriaButton.setTitle(self.categoria, for: .normal)
        primeiraView.precoButton.setTitle(self.preco, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
