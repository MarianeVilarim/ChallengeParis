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

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = PopUp()
        self.view = primeiraView
        
        if self.titleLabel != ""{
            primeiraView.titleLabel.text = self.titleLabel
            primeiraView.subtitleLabel.text = self.subtitleLabel
            primeiraView.gerarCodigoButton.isHidden = true

        }
        
        primeiraView.gerarCodigoButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton() {
        navigationController?.pushViewController(ForumFestinhaViewController(), animated: true)
        
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
