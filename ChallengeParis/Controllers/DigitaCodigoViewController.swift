//
//  DigitaCodigoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 17/09/22.
//

import UIKit

class DigitaCodigoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = DigitaCodigoView()
        self.view = primeiraView
        // Do any additional setup after loading the view.
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)
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
        navigationController?.pushViewController(ForumFestinhaViewController(), animated: true)
    }
}
