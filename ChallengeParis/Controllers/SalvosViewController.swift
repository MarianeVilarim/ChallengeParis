//
//  SalvosViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit

class SalvosViewController: UIViewController {

    let primeiraView: UIView! = ExibeRelatosView()
//    let primeiraView: UIView! = PopUp()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.view = primeiraView
         view.backgroundColor = .systemPurple
        
    }

    override func loadView() {
        //atribuicao da view que irá ser atribuida como view raiz no view controller
        // et view = UIView()
        
        //atribuicao da view inicializada no inicio da funcao
        self.view = primeiraView
        let labelSalvos = UILabel()
            labelSalvos.backgroundColor = .clear
            labelSalvos.numberOfLines = 2
            labelSalvos.font = UIFont( name:"Sora-SemiBold", size: 24)
            labelSalvos.textAlignment = .center
            labelSalvos.textColor = .white
            labelSalvos.text = "Salvos"
            self.navigationItem.titleView = labelSalvos
        
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    


}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct RelatosViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            SalvosViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            SalvosViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

