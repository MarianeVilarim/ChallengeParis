//
//  GeraCodigoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 16/09/22.
//

import UIKit

class GeraCodigoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = GeraCodigoView()
        self.view = primeiraView
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)


        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
    }
    

    @objc func didUserTapButton() {
        print("chamou")
        navigationController?.pushViewController(ForumFestinhaViewController(), animated: true)
    }

}
