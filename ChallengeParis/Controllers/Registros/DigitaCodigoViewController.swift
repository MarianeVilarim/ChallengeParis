//
//  DigitaCodigoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 17/09/22.
//

import UIKit

class DigitaCodigoViewController: UIViewController, UITextFieldDelegate {
    
    let primeiraView = DigitaCodigoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = primeiraView
        primeiraView.displayCodigo.delegate = self
        // Do any additional setup after loading the view.
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return primeiraView.displayCodigo.resignFirstResponder()

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
        print("chamou")
        
        let forumFestinha = ForumFestinhaViewController()
        forumFestinha.codigoRelato = primeiraView.displayCodigo.text!
        navigationController?.pushViewController(forumFestinha, animated: true)
    }
}
