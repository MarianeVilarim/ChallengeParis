//
//  PopUpViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 22/09/22.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var titleLabel = ""
    var subtitleLabel = ""
    var botaoSalinha = UIButton()
    var codigoDaSalinha = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = PopUp()
        self.view = primeiraView
        
        if self.titleLabel != ""{
            primeiraView.titleLabel.text = self.titleLabel
            primeiraView.subtitleLabel.text = self.subtitleLabel
            primeiraView.gerarCodigoButton.isHidden = true

        }
        primeiraView.gerarCodigoButton.isHidden = false
        primeiraView.gerarCodigoButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton() {
        print("mandou ir pra outra viewC")
        let geraCodigo = GeraCodigoViewController()
        geraCodigo.codigoDaSalinha = self.codigoDaSalinha
        navigationController?.pushViewController(geraCodigo, animated: true)
        
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
