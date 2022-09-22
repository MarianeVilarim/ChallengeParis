//
//  ContaAniversarioViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 16/09/22.
//

import UIKit

class ContaAniversarioViewController: UIViewController {
    
    var variavelzinha = ""
    let primeiraView = ContaAniversarioView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = primeiraView
        
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)
        print(variavelzinha)
      
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func didUserTapButton() {
        
        let areFieldsEmpty = primeiraView.areFieldsEmpty()
        let popUp = PopUpViewController()

        if areFieldsEmpty == true {
            popUp.titleLabel = "Falha registrar seu rolê"
            popUp.subtitleLabel = "Por favor, preencha todos os campos."
        }
        else {
            let codigoFestinha = primeiraView.codigoRelato()
            popUp.codigoDaSalinha = codigoFestinha
            navigationController?.show(popUp, sender: self)
        }


        
}


}
