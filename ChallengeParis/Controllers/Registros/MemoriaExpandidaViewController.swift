//
//  MemoriaExpandidaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 21/09/22.
//

import UIKit

class MemoriaExpandidaViewController: UIViewController {
    
    var titlelabel = ""
    var memoriaTexto = ""
    var idadeLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = MemoriaTelaCheiaView()
        self.view = primeiraView
        
        primeiraView.autorRelato.text = self.titlelabel
        primeiraView.relatoTexto.text = self.memoriaTexto
        primeiraView.idadeAutor.text = self.idadeLabel

        // Do any additional setup after loading the view.
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
