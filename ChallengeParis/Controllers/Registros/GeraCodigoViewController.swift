//
//  GeraCodigoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 16/09/22.
//

import UIKit

class GeraCodigoViewController: UIViewController {
    
    var codigoDaSalinha: String = ""
    let primeiraView = GeraCodigoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let iCloud = CloudKitViewController()
//        self.codigoDaSalinha = iCloud.codigoSalinha
        
        primeiraView.displayCodigo.text = codigoDaSalinha
        
        self.view = primeiraView
        
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)


        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
    }
    

    @objc func didUserTapButton() {
        print("chamou")
        var forumFestinha = ForumFestinhaViewController()
        forumFestinha.codigoRelato = primeiraView.displayCodigo.text!
        navigationController?.pushViewController(forumFestinha, animated: true)
    }
    
    
    

}
